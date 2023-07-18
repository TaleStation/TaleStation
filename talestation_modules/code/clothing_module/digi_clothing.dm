// Module file that adds supports_variations_flags to clothes in game, modualrity
// This is also 100% for sanity

/obj/item
	//Icon file for mob worn overlays, if the user is digitigrade.
	var/icon/worn_icon_digitigrade
	var/greyscale_config_worn_digitigrade

/obj/item/clothing/under
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/under/color
	greyscale_config_worn_digitigrade = /datum/greyscale_config/jumpsuit_worn/digi

/obj/item/clothing/under/color/jumpskirt
	greyscale_config_worn_digitigrade = null
