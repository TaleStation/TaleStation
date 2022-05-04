// Modular window access

/obj/structure/window
	icon = 'jollystation_modules/icons/obj/directwindow.dmi'

/obj/machinery/door/window
	icon = 'jollystation_modules/icons/obj/directwindow.dmi'

/obj/structure/window/fulltile
	icon = 'jollystation_modules/icons/obj/smooth_structures/window.dmi'
	canSmoothWith = list(SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_AIRLOCK)

/obj/structure/window/reinforced/fulltile
	icon = 'jollystation_modules/icons/obj/smooth_structures/r_window.dmi'
	canSmoothWith = list(SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_AIRLOCK)

/obj/structure/window/reinforced/tinted/fulltile
	icon = 'jollystation_modules/icons/obj/smooth_structures/r_window_tinted.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	canSmoothWith = list(SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_AIRLOCK)

/obj/structure/window/plasma/fulltile
	icon = 'jollystation_modules/icons/obj/smooth_structures/window_plasma.dmi'
	icon_state = "window-0"
	base_icon_state = "window"
	canSmoothWith = list(SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_AIRLOCK)

/obj/structure/window/reinforced/plasma/fulltile
	icon = 'jollystation_modules/icons/obj/smooth_structures/r_window_plasma.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	canSmoothWith = list(SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_AIRLOCK)
