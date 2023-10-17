/*
* Asset Protection's encryption key
*/
/obj/item/encryptionkey/heads/asset_protection
	name = "\proper the asset protection's encryption key"
	icon_state = "cypherkey_security"
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_COMMAND = 1)
	greyscale_config = /datum/greyscale_config/encryptionkey_security
	greyscale_colors = "#280b1a#820a16"

/*
* Bridge Officer's encryption key
*/
/obj/item/encryptionkey/heads/hop/bridge_officer
	name = "\proper the bridge officer's encryption key"
	icon_state = "cypherkey_cube"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_COMMAND = 1)
	greyscale_config = /datum/greyscale_config/encryptionkey_cube
	greyscale_colors = "#2b2793#c2c1c9"
