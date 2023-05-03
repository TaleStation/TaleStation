// -- Modular Skrell species --
/// GLOB list of head tentacle sprites / options
GLOBAL_LIST_EMPTY(head_tentacles_list)

// The datum for Skrell.
/datum/species/skrell
	name = "Skrell"
	id = SPECIES_SKRELL

	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		)

	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LIGHT_DRINKER,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_LITERATE,
		)

	external_organs = list(/obj/item/organ/external/head_tentacles = "Long")
	toxic_food = MEAT | RAW | DAIRY | TOXIC | SEAFOOD
	disliked_food = GROSS
	liked_food = VEGETABLES | FRUIT
	payday_modifier = 0.75
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/skrell
	exotic_bloodtype = "S"
	mutanttongue = /obj/item/organ/internal/tongue/skrell
	species_speech_sounds = list('talestation_modules/sound/voice/huff.ogg' = 120)
	species_speech_sounds_exclaim = list('talestation_modules/sound/voice/huff_ask.ogg' = 120)
	species_speech_sounds_ask = list('talestation_modules/sound/voice/huff_exclaim.ogg' = 120)
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

/proc/generate_skrell_side_shots(list/sprite_accessories, key, list/sides)
	var/list/values = list()

	var/icon/skrell = icon('talestation_modules/icons/species/skrell/bodyparts.dmi', "skrell_head_m", EAST)
	var/icon/eyes = icon('talestation_modules/icons/species/skrell/skrell_eyes.dmi', "eyes", EAST)

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


