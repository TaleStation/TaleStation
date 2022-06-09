// Modular machine circuit boards

/obj/item/circuitboard/machine/hydroponics_xeno
	name = "XenoBotany Hydroponics Tray (Machine Board)"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/hydroponics/xeno_tray
	req_components = list(
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/sheet/glass = 2,
		/obj/item/stack/cable_coil = 4)
	needs_anchored = FALSE
