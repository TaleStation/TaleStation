// Modular window access

/obj/structure/window
	icon = 'talestation_modules/icons/obj/directwindow.dmi'

/obj/machinery/door/window
	icon = 'talestation_modules/icons/obj/directwindow.dmi'

/obj/structure/window/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/window.dmi'
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE, SMOOTH_GROUP_SHUTTLE_PARTS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/reinforced/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/r_window.dmi'
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE, SMOOTH_GROUP_SHUTTLE_PARTS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/reinforced/tinted/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/r_window_tinted.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE, SMOOTH_GROUP_SHUTTLE_PARTS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/plasma/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/window_plasma.dmi'
	icon_state = "window-0"
	base_icon_state = "window"
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE, SMOOTH_GROUP_SHUTTLE_PARTS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/reinforced/plasma/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/r_window_plasma.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE_SHUTTLE, SMOOTH_GROUP_SHUTTLE_PARTS, SMOOTH_GROUP_WINDOW_FULLTILE)
