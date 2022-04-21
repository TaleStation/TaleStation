/// -- Modular presets for tablets, I guess if you really wanted to. --

/obj/item/modular_computer/tablet/preset/advanced/command/cargo/Initialize()
	. = ..()
	var/obj/item/computer_hardware/hard_drive/small/hard_drive = find_hardware_by_name("solid state drive")
	hard_drive.store_file(new /datum/computer_file/program/shipping)

// Command Tablets

// Asset Protection
/obj/item/modular_computer/tablet/pda/heads/ap
	name = "asset protections PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/hos
	greyscale_config = /datum/greyscale_config/tablet/head
	greyscale_colors = "#d91a40#3F1514"

// Bridge Officer
/obj/item/modular_computer/tablet/pda/heads/bo
	name = "bridge officer PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/hop
	greyscale_config = /datum/greyscale_config/tablet/head
	greyscale_colors = "#99ccff#000099"

// Quartermaster -Viva!
/obj/item/modular_computer/tablet/pda/heads/qm
	greyscale_config = /datum/greyscale_config/tablet/head
	greyscale_colors = "#e39751#a92323"

// Regular Tablets

// Science

// Ordance Tech.
/obj/item/modular_computer/tablet/pda/science/ordnance_tech
	name = "xenobiologist PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/signal/ordnance // NOTE: Remove this from the scinetist one later
	greyscale_colors = "#e2e2e2#000099#40e0d0"

// XenoBiologist
/obj/item/modular_computer/tablet/pda/science/xenobiologist
	name = "xenobiologist PDA"
	greyscale_colors = "#e2e2e2#000099#6eaec8"
