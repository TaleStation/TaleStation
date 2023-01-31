/atom/movable/screen/escape_menu/leave_body_button/Initialize(mapload, button_text)
	. = ..()
	if (button_text == "Suicide")
		return INITIALIZE_HINT_QDEL
