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

// Talon color
/datum/preference/choiced/talon_color
	savefile_key = "feature_avian_leg_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_inherent_trait = TRAIT_USES_TALON_COLOR

/datum/preference/choiced/talon_color/init_possible_values()
	return GLOB.talon_colors

/datum/preference/choiced/talon_color/compile_constant_data()
	var/list/data = ..()

	data[CHOICED_PREFERENCE_DISPLAY_NAMES] = GLOB.talon_colors_names

	var/list/to_hex = list()
	for (var/choice in get_choices())
		var/hex_value = taloncolor2hex(choice)
		var/list/hsl = rgb2num(hex_value, COLORSPACE_HSL)

		to_hex[choice] = list(
			"lightness" = hsl[3],
			"value" = hex_value,
		)

	data["to_hex"] = to_hex

	return data

/datum/preference/choiced/talon_color/apply_to_human(mob/living/carbon/human/target, value)
	target.talon_color = value
	var/datum/bodypart_overlay/simple/avian_feet/feet
	feet?.draw_color = target.talon_color

/proc/taloncolor2hex(talon_color)
	. = 0
	switch(talon_color)
		if("grey")
			. = "#8b837f"
		if("yellow")
			. = "#f5d64b"
		if("orange")
			. = "#e47a33"
		if("blue")
			. = "#65c4e0"
