/obj/item
	/// Worn icon used if we're digitigrade
	var/icon/worn_icon_digitigrade

	/// Config for generating digitigrade greyscaling
	var/greyscale_config_worn_digitigrade

/obj/item/clothing/under
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/under/color
	greyscale_config_worn_digitigrade = /datum/greyscale_config/jumpsuit/worn/digi

/obj/item/clothing/under/rank/prisoner
	greyscale_config_worn_digitigrade = /datum/greyscale_config/jumpsuit/prison/worn/digi

/obj/item/clothing/under/color/jumpskirt
	greyscale_config_worn_digitigrade = null
