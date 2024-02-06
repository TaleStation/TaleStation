/obj/item/clothing
	/// Worn icon used if we're digitigrade
	var/icon/worn_icon_digitigrade

	/// Config for generating digitigrade greyscaling
	var/greyscale_config_worn_digitigrade

	/// Worn icon if we're something with a snout
	var/icon/worn_icon_snouted

	/// Config for generating snouted greyscaling
	var/greyscale_config_worn_snouted

/obj/item/clothing/equipped(mob/living/carbon/user, slot)
	if(istype(user) && (user.bodytype & BODYTYPE_DIGITIGRADE) && !isnull(worn_icon_digitigrade))
		worn_icon = worn_icon_digitigrade

	if(istype(user) && (user.bodytype & BODYTYPE_SNOUTED) && !isnull(worn_icon_snouted))
		worn_icon = worn_icon_snouted

	else
		worn_icon = initial(worn_icon)
		update_greyscale()

	return ..()

/obj/item/clothing/update_greyscale()
	if(greyscale_config_worn_digitigrade)
		worn_icon_digitigrade = SSgreyscale.GetColoredIconByType(greyscale_config_worn_digitigrade, greyscale_colors)

	if(greyscale_config_worn_snouted)
		worn_icon_snouted = SSgreyscale.GetColoredIconByType(greyscale_config_worn_snouted, greyscale_colors)

	return ..()

/obj/item/clothing/under
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/under/color
	greyscale_config_worn_digitigrade = /datum/greyscale_config/jumpsuit/worn/digi

/obj/item/clothing/under/rank/prisoner
	greyscale_config_worn_digitigrade = /datum/greyscale_config/jumpsuit/prison/worn/digi

/obj/item/clothing/under/rank/civilian/lawyer/bluesuit
	greyscale_config_worn_digitigrade = /datum/greyscale_config/buttondown_slacks/worn/digi

/obj/item/clothing/under/costume/buttondown/slacks
	greyscale_config_worn_digitigrade = /datum/greyscale_config/buttondown_slacks/worn/digi

/obj/item/clothing/under/color/jumpskirt
	greyscale_config_worn_digitigrade = null
