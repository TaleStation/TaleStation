/// Dispensers.

/obj/structure/item_dispenser
	name = "empty item dispenser"
	desc = "A small wall-mounted receptacle which can dispense a specific item."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_generic"
	anchored = TRUE
	density = FALSE
	max_integrity = 200
	integrity_failure = 0.25
	/// If the dispenser has been set to an item.
	var/stocked = FALSE
	/// How many items this dispenser can hold.
	var/charges = 7
	/// What item is inside the dispenser
	var/obj/item/stock
	/// The name of the item in the dispenser.
	var/item_name = ""

/obj/structure/item_dispenser/examine(mob/user)
	. = ..()
	if(!stocked)
		. += span_notice("Peering inside, the plastic hasn't been molded to an item yet. It looks like any small item would fit.")
		. += span_notice("Right-Clicking with a screwdriver, you could probably adjust the spring to allow a certain amount of items inside.")
		return
	if(contents.len == 1)
		. += span_notice("There is 1 [item_name] remaining.")
	if(contents.len > 1)
		. += span_notice("There are [contents.len] [item_name][plural_s(item_name)] remaining.")
	if(!contents.len)
		. += span_notice("It's empty!")
		. += span_notice("Right-Clicking with a wrench, you could take it off the wall now!")

/obj/structure/item_dispenser/update_overlays()
	. = ..()
	if(contents.len > 0)
		. += "[initial(icon_state)]_full"

/obj/structure/item_dispenser/proc/register_name()
	item_name = initial(stock.name)
	name = "[item_name] dispenser"
	desc = "A small wall-mounted receptacle which dispenses [item_name][plural_s(item_name)] and similar items."

/obj/structure/item_dispenser/Initialize(mapload)
	. = ..()
	create_storage()
	if(stocked) // Used instead of mapload in case anyone wants to leave empty item dispensers in their maps
		register_name()
		create_contents()
	update_icon(UPDATE_OVERLAYS)
	storage_update()

/obj/structure/item_dispenser/proc/create_contents()
	if(!stocked)
		return
	for(var/i = 1 to atom_storage.max_slots)
		new stock(src)

/obj/structure/item_dispenser/proc/storage_update()
	if(stocked)
		atom_storage.rustle_sound = FALSE
		atom_storage.max_slots = charges
		atom_storage.set_holdable(list(stock))
		atom_storage.max_total_storage = 30

/obj/structure/item_dispenser/attackby(obj/item/I, mob/user, params)
	if(istype(I, stock))
		if(contents.len < charges)
			playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
			src.atom_storage.attempt_insert(src, I, user, TRUE)
			contents += I
			balloon_alert(user, "inserted [I]")
			if(contents.len == 1)
				update_icon(UPDATE_OVERLAYS)
			return
		else
			to_chat(user, span_warning("You can't fit [item_name] into [src]!"))
			return
	if(!stocked)
		if(I.w_class <= WEIGHT_CLASS_SMALL)
			stock = I.type
			stocked = TRUE
			storage_update()
			playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
			src.atom_storage.attempt_insert(src, I, user, TRUE)
			contents += I
			to_chat(user, span_notice("You insert [I] into [src], causing the inner plastic to mold to its shape."))
			register_name()
			if(contents.len == 1)
				update_icon(UPDATE_OVERLAYS)
		else
			to_chat(user, span_warning("[I] is too big to fit in [src]!"))
		return
	return ..()

/obj/structure/item_dispenser/attackby_secondary(obj/item/I, mob/user, params)
	if(!stocked && I.tool_behaviour == TOOL_SCREWDRIVER)
		var/changed_charges = input(user, "Input amount of items this dispenser can allow. It must be an amount between 1 and 8.", "Item Dispenser") as num|null
		if(changed_charges > 8) // Stops people from being shitters
			changed_charges = 8
		if(changed_charges < 1) // I don't even know WHY someone would want it to be zero
			changed_charges = 1
		to_chat(user, span_notice("You start fiddling with the spring mechanism..."))
		I.play_tool_sound(src)
		if(I.use_tool(src, user, 1 SECONDS))
			charges = changed_charges
			to_chat(user, span_notice("You make enough room in the dispenser to hold roughly [charges] item\s."))
			return
		else
			to_chat(user, span_warning("Your fingers slip, causing the spring to return to its previous position!"))
			return
	if(I.tool_behaviour == TOOL_WRENCH)
		if(!contents.len)
			to_chat(user, span_notice("You start unsecuring [src]..."))
			I.play_tool_sound(src)
			if(I.use_tool(src, user, 1 SECONDS))
				playsound(loc, 'sound/items/deconstruct.ogg', 50, TRUE)
				to_chat(user, span_notice("You unsecure [src]."))
				new /obj/item/wallframe/item_dispenser(get_turf(src))
				qdel(src)
			return
		else
			to_chat(user, span_warning("[src] needs to be empty to be deconstructed!"))
			return
	return ..()

/obj/structure/item_dispenser/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(!user.can_perform_action(src, NEED_DEXTERITY|NEED_HANDS))
		return
	if(!stocked)
		to_chat(user, span_notice("[src] hasn't been stocked yet!"))
		return
	var/obj/item/grabbies = locate(stock) in contents
	if(grabbies && contents.len > 0)
		src.atom_storage?.attempt_remove(grabbies, user)
		user.put_in_hands(grabbies)
		contents -= grabbies
		balloon_alert(user, "took [item_name]")
		playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
		if(contents.len <= 0)
			update_icon(UPDATE_OVERLAYS)
	else
		to_chat(user, span_warning("There are no [item_name][plural_s(item_name)] left in [src]."))

