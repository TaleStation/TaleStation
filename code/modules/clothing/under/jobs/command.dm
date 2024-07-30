/obj/item/clothing/under/rank/captain
	name = "site director's jumpsuit"
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Site Director\"."
	icon_state = "captain"
	inhand_icon_state = "b_suit"
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	icon = 'icons/obj/clothing/under/captain.dmi'
	worn_icon = 'icons/mob/clothing/under/captain.dmi'
	armor_type = /datum/armor/clothing_under/rank_captain

/datum/armor/clothing_under/rank_captain
	wound = 15

/obj/item/clothing/under/rank/captain/skirt
	name = "site director's jumpskirt"
	desc = "It's a blue jumpskirt with some gold markings denoting the rank of \"Site Director\"."
	icon_state = "captain_skirt"
	inhand_icon_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/captain/suit
	name = "site director's suit"
	desc = "A green suit and yellow necktie. Exemplifies authority."
	icon_state = "green_suit"
	inhand_icon_state = "dg_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/captain/suit/skirt
	name = "green suitskirt"
	desc = "A green suitskirt and yellow necktie. Exemplifies authority."
	icon_state = "green_suit_skirt"
	inhand_icon_state = "dg_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/captain/parade
	name = "site director's parade uniform"
	desc = "A Site Director's luxury-wear, for special occasions."
	icon_state = "captain_parade"
	inhand_icon_state = null
	can_adjust = FALSE
