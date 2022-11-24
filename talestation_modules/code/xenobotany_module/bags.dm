// Modular bag items

// Var addition to plant bags for XenoBotany
/obj/item/storage/bag/plants
	var/accepts_alien_seeds = FALSE

// Plant bag for XenoBotany
/obj/item/storage/bag/plants/xenobotany
	name = "xenobotany plant bag"
	accepts_alien_seeds = TRUE
	// Need unique sprites some day

// Plant bag for XenoBotany
/obj/item/storage/bag/plants/portaseeder/xenobotany
	name = "xenobotany portable seed extrator bag"
	accepts_alien_seeds = TRUE
