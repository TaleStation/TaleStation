// Avian beaks
/datum/preference/choiced/avian_beak
	savefile_key = "feature_avian_beak"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Beak"
	should_generate_icons = TRUE

/datum/preference/choiced/avian_beak/init_possible_values()
	return assoc_to_keys_features(GLOB.avian_beak_list)

/datum/preference/choiced/avian_beak/icon_for(value)
	return generate_avian_side_shots(GLOB.avian_beak_list[value], "avian_beak", include_snout = FALSE)

/datum/preference/choiced/avian_beak/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["avian_beak"] = value

// Avian tails
/datum/preference/choiced/avian_tail
	savefile_key = "feature_avian_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/external/tail/avian_tail

/datum/preference/choiced/avian_tail/init_possible_values()
	return assoc_to_keys(GLOB.avian_tail_list)

/datum/preference/choiced/avian_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["avian_tail"] = value

/datum/preference/choiced/avian_tail/create_default_value()
	var/datum/sprite_accessory/tail/avian_tail/tail = /datum/sprite_accessory/tail/avian_tail
	return initial(tail.name)

// Avian legs
/datum/preference/choiced/avian_legs
	savefile_key = "feature_avian_legs"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "avian_legs"

/datum/preference/choiced/avian_legs/init_possible_values()
	return assoc_to_keys_features(GLOB.avian_legs_list)

/datum/preference/choiced/avian_legs/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["avian_legs"] = value

// Avian hair
/datum/preference/choiced/avian_crest
	savefile_key = "feature_avian_crest"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Avian Crest"
	should_generate_icons = TRUE

/datum/preference/choiced/avian_crest/init_possible_values()
	return assoc_to_keys_features(GLOB.avian_crest_list)

/datum/preference/choiced/avian_crest/icon_for(value)
	return generate_avian_front_shots(GLOB.avian_crest_list[value], "avian_crest", include_snout = TRUE)

/datum/preference/choiced/avian_crest/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["avian_crest"] = value
