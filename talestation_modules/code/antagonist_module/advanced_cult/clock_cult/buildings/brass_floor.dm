// The "real apperance" overlay for clockcult floors
/obj/effect/cult_turf/overlay/floor/clockcult

/obj/effect/cult_turf/overlay/floor/clockcult_nocross
	icon_state = "reebe"

// The glowing visual effect played when brass floors are created.
/obj/effect/temp_visual/brass/floor
	icon_state = "ratvarfloorglow"

// Aaand brass floors.
/turf/open/floor/engine/cult/brass
	name = "engraved brass floor"
	desc = "Some brass tiles, engraved with strange runes."
	/// The effect type used to create our "real" appearance.
	var/floor_effect_type = /obj/effect/cult_turf/overlay/floor/clockcult

/turf/open/floor/engine/cult/brass/Initialize(mapload)
	. = ..()
	if(!mapload)
		QDEL_NULL(realappearance)
		new /obj/effect/temp_visual/brass/floor(src)
		realappearance = new floor_effect_type(src)
		realappearance.linked = src
	ADD_CLOCKCULT_FILTER(src)

/turf/open/floor/engine/cult/brass/be_removed()
	REMOVE_CLOCKCULT_FILTER(src)
	return ..()

/turf/open/floor/engine/cult/brass/flat
	name = "brass floor"
	desc = "A large, smooth brass tile."
	floor_effect_type = /obj/effect/cult_turf/overlay/floor/clockcult_nocross
