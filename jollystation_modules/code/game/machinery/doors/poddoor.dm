// Modular pod door stuff

/obj/machinery/door/poddoor
	icon = 'jollystation_modules/icons/obj/doors/blast_door.dmi'
	var/door_sound = 'jollystation_modules/sound/machines/blastdoors/blast_door.ogg'

/obj/machinery/door/poddoor/shutters
	var/door_open_sound = 'jollystation_modules/sound/machines/blastdoors/shutters_open.ogg'
	var/door_close_sound = 'jollystation_modules/sound/machines/blastdoors/shutters_close.ogg'

/obj/machinery/door/poddoor/shutters/do_animate(animation)
	switch(animation)
		if("opening")
			flick("opening", src)
			playsound(src, door_open_sound, 30, TRUE)
		if("closing")
			flick("closing", src)
			playsound(src, door_close_sound, 30, TRUE)
