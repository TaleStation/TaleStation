// -- Modular Skrell species --
/// GLOB list of head tentacle sprites / options
GLOBAL_LIST_EMPTY(head_tentacles_list)

// The datum for Skrell.
/datum/species/skrell
	name = "Skrell"
	id = SPECIES_SKRELL

	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LIGHT_DRINKER,
		TRAIT_LITERATE,
		TRAIT_MUTANT_COLORS,
		)

	external_organs = list(/obj/item/organ/external/head_tentacles = "Long")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/skrell
	exotic_bloodtype = "S"
	mutanttongue = /obj/item/organ/internal/tongue/skrell
	species_pain_mod = 0.80

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/skrell,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/skrell,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/skrell,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/skrell,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/skrell,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/skrell,
	)

/datum/species/skrell/spec_life(mob/living/carbon/human/skrell_mob, seconds_per_tick, times_fired)
	. = ..()
	if(skrell_mob.nutrition > NUTRITION_LEVEL_ALMOST_FULL)
		skrell_mob.set_nutrition(NUTRITION_LEVEL_ALMOST_FULL)

/datum/species/skrell/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = sanitize_hexcolor(COLOR_BLUE_GRAY)

	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)

// Skrell bloodbag, for S type blood
/obj/item/reagent_containers/blood/skrell
	blood_type = "S"

// Copper restores blood for Skrell instead of iron.
/datum/reagent/copper/on_mob_life(mob/living/carbon/C, seconds_per_tick)
	if((isskrell(C)) && (C.blood_volume < BLOOD_VOLUME_NORMAL))
		C.blood_volume += 0.5 * seconds_per_tick
	..()

/proc/generate_skrell_side_shots(datum/sprite_accessory/sprite_accessory, key, include_snout = TRUE)
	var/static/icon/skrell
	var/static/icon/skrell_with_hair

	if (isnull(skrell))
		skrell = icon('talestation_modules/icons/species/skrell/bodyparts.dmi', "skrell_head_m", SOUTH)
		var/icon/eyes = icon('icons/mob/human/human_face.dmi', "eyes", SOUTH)
		eyes.Blend(COLOR_ALMOST_BLACK, ICON_MULTIPLY)
		skrell.Blend(eyes, ICON_OVERLAY)

		skrell_with_hair = icon(skrell)

	var/icon/final_icon = include_snout ? icon(skrell_with_hair) : icon(skrell)

	if (!isnull(sprite_accessory))
		var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", SOUTH)
		final_icon.Blend(accessory_icon, ICON_OVERLAY)

	final_icon.Crop(11, 20, 23, 32)
	final_icon.Scale(32, 32)
	final_icon.Blend(COLOR_BLUE_GRAY, ICON_MULTIPLY)

	return final_icon

/datum/species/skrell/get_species_speech_sounds(sound_type)
	switch(sound_type)
		if(SOUND_QUESTION)
			return string_assoc_list(list('talestation_modules/sound/voice/huff_ask.ogg' = 120))
		if(SOUND_EXCLAMATION)
			return string_assoc_list(list('talestation_modules/sound/voice/huff_exclaim.ogg' = 120))
		else
			return string_assoc_list(list('talestation_modules/sound/voice/huff.ogg' = 120))

/datum/species/skrell/randomize_features(mob/living/carbon/human/human_mob)
	var/list/features = ..()
	features["head_tentacles"] = pick("Short", "Long")
	return features
