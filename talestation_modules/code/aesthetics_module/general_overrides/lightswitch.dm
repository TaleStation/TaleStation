// Modular Light switch bullshit

/obj/machinery/light_switch/interact(mob/user)
	. = ..()
	playsound(src, 'talestation_modules/sound/machines/lights/lightswitch.ogg', 100, 1)

#ifndef UNIT_TESTS
/obj/machinery/light_switch/LateInitialize()
	. = ..()
	if(prob(66)) //66% chance for an area to have their lights flipped.
		set_lights(!area.lightswitch)
#endif
