// Modular Light switch bullshit

// TO-DO: turn the prob% into a config or define
#ifndef UNIT_TESTS
/obj/machinery/light_switch/LateInitialize()
	. = ..()
	if(prob(66)) //66% chance for an area to have their lights flipped.
		set_lights(!area.lightswitch)
#endif
