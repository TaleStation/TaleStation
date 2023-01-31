/obj/item/organ/external/tail/avian_tail
	name = "avian plummage"
	desc = "The plummage off an avian. Hey, who plucked these?!"

	slot = ORGAN_SLOT_EXTERNAL_TAIL
	dna_block = DNA_AVIAN_TAIL_BLOCK

	preference = "feature_avian_tail"

	wag_flags = NONE

	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/avian_tail

/datum/bodypart_overlay/mutant/tail/avian_tail
	feature_key = "avian_tail"

/datum/bodypart_overlay/mutant/tail/avian_tail/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(human.wear_suit && (human.wear_suit.flags_inv & HIDEJUMPSUIT))
		return FALSE
	return TRUE

/datum/bodypart_overlay/mutant/tail/avian_tail/get_global_feature_list()
	return GLOB.avian_tail_list

/obj/item/organ/external/snout/avian_beak
	name = "avian beak"
	desc = "Whats the matter, caw got your beak?"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_AVIAN_BEAK
	dna_block = DNA_AVIAN_BEAK_BLOCK

	preference = "feature_avian_beak"

	external_bodytypes = BODYTYPE_SNOUTED

	bodypart_overlay = /datum/bodypart_overlay/mutant/snout/avian_beak

/datum/bodypart_overlay/mutant/snout/avian_beak
	layers = EXTERNAL_ADJACENT
	feature_key = "avian_beak"

/datum/bodypart_overlay/mutant/snout/avian_beak/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.wear_mask?.flags_inv & HIDESNOUT) && !(human.head?.flags_inv & HIDESNOUT))
		return TRUE
	return FALSE

/datum/bodypart_overlay/mutant/snout/avian_beak/get_global_feature_list()
	return GLOB.avian_beak_list

/obj/item/organ/internal/tongue/avian
	name = "avian tongue"
	desc = "Avian tongues are unsurprising. They're pretty basic."
	say_mod = "caws"

/obj/item/organ/external/leg/avian_talon/left_leg
	name = "left avian talon"
	desc = "What sick bastard grafted this off an Avian?!"
	// icon_state = "" TODO: Get a fucking icon state

	zone = BODY_ZONE_L_LEG
	slot = ORGAN_SLOT_EXTERNAL_AVIAN_TALON_L
	dna_block = DNA_AVIAN_TALON_L_BLOCK

	preference = "feature_avian_talon_l"

	bodypart_overlay = /datum/bodypart_overlay/mutant/leg/avian_talon/left_leg

/datum/bodypart_overlay/mutant/leg/avian_talon/left_leg
	layers = EXTERNAL_ADJACENT
	feature_key = "avian_talon_l"

/obj/item/organ/external/leg/avian_talon/right_leg
	name = "right avian talon"
	desc = "What sick bastard grafted this off an Avian?!"
	// icon_state = "" TODO: Get a fucking icon state

	zone = BODY_ZONE_R_LEG
	slot = ORGAN_SLOT_EXTERNAL_AVIAN_TALON_R
	dna_block = DNA_AVIAN_TALON_R_BLOCK

	preference = "feature_avian_talon_r"

	bodypart_overlay = /datum/bodypart_overlay/mutant/leg/avian_talon/right_leg

/datum/bodypart_overlay/mutant/leg/avian_talon/right_leg
	layers = EXTERNAL_ADJACENT
	feature_key = "avian_talon_r"

/datum/bodypart_overlay/mutant/leg/avian_talon/left_leg/can_draw_on_bodypart(mob/living/carbon/human/human)
	return TRUE

/datum/bodypart_overlay/mutant/leg/avian_talon/left_leg/get_global_feature_list()
	return GLOB.avian_talon_l_list

/datum/bodypart_overlay/mutant/leg/avian_talon/right_leg/can_draw_on_bodypart(mob/living/carbon/human/human)
	return TRUE

/datum/bodypart_overlay/mutant/leg/avian_talon/right_leg/get_global_feature_list()
	return GLOB.avian_talon_r_list
