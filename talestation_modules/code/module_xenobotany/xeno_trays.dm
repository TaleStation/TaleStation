
// Adds var to typepath
/obj/machinery/hydroponics
	//Determines if we want to accept alien seeds
	var/accepts_alien_seeds = FALSE

// Xeno hydroponics tray
/obj/item/circuitboard/machine/hydroponics/xeno
	name = "XenoBotany Hydroponics Tray (Machine Board)"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/hydroponics/xeno_tray
	req_components = list(
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/sheet/glass = 2,
		/obj/item/stack/cable_coil = 4)

//Xenobotany trays; we grow weird shit
/obj/machinery/hydroponics/xeno_tray
	circuit = /obj/item/circuitboard/machine/hydroponics/xeno
	accepts_alien_seeds = TRUE
	icon_state = "hydrotray2"
