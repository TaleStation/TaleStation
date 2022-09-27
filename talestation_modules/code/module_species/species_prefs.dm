/*
* Skrell stuff
*/

/proc/generate_skrell_side_shots(list/sprite_accessories, key, list/sides)
	var/list/values = list()

	var/icon/skrell = icon(DEFAULT_BODYPART_ICON_ORGANIC, "skrell_head_m", EAST)
	var/icon/eyes = icon('talestation_modules/icons/mob/skrell_eyes.dmi', "eyes", EAST)

	eyes.Blend(COLOR_ALMOST_BLACK, ICON_MULTIPLY)
	skrell.Blend(eyes, ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(skrell)

		if (sprite_accessory.icon_state != "none")
			for(var/side in sides)
				var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_[side]", EAST)
				final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_BLUE_GRAY, ICON_MULTIPLY)

		values[name] = final_icon

	return values

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

/*
* Tajaran stuff
*/

// Generates tajaran side profile for prefs
/proc/generate_tajaran_side_shots(list/sprite_accessories, key, include_snout = TRUE)
	var/list/values = list()

	var/icon/tajaran = icon('talestation_modules/icons/mob/species/tajaran/bodyparts.dmi', "tajaran_head_m", EAST)

	var/icon/eyes = icon('icons/mob/species/human/human_face.dmi', "eyes", EAST)
	eyes.Blend(COLOR_BLACK, ICON_MULTIPLY)
	tajaran.Blend(eyes, ICON_OVERLAY)

	if (include_snout)
		tajaran.Blend(icon('talestation_modules/icons/mob/tajaran_snouts.dmi', "m_tajaran_snout_wide", EAST), ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(tajaran)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_GRAY, ICON_MULTIPLY)

		values[name] = final_icon

	return values

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
