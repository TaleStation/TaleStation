// --- Loadout item datums for under suits ---

/// Underslot - Jumpsuit Items (Deletes overrided items)
/datum/loadout_category/undersuit
	category_name = "Jumpsuit"
	category_ui_icon = FA_ICON_SHIRT
	type_to_generate = /datum/loadout_item/under/jumpsuit
	tab_order = /datum/loadout_category/head::tab_order + 10

/datum/loadout_item/under
	abstract_type = /datum/loadout_item/under

/datum/loadout_item/under/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(isplasmaman(equipper))
		if(!visuals_only)
			to_chat(equipper, "Your loadout uniform was not equipped directly due to your envirosuit.")
			LAZYADD(outfit.backpack_contents, item_path)
	else
		outfit.uniform = item_path

// jumpsuit undersuits
/datum/loadout_item/under/jumpsuit
	abstract_type = /datum/loadout_item/under/jumpsuit

/datum/loadout_item/under/jumpsuit/greyscale
	name = "Colorable Jumpsuit"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/under/color/greyscale

/datum/loadout_item/under/jumpsuit/greyscale_skirt
	name = "Colorable Jumpskirt"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/under/color/jumpskirt/greyscale

/datum/loadout_item/under/jumpsuit/rainbow
	name = "Rainbow Jumpsuit"
	item_path = /obj/item/clothing/under/color/rainbow

/datum/loadout_item/under/jumpsuit/rainbow_skirt
	name = "Rainbow Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/rainbow

