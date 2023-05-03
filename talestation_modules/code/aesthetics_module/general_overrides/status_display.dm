// Modular stat display access

/obj/machinery/status_display
	icon = 'talestation_modules/icons/machines/status_display.dmi'

/obj/machinery/status_display/Initialize(mapload)
	. = ..()
	set_picture("default")

/obj/machinery/status_display/syndie
	name = "syndicate status display"

/obj/machinery/status_display/syndie/Initialize(mapload)
	. = ..()
	set_picture("synd")
