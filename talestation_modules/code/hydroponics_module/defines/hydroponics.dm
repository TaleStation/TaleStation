// -- Hydroponics tray additions --

/obj/machinery/hydroponics
	//Determines if we want to accept alien seeds
	var/accepts_alien_seeds = FALSE

//Xenobotany trays; we grow weird shit
/obj/machinery/hydroponics/xeno_tray
	circuit = /obj/item/circuitboard/machine/hydroponics/xeno
	accepts_alien_seeds = TRUE
	icon_state = "hydrotray2"

/obj/machinery/hydroponics/constructable/RefreshParts()
	. = ..()
	// Dehardcodes the nutridrain scaling factor
	nutridrain = initial(nutridrain) / rating
	// Adds a flat 100 max water (doesn't really matter cause autogrow)
	maxwater += 100

