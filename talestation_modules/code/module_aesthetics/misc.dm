// Misc overrides

// Camera icon override
/obj/item/camera
	icon = 'talestation_modules/icons/obj/items_and_weapons.dmi'

// Disposal bin icon override
/obj/machinery/disposal
	icon = 'talestation_modules/icons/obj/atmospherics/pipes/disposals.dmi'

// Nav beacon icon override
/obj/machinery/spaceship_navigation_beacon
	icon = 'talestation_modules/icons/obj/spaceship_navigation_beacon.dmi'

// Bucket icon override
/obj/item/reagent_containers/cup/bucket
	icon = 'talestation_modules/icons/obj/janitor.dmi'

// Water tank icon override
/obj/structure/reagent_dispensers/watertank
	icon = 'talestation_modules/icons/obj/chemical_tanks.dmi'

// Plumbed tank icon override
/obj/structure/reagent_dispensers/plumbed
	icon = 'talestation_modules/icons/obj/chemical_tanks.dmi'

// Fuel tank icon override
/obj/structure/reagent_dispensers/fueltank
	icon = 'talestation_modules/icons/obj/chemical_tanks.dmi'

// Foam tank icon override
/obj/structure/reagent_dispensers/foamtank
	icon = 'talestation_modules/icons/obj/chemical_tanks.dmi'

// Camera icon override
/obj/machinery/camera
	icon = 'talestation_modules/icons/obj/machines/camera.dmi'

// Camera wallframe icon override
/obj/item/wallframe/camera
	icon = 'talestation_modules/icons/obj/machines/camera.dmi'

// Camera assembly icon override
/obj/structure/camera_assembly
	icon = 'talestation_modules/icons/obj/machines/camera.dmi'

// T-Ray scanner icon override
/obj/item/t_scanner/adv_mining_scanner
	icon = 'icons/obj/device.dmi'

// Buttton icon override
/obj/machinery/button
	icon = 'talestation_modules/icons/obj/buttons.dmi'
	var/light_mask = "button-light-mask"

// Button overlay override
/obj/machinery/button/door/update_overlays()
	. = ..()
	if(!light_mask)
		return

	SSvis_overlays.remove_vis_overlay(src, managed_vis_overlays)
	if(!(machine_stat & (NOPOWER|BROKEN)) && !panel_open)
		SSvis_overlays.add_vis_overlay(src, icon, light_mask, 0, EMISSIVE_PLANE)

// Airlock controller icon override
/obj/machinery/embedded_controller/radio/airlock_controller
	icon = 'talestation_modules/icons/obj/airlock_machines.dmi'

// Button icon override
/obj/machinery/door_buttons/access_button
	icon = 'talestation_modules/icons/obj/airlock_machines.dmi'

// Airlock controller icon override
/obj/machinery/door_buttons/airlock_controller
	icon = 'talestation_modules/icons/obj/airlock_machines.dmi'

// Vent controller override
/obj/machinery/embedded_controller/radio/simple_vent_controller
	icon = 'talestation_modules/icons/obj/airlock_machines.dmi'

// Fire alarm icon override
/obj/machinery/firealarm
	icon = 'talestation_modules/icons/obj/firealarm.dmi'

// Light switch icon override
/obj/machinery/light_switch/interact(mob/user)
	. = ..()
	playsound(src, 'talestation_modules/sound/machines/lights/lightswitch.ogg', 100, 1)

// Associated code
/obj/machinery/light_switch/LateInitialize()
	. = ..()
	if(prob(50)) //50% chance for an area to have their lights flipped.
		set_lights(!area.lightswitch)

// Request console icon override
/obj/machinery/requests_console
	icon = 'talestation_modules/icons/obj/requests.dmi'

// Shield gen icon override
/obj/machinery/power/shieldwallgen
	icon = 'talestation_modules/icons/obj/shieldgen.dmi'

// Space heater icon override
/obj/machinery/space_heater
	icon = 'talestation_modules/icons/obj/heater.dmi'

// Status display icon override

/obj/machinery/status_display
	icon = 'talestation_modules/icons/obj/status_display.dmi'

/obj/machinery/status_display/Initialize(mapload)
	. = ..()
	set_picture("default")

/obj/machinery/status_display/syndie
	name = "syndicate status display"

/obj/machinery/status_display/syndie/Initialize(mapload)
	. = ..()
	set_picture("synd")

// Washing machine icon override
/obj/machinery/washing_machine
	icon = 'talestation_modules/icons/obj/machines/washing_machine.dmi'

// Geiger counter icon override
/obj/item/geiger_counter
	icon = 'talestation_modules/icons/obj/device.dmi'

// GPS icon override
/obj/item/gps
	icon = 'talestation_modules/icons/obj/telescience.dmi'

// Multitool icon override
/obj/item/multitool
	icon = 'talestation_modules/icons/obj/device.dmi'

