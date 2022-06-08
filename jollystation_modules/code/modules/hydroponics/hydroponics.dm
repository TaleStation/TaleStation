// -- Hydroponics tray additions --
#define TRAY_MODIFIED_BASE_NUTRIDRAIN 0.5

/obj/machinery/hydroponics
	//Determines if we want to accept alien seeds
	var/accepts_alien_seeds = FALSE

//Xenobotany trays; we grow weird shit
/obj/machinery/hydroponics/xeno_tray
	circuit = /obj/item/circuitboard/machine/hydroponics_xeno
	accepts_alien_seeds = TRUE
	icon_state = "hydrotray2"

/obj/machinery/hydroponics/constructable
	// Nutriment drain is halved so they can not worry about fertilizer as much
	nutridrain = TRAY_MODIFIED_BASE_NUTRIDRAIN

/obj/machinery/hydroponics/set_self_sustaining(new_value)
	var/old_self_sustaining = self_sustaining
	. = ..()
	if(self_sustaining != old_self_sustaining)
		if(self_sustaining)
			nutridrain /= 2
		else
			nutridrain *= 2

/obj/machinery/hydroponics/constructable/RefreshParts()
	. = ..()
	// Dehardcodes the nutridrain scaling factor
	nutridrain = initial(nutridrain) / rating
	// Adds a flat 100 max water (doesn't really matter cause autogrow)
	maxwater += 100

#undef TRAY_MODIFIED_BASE_NUTRIDRAIN
