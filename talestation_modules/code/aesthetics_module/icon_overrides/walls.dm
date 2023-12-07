/*
* Regular Walls
*/

/turf/closed/wall
	icon = 'talestation_modules/icons/mapping/walls/wall.dmi'
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/turf/closed/wall/r_wall
	icon = 'talestation_modules/icons/mapping/walls/reinforced_wall.dmi'

/turf/closed/wall/rust
	icon = 'talestation_modules/icons/mapping/walls/wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"


/turf/closed/wall/r_wall/rust
	icon = 'talestation_modules/icons/mapping/walls/reinforced_wall.dmi'
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

/*
* False Walls
*/

/obj/structure/falsewall
	icon = 'talestation_modules/icons/mapping/walls/false_wall.dmi'

/obj/structure/falsewall/reinforced
	icon = 'talestation_modules/icons/mapping/walls/false_wall.dmi'

// Due to modular nature, we need to undo the override
// Jolly TO-DO: Intergate icon changes when we hardfork

/obj/structure/falsewall/uranium
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/gold
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/silver
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/diamond
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/plasma
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/bananium
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/sandstone
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/wood
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/bamboo
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/iron
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/abductor
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/titanium
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/plastitanium
	icon = 'icons/turf/walls/false_walls.dmi'

/obj/structure/falsewall/material
	icon = 'icons/turf/walls/false_walls.dmi'