// Intercom icon override
/obj/item/radio/intercom
	icon = 'talestation_modules/icons/obj/intercom.dmi'

// Intercom wall frame incon override
/obj/item/wallframe/intercom
	icon = 'talestation_modules/icons/obj/intercom.dmi'

// T-Scanner icon override
/obj/item/t_scanner
	icon = 'talestation_modules/icons/obj/device.dmi'

// BS ore icon override
/obj/item/stack/ore/bluespace_crystal
	icon = 'talestation_modules/icons/obj/telescience.dmi'

// BS crystal icon override
/obj/item/stack/sheet/bluespace_crystal
	icon = 'talestation_modules/icons/obj/telescience.dmi'

/*
* Material icon override
*/
/obj/item/stack/sheet/iron
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plasteel
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plasmaglass
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plasmarglass
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/glass
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/rglass
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plastic
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/plasma
	icon = 'talestation_modules/icons/obj/stack_objects.dmi'

// Telecrystal icon override
/obj/item/stack/telecrystal
	icon = 'talestation_modules/icons/obj/telescience.dmi'

/*
* Bed icon overrides
*/
/obj/structure/bed/double
	name = "double bed"
	icon_state = "doublebed"
	icon = 'talestation_modules/icons/obj/furniture.dmi'

/obj/item/bedsheet/double
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	icon_state = "doublesheet"
	slot_flags = null

/obj/item/bedsheet/blue/double
	icon_state = "doublesheetblue"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/green/double
	icon_state = "doublesheetgreen"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null


/obj/item/bedsheet/orange/double
	icon_state = "doublesheetorange"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/purple/double
	icon_state = "doublesheetpurple"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/rainbow/double //all the way across the sky.
	icon_state = "doublesheetrainbow"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/red/double
	icon_state = "doublesheetred"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/yellow/double
	icon_state = "doublesheetyellow"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/mime/double
	icon_state = "doublesheetmime"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/clown/double
	icon_state = "doublesheetclown"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/captain/double
	icon_state = "doublesheetcaptain"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/rd/double
	icon_state = "doublesheetrd"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/hos/double
	icon_state = "doublesheethos"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/hop/double
	icon_state = "doublesheethop"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/ce/double
	icon_state = "doublesheetce"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/brown/double
	icon_state = "doublesheetbrown"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/ian/double
	icon_state = "doublesheetian"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/centcom/double
	icon_state = "doublesheetcc"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/nanotrasen/double
	icon_state = "doublesheetNT"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/qm/double
	icon_state = "doublesheetqm"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/item/bedsheet/cmo/double
	icon_state = "doublesheetCMO"
	icon = 'talestation_modules/icons/obj/bedsheets.dmi'
	slot_flags = null

/obj/structure/bed/roller
	icon = 'talestation_modules/icons/obj/rollerbed.dmi'

/obj/item/roller
	icon = 'talestation_modules/icons/obj/rollerbed.dmi'

/*
* Chair icon overrides
*/
/obj/structure/chair
	icon = 'talestation_modules/icons/obj/chairs.dmi'

/obj/item/chair
	icon = 'talestation_modules/icons/obj/chairs.dmi'

/*
* Crate icon overrides
*/

/obj/structure/closet/crate
	icon = 'talestation_modules/icons/obj/crates.dmi'

/obj/structure/big_delivery
	icon = 'talestation_modules/icons/obj/crates.dmi'

/obj/item/small_delivery
	icon = 'talestation_modules/icons/obj/crates.dmi'

//Rather than have duplicate icons in our DMI for all of these, we just make sure these pull from the old file.
/obj/structure/closet/crate/bin
	icon = 'icons/obj/storage/crates.dmi'

/obj/structure/closet/crate/grave
	icon = 'icons/obj/storage/crates.dmi'

/obj/structure/closet/crate/necropolis
	icon = 'icons/obj/storage/crates.dmi'

/obj/structure/closet/crate/trashcart/laundry
	icon = 'icons/obj/storage/crates.dmi'

/obj/structure/closet/crate/mail
	icon = 'icons/obj/storage/crates.dmi'

/obj/structure/closet/crate/coffin
	icon = 'icons/obj/storage/crates.dmi'

/obj/structure/closet/crate/cardboard
	icon = 'icons/obj/storage/crates.dmi'

// Dresser icon override
/obj/structure/dresser
	icon = 'talestation_modules/icons/obj/stationobjs.dmi'

/*
* Extiinsguier icon override + code
*/
/obj/structure/extinguisher_cabinet
	icon = 'talestation_modules/icons/obj/extinguisher.dmi'
	icon_state = "extinguisher_standard_closed"

/obj/item/wallframe/extinguisher_cabinet
	icon = 'talestation_modules/icons/obj/extinguisher.dmi'

/obj/item/extinguisher
	icon = 'talestation_modules/icons/obj/extinguisher.dmi'
	var/random_overlay = 0

