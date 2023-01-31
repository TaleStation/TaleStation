// Organ for Skrell head tentacles.
/obj/item/organ/external/head_tentacles
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_HEAD_TENTACLES
	dna_block = DNA_HEAD_TENTACLES_BLOCK
	preference = "feature_head_tentacles"
	use_mob_sprite_as_obj_sprite = TRUE

	bodypart_overlay = /datum/bodypart_overlay/mutant/head_tentacles

/datum/bodypart_overlay/mutant/head_tentacles
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	feature_key = "head_tentacles"

/datum/bodypart_overlay/mutant/head_tentacles/can_draw_on_bodypart(mob/living/carbon/human/human)
	. = TRUE
	if(istype(human.head) && (human.head.flags_inv & HIDEHAIR))
		. = FALSE
	if(istype(human.wear_mask) && (human.wear_mask.flags_inv & HIDEHAIR))
		. = FALSE
	var/obj/item/bodypart/head/our_head = human.get_bodypart(BODY_ZONE_HEAD)
	if(our_head && !IS_ORGANIC_LIMB(our_head))
		. = FALSE

/datum/bodypart_overlay/mutant/head_tentacles/get_global_feature_list()
	return GLOB.head_tentacles_list

// Skrell Tongue. Could use a sprite.
/obj/item/organ/internal/tongue/skrell
	name = "skrellian tongue"
	desc = "The source of the Skrellian people's warbling voice."
	say_mod = "warbles"
	languages_native = /datum/language/skrell
	var/static/list/languages_possible_skrell

/obj/item/organ/internal/tongue/skrell/get_possible_languages()
	return ..() + /datum/language/skrell