/// Pre-set Dispensers

/obj/structure/item_dispenser/glasses
	icon_state = "dispenser_glasses"
	stock = /obj/item/clothing/glasses/regular
	stocked = TRUE

/obj/structure/item_dispenser/handcuffs
	icon_state = "dispenser_handcuffs"
	stock = /obj/item/restraints/handcuffs
	stocked = TRUE

/obj/structure/item_dispenser/latex
	icon_state = "dispenser_gloves"
	stock = /obj/item/clothing/gloves/latex
	stocked = TRUE

/obj/structure/item_dispenser/mask
	icon_state = "dispenser_mask"
	stock = /obj/item/clothing/mask/surgical
	stocked = TRUE

/obj/structure/item_dispenser/id
	icon_state = "dispenser_id"
	stock = /obj/item/card/id
	stocked = TRUE

/obj/structure/item_dispenser/radio
	icon_state = "dispenser_radio"
	stock = /obj/item/radio
	charges = 3
	stocked = TRUE

/obj/structure/item_dispenser/bodybag
	icon_state = "dispenser_bodybag"
	stock = /obj/item/bodybag
	stocked = TRUE

/// Empty Dispenser Wallframes

/obj/structure/item_dispenser/glasses/empty
	icon_state = "dispenser_glasses"
	stock = /obj/item/clothing/glasses/regular
	stocked = FALSE

/obj/structure/item_dispenser/handcuffs/empty
	icon_state = "dispenser_handcuffs"
	stock = /obj/item/restraints/handcuffs
	stocked = FALSE

/obj/structure/item_dispenser/latex/empty
	icon_state = "dispenser_gloves"
	stock = /obj/item/clothing/gloves/latex
	stocked = FALSE

/obj/structure/item_dispenser/mask/empty
	icon_state = "dispenser_mask"
	stock = /obj/item/clothing/mask/surgical
	stocked = FALSE

/obj/structure/item_dispenser/id/empty
	icon_state = "dispenser_id"
	stock = /obj/item/card/id
	stocked = FALSE

/obj/structure/item_dispenser/radio/empty
	icon_state = "dispenser_radio"
	stock = /obj/item/radio
	charges = 3
	stocked = FALSE

/obj/structure/item_dispenser/bodybag/empty
	icon_state = "dispenser_bodybag"
	stock = /obj/item/bodybag
	stocked = FALSE

/// Dispenser in-hand item

/obj/item/wallframe/item_dispenser
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenserframe"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser
	pixel_shift = 30

/// In-hand Dispensers

/obj/item/wallframe/item_dispenser/glasses
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_glasses"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser/glasses
	var/stocked = FALSE
	pixel_shift = 30

/obj/item/wallframe/item_dispenser/handcuffs
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_handcuffs"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser/handcuffs
	var/stocked = FALSE
	pixel_shift = 30

/obj/item/wallframe/item_dispenser/latex
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_gloves"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser/latex
	var/stocked = FALSE
	pixel_shift = 30

/obj/item/wallframe/item_dispenser/mask
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_mask"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser/mask
	var/stocked = FALSE
	pixel_shift = 30

/obj/item/wallframe/item_dispenser/id
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_id"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser/id
	var/stocked = FALSE
	pixel_shift = 30

/obj/item/wallframe/item_dispenser/radio
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_radio"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser/radio
	var/stocked = FALSE
	pixel_shift = 30

/obj/item/wallframe/item_dispenser/bodybag
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon = 'talestation_modules/icons/obj/itemdispenser.dmi'
	icon_state = "dispenser_bodybag"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser/bodybag
	var/stocked = FALSE
	pixel_shift = 30

/obj/item/wallframe/item_dispenser/attack_self(mob/user)
	var/dispenser_images = list(
		"any" = image(icon = src.icon, icon_state = "dispenser_generic"),
		"glasses" = image(icon = src.icon, icon_state = "dispenser_glasses"),
		"handcuffs" = image(icon = src.icon, icon_state = "dispenser_handcuffs"),
		"latex" = image(icon = src.icon, icon_state = "dispenser_gloves"),
		"mask" = image(icon = src.icon, icon_state = "dispenser_mask"),
		"id" = image(icon = src.icon, icon_state = "dispenser_id"),
		"radio" = image(icon = src.icon, icon_state = "dispenser_radio"),
		"bodybag" = image(icon = src.icon, icon_state = "dispenser_bodybag")
		)
	var/dispenser_types = list()
	dispenser_types["any"] = "dispenser_generic"
	dispenser_types["glasses"] = "dispenser_glasses"
	dispenser_types["handcuffs"] = "dispenser_handcuffs"
	dispenser_types["latex"] = "dispenser_gloves"
	dispenser_types["mask"] = "dispenser_mask"
	dispenser_types["id"] = "dispenser_id"
	dispenser_types["radio"] = "dispenser_radio"
	dispenser_types["bodybag"] = "dispenser_bodybag"

	var/choice = show_radial_menu(user,src, dispenser_images, tooltips = FALSE)

	if(!choice)
		return FALSE

	if(src && choice)
		switch(choice)
			if("any")
				result_path = text2path("/obj/structure/item_dispenser")
			else
				result_path = text2path("/obj/structure/item_dispenser/[choice]/empty")
				icon_state = dispenser_types[choice]
