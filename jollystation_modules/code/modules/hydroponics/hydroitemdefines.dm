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
	var/health = 0
	var/water_level = 0
	var/instablity = 0
	var/fertilizer = 0
	var/light_level = "null"
	var/pests = "null"

/obj/item/xeno_analyzer/pre_attack(target, mob/user)
	if(istype(target, /obj/machinery/hydroponics/xeno_tray))
		ui_interact(user)
		return
	to_chat(user, span_warning("[src] reads 'Invalid object.'"))

/obj/item/xeno_analyzer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "XenoAnalyzer")
		ui.open()

/obj/item/xeno_analyzer/ui_data(mob/user)
	var/list/data = list()
	data["aaa"] = aaa
	data["color"] = color

	return data

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
