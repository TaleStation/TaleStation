/obj/item/organ/external/tail/avian_tail
	name = "avian plummage"
	desc = "The plummage off an avian. Hey, who plucked these?!"

	slot = ORGAN_SLOT_EXTERNAL_TAIL
	dna_block = DNA_AVIAN_TAIL_BLOCK

	feature_key = "avian_tail"
	preference = "feature_avian_tail"

	wag_flags = NONE

/obj/item/organ/external/tail/avian_tail/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(human.wear_suit && (human.wear_suit.flags_inv & HIDEJUMPSUIT))
		return FALSE
	return TRUE

/obj/item/organ/external/tail/avian_tail/get_global_feature_list()
	return GLOB.avian_tail_list

/obj/item/organ/external/snout/avian_beak
	name = "avian beak"
	desc = "Whats the matter, caw got your beak?"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_AVIAN_BEAK
	layers = EXTERNAL_ADJACENT
	dna_block = DNA_AVIAN_BEAK_BLOCK
	apply_color_to_layer = FALSE

	feature_key = "avian_beak"
	preference = "feature_avian_beak"

	external_bodytypes = BODYTYPE_SNOUTED

/obj/item/organ/external/snout/avian_beak/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.wear_mask?.flags_inv & HIDESNOUT) && !(human.head?.flags_inv & HIDESNOUT))
		return TRUE
	return FALSE

/obj/item/organ/external/snout/avian_beak/get_global_feature_list()
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
	layers = EXTERNAL_ADJACENT

	feature_key = "avian_talon_l"
	preference = "feature_avian_talon_l"

/obj/item/organ/external/leg/avian_talon/right_leg
	name = "right avian talon"
	desc = "What sick bastard grafted this off an Avian?!"
	// icon_state = "" TODO: Get a fucking icon state

	zone = BODY_ZONE_R_LEG
	slot = ORGAN_SLOT_EXTERNAL_AVIAN_TALON_R
	dna_block = DNA_AVIAN_TALON_R_BLOCK
	layers = EXTERNAL_ADJACENT

	feature_key = "avian_talon_r"
	preference = "feature_avian_talon_r"

/obj/item/organ/external/leg/avian_talon/left_leg/can_draw_on_bodypart(mob/living/carbon/human/human)
	return TRUE

/obj/item/organ/external/leg/avian_talon/left_leg/get_global_feature_list()
	return GLOB.avian_talon_l_list

/obj/item/organ/external/leg/avian_talon/right_leg/can_draw_on_bodypart(mob/living/carbon/human/human)
	return TRUE

/obj/item/organ/external/leg/avian_talon/right_leg/get_global_feature_list()
	return GLOB.avian_talon_r_list