/obj/structure/extinguisher_cabinet/Initialize(mapload, ndir, building)
	. = ..()
	update_icon()


/obj/structure/extinguisher_cabinet/update_icon_state()
	. = ..()
	if(!opened)
		if(stored_extinguisher)
			if(istype(stored_extinguisher, /obj/item/extinguisher/mini))
				icon_state = "extinguisher_mini_closed"
			else if(istype(stored_extinguisher, /obj/item/extinguisher/advanced))
				icon_state = "extinguisher_advanced_closed"
			else
				icon_state = "extinguisher_standard_closed"
		else
			icon_state = "extinguisher_empty_closed"
	else if(stored_extinguisher)
		if(istype(stored_extinguisher, /obj/item/extinguisher/mini))
			icon_state = "extinguisher_mini_open"
		else if(istype(stored_extinguisher, /obj/item/extinguisher/advanced))
			icon_state = "extinguisher_advanced_open"
		else
			icon_state = "extinguisher_standard_open"
	else
		icon_state = "extinguisher_empty_open"

/obj/item/extinguisher/Initialize(mapload)
	. = ..()
	random_overlay = rand(1, 6)
	update_icon()

/obj/item/extinguisher/update_overlays()
	. = ..()
	if(!istype(src, /obj/item/extinguisher/mini) && !istype(src, /obj/item/extinguisher/advanced))
		. += "ex_overlay_[random_overlay]"

// Mop bucket icon override
/obj/structure/mopbucket
	icon = 'talestation_modules/icons/obj/janitor.dmi'

// Plastic flaps icon override
/obj/structure/plasticflaps
	icon = 'talestation_modules/icons/obj/plasticflaps.dmi'

/*
* Tables and racks icon overrides
*/
/obj/structure/rack
	icon = 'talestation_modules/icons/obj/rack.dmi'

/obj/structure/rack/shelf
	name = "shelf"
	desc = "A shelf, for storing things on. Conveinent!"
	icon = 'talestation_modules/icons/obj/rack.dmi'
	icon_state = "shelf"

/obj/item/gun
	var/on_rack = FALSE

/obj/item/gun/proc/place_on_rack()
	on_rack = TRUE
	var/matrix/M = matrix()
	M.Turn(-90)
	transform = M

/obj/item/gun/proc/remove_from_rack()
	if(on_rack)
		var/matrix/M = matrix()
		transform = M
		on_rack = FALSE

/obj/item/gun/pickup(mob/user)
	. = ..()
	remove_from_rack()

/obj/structure/rack/gunrack
	name = "gun rack"
	desc = "A gun rack for storing guns."
	icon_state = "gunrack"

/obj/structure/rack/gunrack/Initialize(mapload)
	. = ..()
	if(mapload)
		for(var/obj/item/I in loc.contents)
			if(istype(I, /obj/item/gun))
				var/obj/item/gun/to_place = I
				to_place.place_on_rack()

/obj/structure/rack/gunrack/attackby(obj/item/W, mob/living/user, params)
	var/list/modifiers = params2list(params)
	if (W.tool_behaviour == TOOL_WRENCH && !(flags_1&NODECONSTRUCT_1) && LAZYACCESS(modifiers, RIGHT_CLICK))
		W.play_tool_sound(src)
		deconstruct(TRUE)
		return
	if(user.combat_mode)
		return ..()
	if(user.transferItemToLoc(W, drop_location()))
		if(istype(W, /obj/item/gun))
			var/obj/item/gun/our_gun = W
			our_gun.place_on_rack()
			our_gun.pixel_x = rand(-10, 10)
		return TRUE

// Operating table icon override
/obj/structure/table/optable
	icon = 'talestation_modules/icons/obj/surgery.dmi'

// Experimentor icon override
/obj/machinery/rnd/experimentor
	icon = 'talestation_modules/icons/obj/heavy_lathe.dmi'

/*
* Stock parts icon override
*/
//TIER 1
/obj/item/stock_parts/capacitor
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/manipulator
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/micro_laser
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/matter_bin
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/scanning_module
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

//TIER 2

/obj/item/stock_parts/capacitor/adv
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/scanning_module/adv
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/manipulator/nano
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/micro_laser/high
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/matter_bin/adv
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

//TIER 3

/obj/item/stock_parts/capacitor/super
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/scanning_module/phasic
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/manipulator/pico
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/micro_laser/ultra
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/matter_bin/super
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

//TIER 4

/obj/item/stock_parts/capacitor/quadratic
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/scanning_module/triphasic
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/manipulator/femto
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/micro_laser/quadultra
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

/obj/item/stock_parts/matter_bin/bluespace
	icon = 'talestation_modules/icons/obj/stock_parts.dmi'

// Wallmed icon override
/obj/machinery/vending/wallmed
	icon = 'talestation_modules/icons/obj/wallmed.dmi'
