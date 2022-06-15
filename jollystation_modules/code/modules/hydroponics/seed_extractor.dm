// Modular seed extractor stuff

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
