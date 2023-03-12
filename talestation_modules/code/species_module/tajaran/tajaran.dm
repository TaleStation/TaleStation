// Tajarans, the REAL cat people
// GLOB list for the species sprites shit
GLOBAL_LIST_EMPTY(tajaran_snout_list)
GLOBAL_LIST_EMPTY(tajaran_tail_list)
GLOBAL_LIST_EMPTY(tajaran_body_markings_list)

/datum/species/tajaran
	name = "Tajaran"
	id = SPECIES_TAJARAN

	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAIR,
	)

	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_NIGHT_VISION,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_LITERATE,
	)

	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_bodyparts = list("legs" = "Normal Legs", "ears" = "Tajaran", "tajaran_body_markings" = "default")
	external_organs = list(
		/obj/item/organ/external/snout/tajaran_snout = "Regular",
		/obj/item/organ/external/tail/tajaran_tail = "Regular",
		)

	mutantears = /obj/item/organ/internal/ears/tajaran_ears
	species_language_holder = /datum/language_holder/tajaran
	mutanttongue = /obj/item/organ/internal/tongue/tajaran
	disliked_food = CLOTH
	liked_food = GRAIN | MEAT | SEAFOOD
	payday_modifier = 0.75
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	examine_limb_id = SPECIES_MAMMAL
	coldmod = 0.67
	heatmod = 1.5
	species_pain_mod = 1

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/tajaran,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/tajaran,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/tajaran,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/tajaran,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/tajaran,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/tajaran,
	)

	// Body temp effects
	bodytemp_heat_damage_limit = (BODYTEMP_HEAT_DAMAGE_LIMIT - 10)
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT + 10)

	digitigrade_customization = DIGITIGRADE_OPTIONAL

	// Say sounds
	species_speech_sounds = list('talestation_modules/sound/voice/meow1.ogg' = 50, \
									'talestation_modules/sound/voice/meow2.ogg' = 50,
									'talestation_modules/sound/voice/meow3.ogg' = 50)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()

// Randomize tajaran
/datum/species/tajaran/randomize_features(mob/living/carbon/human/human_mob)
	human_mob.dna.features["ears"] = pick(GLOB.ears_list)
	randomize_external_organs(human_mob)

// Tajaran species preview in tgui
/datum/species/tajaran/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.hairstyle = "Business Hair"
	human_for_preview.hair_color = "#504444"
	human_for_preview.dna.features["mcolor"] = COLOR_GRAY
	human_for_preview.dna.features["ears"] = "Tajaran"

	human_for_preview.update_body()
	human_for_preview.update_body_parts(update_limb_data = TRUE)

/datum/species/tajaran/random_name(gender,unique,lastname)
	var/randname
	if(gender == MALE)
		randname = pick(GLOB.first_names_male_taj)
	else
		randname = pick(GLOB.first_names_female_taj)

	if(lastname)
		randname += " [lastname]"
	else
		randname += " [pick(GLOB.last_names_taj)]"

	return randname

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
