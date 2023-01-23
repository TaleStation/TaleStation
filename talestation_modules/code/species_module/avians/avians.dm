// GLOB list for the species sprites shit
GLOBAL_LIST_EMPTY(avian_beak_list)
GLOBAL_LIST_EMPTY(avian_tail_list)
GLOBAL_LIST_EMPTY(avian_talon_l_list)
GLOBAL_LIST_EMPTY(avian_talon_r_list)

/datum/species/avian
	name = "Avian"
	id = SPECIES_AVIAN

	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAIR,
	)

	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LITERATE,
		TRAIT_EASILY_WOUNDED,
	)

	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_bodyparts = list("legs" = "Normal Legs")
	external_organs = list(
		/obj/item/organ/external/snout/avian_beak = "Short",
		/obj/item/organ/external/tail/avian_tail = "Wide",
		/obj/item/organ/external/leg/avian_talon/left_leg = "Left Plantigrade Talon",
		/obj/item/organ/external/leg/avian_talon/right_leg = "Right Plantigrade Talon",
		)

	mutanttongue = /obj/item/organ/internal/tongue/avian
	disliked_food = CLOTH
	liked_food = GRAIN | FRUIT | VEGETABLES
	toxic_food = MEAT | SEAFOOD
	payday_modifier = 0.75
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	examine_limb_id = SPECIES_MAMMAL
	species_pain_mod = 1

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/avian,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/avian,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/avian,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/avian,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/avian,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/avian,
	)

	digitigrade_customization = DIGITIGRADE_OPTIONAL

	// Say sounds
	species_speech_sounds = list('talestation_modules/sound/voice/meow1.ogg' = 50, \
									'talestation_modules/sound/voice/meow2.ogg' = 50,
									'talestation_modules/sound/voice/meow3.ogg' = 50)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()

// Randomize tajaran
/datum/species/avian/randomize_features(mob/living/carbon/human/human_mob)
	human_mob.dna.features["ears"] = pick(GLOB.ears_list)
	randomize_external_organs(human_mob)

// Tajaran species preview in tgui
/datum/species/avian/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	//human_for_preview.hairstyle = "Business Hair"
	//human_for_preview.hair_color = "#504444"
	human_for_preview.dna.features["mcolor"] = COLOR_WHITE
	human_for_preview.dna.features["avian_beak"] = "short"
	human_for_preview.dna.features["avian_tail"] = "wide"
	human_for_preview.dna.features["avian_talon_l"] = "Left Digitigrade Talon"
	human_for_preview.dna.features["avian_talon_r"] = "Right Digitigrade Talon"

	human_for_preview.update_body()
	human_for_preview.update_body_parts(update_limb_data = TRUE)

/datum/species/avian/random_name(gender,unique,lastname)
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

// Generates avian side profile for prefs
/proc/generate_avian_side_shots(list/sprite_accessories, key, include_snout = TRUE)
	var/list/values = list()

	var/icon/avian = icon('talestation_modules/icons/mob/species/tajaran/bodyparts.dmi', "tajaran_head_m", EAST)

	var/icon/eyes = icon('icons/mob/species/human/human_face.dmi', "eyes", EAST)
	eyes.Blend(COLOR_BLACK, ICON_MULTIPLY)
	avian.Blend(eyes, ICON_OVERLAY)

	if (include_snout)
		avian.Blend(icon('talestation_modules/icons/mob/avian_beaks.dmi', "m_avian_beak_short", EAST), ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(avian)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_WHITE, ICON_MULTIPLY)

		values[name] = final_icon

	return values
