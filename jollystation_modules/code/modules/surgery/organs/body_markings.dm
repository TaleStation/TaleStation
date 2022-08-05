// Modular body markings

// Tajaran markings
/datum/preference/choiced/tajaran_body_markings
	savefile_key = "feature_tajaran_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Body markings"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "tajaran_body_markings"

/datum/preference/choiced/tajaran_body_markings/init_possible_values()
	var/list/values = list()

	var/icon/tajaran = icon('jollystation_modules/icons/mob/species/tajaran/bodyparts.dmi', "tajaran_chest_m")

	for (var/name in GLOB.tajaran_body_markings_list)
		var/datum/sprite_accessory/sprite_accessory = GLOB.tajaran_body_markings_list[name]

		var/icon/final_icon = icon(tajaran)

		if (sprite_accessory.icon_state != "none")
			var/icon/body_markings_icon = icon(
				'jollystation_modules/icons/mob/tajaran_markings.dmi',
				"m_body_markings_[sprite_accessory.icon_state]_ADJ",
			)

			final_icon.Blend(body_markings_icon, ICON_OVERLAY)

		final_icon.Blend(COLOR_WHITE, ICON_MULTIPLY)
		final_icon.Crop(10, 8, 22, 23)
		final_icon.Scale(26, 32)
		final_icon.Crop(-2, 1, 29, 32)

		values[name] = final_icon

	return values

/datum/preference/choiced/tajaran_body_markings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tajaran_body_markings"] = value

/obj/item/organ/external/tajaran_body_markings/get_global_feature_list()
	return GLOB.tajaran_body_markings_list
