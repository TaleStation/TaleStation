/// -- Modular encryption keys --
// Bridge Officer's Key
/obj/item/encryptionkey/heads/bridge_officer
	name = "\proper the bridge officer's encryption key"
	icon_state = "cypherkey_cube"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_COMMAND = 1)
	greyscale_config = /datum/greyscale_config/encryptionkey_cube //hop
	greyscale_colors = "#2b2793#c2c1c9"

// Asset Protection's Key
/obj/item/encryptionkey/heads/asset_protection
	name = "\proper the asset protection's encryption key"
	icon_state = "cypherkey_cube"
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_COMMAND = 1)
	greyscale_config = /datum/greyscale_config/encryptionkey_cube //hos
	greyscale_colors = "#2b2793#c2c1c9"
