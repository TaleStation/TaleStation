// Modular snouts
// Furries gross

// Tajaran snouts
/obj/item/organ/external/snout/tajaran_snout
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_TAJARAN_SNOUT
	layers = EXTERNAL_ADJACENT
	dna_block = DNA_TAJARAN_SNOUT_BLOCK
	feature_key = "tajaran_snout"
	preference = "feature_tajaran_snout"
	external_bodytypes = BODYTYPE_SNOUTED
	organ_flags = ORGAN_EXTERNAL

/obj/item/organ/external/snout/tajaran_snout/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.wear_mask?.flags_inv & HIDESNOUT) && !(human.head?.flags_inv & HIDESNOUT))
		return TRUE
	return FALSE

/obj/item/organ/external/snout/tajaran_snout/get_global_feature_list()
	return GLOB.tajaran_snout_list
