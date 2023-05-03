// Modular wall access

/turf/closed/wall
	icon = 'talestation_modules/icons/mapping/walls/wall.dmi'

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

/obj/structure/falsewall
	icon = 'talestation_modules/icons/mapping/walls/wall.dmi'

/obj/structure/falsewall/reinforced
	icon = 'talestation_modules/icons/mapping/walls/reinforced_wall.dmi'

/turf/closed/wall/rust/New(loc, ...)
	. = ..()
	var/mutable_appearance/rust = mutable_appearance(icon, "rust")
	add_overlay(rust)

/turf/closed/wall/r_wall/rust/New(loc, ...)
	. = ..()
	var/mutable_appearance/rust = mutable_appearance(icon, "rust")
	add_overlay(rust)
