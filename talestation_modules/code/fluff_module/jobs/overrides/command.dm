// CMO Outfit
/datum/outfit/job/cmo
	head = null
	neck = /obj/item/clothing/neck/stethoscope
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck
	suit = null
	shoes = /obj/item/clothing/shoes/laceup
	suit_store = null
	backpack_contents = list(
		/obj/item/melee/baton/telescopic = 1,
		/obj/item/flashlight/pen/paramedic = 1,
		)

// RD Outfit
/datum/outfit/job/rd
	head = null
	uniform = /obj/item/clothing/under/rank/rnd/research_director/turtleneck
	suit = /obj/item/clothing/suit/jacket/research_director
	gloves = null
	shoes = /obj/item/clothing/shoes/laceup

/obj/item/clothing/under/rank/engineering/overalls/chief_engineer
	name = "chief engineer's overalls"
	desc = "Nothing sets the mood like a pair of coffee stained overalls. Oh, and a few lost pens. How'd these get in there?"
	icon = 'icons/obj/clothing/under/misc.dmi'
	worn_icon = 'icons/mob/clothing/under/misc.dmi'
	icon_state = "overalls"
	inhand_icon_state = "lb_suit"
	can_adjust = FALSE

	armor_type = /datum/armor/engineering_chief_engineer

// CE Outfit
/datum/outfit/job/ce
	uniform = /obj/item/clothing/under/rank/engineering/overalls/chief_engineer
	gloves = null
	head = /obj/item/clothing/head/utility/hardhat/white
	shoes = /obj/item/clothing/shoes/jackboots

// HoS Outfit
/datum/outfit/job/hos
	uniform = /obj/item/clothing/under/rank/security/head_of_security/alt
	head = /obj/item/clothing/head/hats/hos
