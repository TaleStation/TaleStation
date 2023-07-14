/obj/machinery/bluespace_beacon

<<<<<<< HEAD
	icon = 'icons/obj/objects.dmi'
=======
	icon = 'icons/obj/machines/floor.dmi'
>>>>>>> fb1012102257b (Icons folder cleaning wave two (#76788))
	icon_state = "floor_beaconf"
	name = "bluespace gigabeacon"
	desc = "A device that draws power from bluespace and creates a permanent tracking beacon."
	layer = LOW_OBJ_LAYER
	use_power = NO_POWER_USE
	idle_power_usage = 0
	var/obj/item/beacon/Beacon

/obj/machinery/bluespace_beacon/Initialize(mapload)
	. = ..()
	var/turf/T = loc
	Beacon = new(T)
	Beacon.invisibility = INVISIBILITY_MAXIMUM

	AddElement(/datum/element/undertile, TRAIT_T_RAY_VISIBLE)

/obj/machinery/bluespace_beacon/Destroy()
	QDEL_NULL(Beacon)
	return ..()

/obj/machinery/bluespace_beacon/process()
	if(QDELETED(Beacon)) //Don't move it out of nullspace BACK INTO THE GAME for the love of god
		var/turf/T = loc
		Beacon = new(T)
		Beacon.invisibility = INVISIBILITY_MAXIMUM
	else if (Beacon.loc != loc)
		Beacon.forceMove(loc)
