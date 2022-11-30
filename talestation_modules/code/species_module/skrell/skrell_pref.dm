/datum/preference/choiced/skrell_hair
	savefile_key = "feature_head_tentacles"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Head Tentacles"
	should_generate_icons = TRUE

/datum/preference/choiced/skrell_hair/init_possible_values()
	return generate_skrell_side_shots(GLOB.head_tentacles_list, "head_tentacles", list("ADJ", "FRONT"))

/datum/preference/choiced/skrell_hair/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["head_tentacles"] = value
