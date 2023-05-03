/// -- Modular RND clothing. --

/obj/item/clothing/under/rank/rnd/xenobiologist
	desc = "It has markings that denote the wearer as a Xenobiologist."
	name = "xenobiologist's jumpsuit"
	icon = 'talestation_modules/icons/clothing/under/rnd.dmi'
	worn_icon = 'talestation_modules/icons/clothing/worn/under/rnd.dmi'
	icon_state = "xeno"
	inhand_icon_state = "w_suit"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
	armor_type = /datum/armor/labcoat_xenobiologist

/datum/armor/labcoat_xenobiologist
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 15
	fire = 0
	acid = 0

/obj/item/clothing/under/rank/rnd/xenobiologist/skirt
	name = "xenobiologist's jumpskirt"
	icon_state = "xeno_skirt"
	inhand_icon_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
