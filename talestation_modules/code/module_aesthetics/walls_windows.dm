/*
* Window icon override
*/

/obj/structure/window
	icon = 'talestation_modules/icons/obj/directwindow.dmi'

/obj/machinery/door/window
	icon = 'talestation_modules/icons/obj/directwindow.dmi'

/obj/structure/window/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/window.dmi'
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE)
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/reinforced/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/r_window.dmi'
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE)
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/reinforced/tinted/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/r_window_tinted.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE)
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/plasma/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/window_plasma.dmi'
	icon_state = "window-0"
	base_icon_state = "window"
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE)
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE)

/obj/structure/window/reinforced/plasma/fulltile
	icon = 'talestation_modules/icons/obj/smooth_structures/r_window_plasma.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	smoothing_groups = list(SMOOTH_GROUP_WINDOW_FULLTILE)
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE)

/*
* Wall icon overrides
*/
/turf/closed/wall
	icon = 'talestation_modules/icons/turf/walls/wall.dmi'
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_AIRLOCK)

/turf/closed/wall/r_wall
	icon = 'talestation_modules/icons/turf/walls/reinforced_wall.dmi'

/turf/closed/wall/rust
	icon = 'talestation_modules/icons/turf/walls/wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/r_wall/rust
	icon = 'talestation_modules/icons/turf/walls/reinforced_wall.dmi'
	icon_state = "reinforced_wall-0"
	base_icon_state = "reinforced_wall"

/turf/closed/wall/rust/New(loc, ...)
	. = ..()
	var/mutable_appearance/rust = mutable_appearance(icon, "rust")
	add_overlay(rust)

/turf/closed/wall/r_wall/rust/New(loc, ...)
	. = ..()
	var/mutable_appearance/rust = mutable_appearance(icon, "rust")
	add_overlay(rust)
