// Modular hydro items

// - - XenoBotany Items - -

//XenoBotany Analyzer
/obj/item/xeno_analyzer
	name = "xeno agriculture analyzer"
	desc = "A scanner used to scan xeno agriculture, unearthing their mysteries."
	icon = 'icons/obj/device.dmi'
	icon_state = "hydro"
	inhand_icon_state = "analyzer"
	worn_icon_state = "plantanalyzer"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BELT
	// Vars for TGUI
	var/health = 0
	var/water_level = 0
	var/instability = 0
	var/fertilizer = 0
	var/light_level = 0
	var/pests = 0
	var/plant_name
	var/plant_desc
	var/researched = FALSE
	var/saved_image

	var/max_nutri = 0
	var/max_water = 0

// Xeno analyzer check, to check only on xeno trays
/obj/item/xeno_analyzer/pre_attack(target, mob/user)
	if(istype(target, /obj/machinery/hydroponics/xeno_tray))
		do_plant_stats_scan(target, user)
		return TRUE

// This check is here for modularity sake, disables regular analyzers from being used
/obj/item/plant_analyzer/pre_attack(target, mob/user)
	if(is_type_in_list(target, list(/obj/machinery/hydroponics/constructable, /obj/machinery/hydroponics/soil)))
		do_plant_stats_scan(target, user)
		return TRUE

/obj/item/xeno_analyzer/proc/do_plant_stats_scan(obj/machinery/hydroponics/xeno_tray/target, mob/user)
	health = target.plant_health
	water_level = target.waterlevel
	fertilizer = target?.reagents.total_volume
	var/turf/location = get_turf(target)
	light_level = location.get_lumcount()
	pests = target.pestlevel
	max_water = target.maxwater
	max_nutri = target.maxnutri
	saved_image = icon2base64(getFlatIcon(target, defdir = SOUTH, no_anim = TRUE))
	if(target.myseed)
		instability = target.myseed.instability
		plant_name = target.myseed.plantname
		plant_desc = target.myseed.desc
		// researched = target.myseed.researched
	to_chat(user, span_notice("[src] reads \"Plant tray examined successfully, look at the screen for details.\""))
	user.balloon_alert(user, "tray scanned")

/obj/item/xeno_analyzer/attack_self(mob/user)
	ui_interact(user)

/obj/item/xeno_analyzer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "XenoAnalyzer")
		ui.open()

// TGUI data
/obj/item/xeno_analyzer/ui_data(mob/user)
	var/list/data = list()
	data["health"] = health
	data["water_level"] = water_level
	data["instability"] = instability
	data["fertilizer"] = fertilizer
	data["light_level"] = light_level
	data["pests"] = pests
	data["plant_name"] = plant_name
	data["plant_desc"] = plant_desc
	data["researched"] = researched
	data["plant_appearance"] = saved_image

	data["max_water"] = max_water
	data["max_nutri"] = max_nutri

	return data
