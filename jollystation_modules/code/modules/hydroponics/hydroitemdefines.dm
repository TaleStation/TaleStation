//Modular hydro items

//XenoBotany Items

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
	var/light_level = "null"
	var/pests = "null"
	var/plant_name = "null"
	var/researched = "null"

var/list/analyzer_data = list()

/obj/item/xeno_analyzer/pre_attack(target, mob/user)
	if(istype(target, /obj/machinery/hydroponics/xeno_tray))
		do_plant_stats_scan(target, user)
		return TRUE
	to_chat(user, span_warning("[src] reads 'Invalid object.'"))
	return TRUE

/obj/item/xeno_analyzer/proc/do_plant_stats_scan(atom/target, mob/user)
	ui_interact(user)

/obj/item/xeno_analyzer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "XenoAnalyzer")
		ui.open()

/obj/item/xeno_analyzer/ui_data(mob/user)
	var/list/data = list()
	data["health"] = health
	data["water_level"] = water_level
	data["instability"] = instability
	data["fertilizer"] = fertilizer
	data["light_level"] = light_level
	data["pests"] = pests
	data["plant_name"] = plant_name
	data["researched"] = researched

	return data
/*
/obj/item/xeno_analyzer/ui_act(action, list/params)
	. = ..()
	if(.)
		return
	if(action == "change_color")
		var/new_color = params["color"]
		if(!(color in allowed_colors))
			return FALSE
		color = new_color
		. = TRUE
	update_icon()
*/
