// Tajaran snouts
/datum/preference/choiced/tajaran_snout
	savefile_key = "feature_tajaran_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout"
	should_generate_icons = TRUE

/datum/preference/choiced/tajaran_snout/init_possible_values()
	return generate_tajaran_side_shots(GLOB.tajaran_snout_list, "tajaran_snout", include_snout = FALSE)

/datum/preference/choiced/tajaran_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tajaran_snout"] = value

// Tajaran tails
/datum/preference/choiced/tajaran_tail
	savefile_key = "feature_tajaran_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/external/tail/tajaran_tail

/datum/preference/choiced/tajaran_tail/init_possible_values()
	return assoc_to_keys(GLOB.tajaran_tail_list)

/datum/preference/choiced/tajaran_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tajaran_tail"] = value

/datum/preference/choiced/tajaran_tail/create_default_value()
	var/datum/sprite_accessory/tail/tajaran_tail/tail = /datum/sprite_accessory/tail/tajaran_tail
	return initial(tail.name)

// Tajaran ears
/datum/preference/choiced/tajaran_ears
	savefile_key = "feature_tajaran_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	can_randomize = FALSE
	relevant_mutant_bodypart = "tajaran_ears"

/datum/preference/choiced/tajaran_ears/init_possible_values()
	return assoc_to_keys(GLOB.tajaran_ears_list)

/datum/preference/choiced/tajaran_ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tajaran_ears"] = value

/datum/preference/choiced/tajaran_ears/create_default_value()
	var/datum/sprite_accessory/ears/tajaran_ears/ears = /datum/sprite_accessory/ears/tajaran_ears
	return initial(ears.name)
