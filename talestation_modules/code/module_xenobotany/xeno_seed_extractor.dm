
// Xeno seed extractor
/obj/item/circuitboard/machine/seed_extractor/xeno
	name = "XenoBotany Seed Extractor (Machine Board)"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/seed_extractor/xeno

// Var overrides
/obj/machinery/seed_extractor
	// Like hydro trays, we don't wanna accept weird stuff!
	var/accepts_alien_seeds = FALSE

// XenoBotany seed extractor
/obj/machinery/seed_extractor/xeno
	name = "xenobotany seed extractor"
	desc = "Extracts and bags your weird experiments into seed bags. NanoTrasen isn't responsible for any death or injury."
	circuit = /obj/item/circuitboard/machine/seed_extractor/xeno
	accepts_alien_seeds = TRUE

/proc/accepts_alien_seeds(obj/extractor)
	if(istype(extractor, /obj/item/storage/bag/plants/portaseeder))
		var/obj/item/storage/bag/plants/portaseeder/porta_extractor = extractor
		if(porta_extractor.accepts_alien_seeds)
			return TRUE
	if(istype(extractor, /obj/machinery/seed_extractor))
		var/obj/machinery/seed_extractor/machine_extractor = extractor
		if(machine_extractor.accepts_alien_seeds)
			return TRUE
	return FALSE
