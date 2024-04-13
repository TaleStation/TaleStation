// Tajarans, the REAL cat people
// GLOB list for the species sprites shit
GLOBAL_LIST_EMPTY(tajaran_snout_list)
GLOBAL_LIST_EMPTY(tajaran_ears_list)
GLOBAL_LIST_EMPTY(tajaran_tail_list)
GLOBAL_LIST_EMPTY(tajaran_body_markings_list)

/datum/species/tajaran
	name = "Tajaran"
	id = SPECIES_TAJARAN

	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_NIGHT_VISION,
		TRAIT_LITERATE,
		TRAIT_MUTANT_COLORS,
		TRAIT_CATLIKE_GRACE,
		TRAIT_HATED_BY_DOGS,
	)

	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_bodyparts = list("legs" = "Normal Legs", "tajaran_ears" = "Regular Tajaran Ears", "tajaran_body_markings" = "default")
	external_organs = list(
		/obj/item/organ/external/snout/tajaran_snout = "Regular",
		/obj/item/organ/external/tail/tajaran_tail = "Regular",
		)

	mutantears = /obj/item/organ/internal/ears/tajaran_ears
	species_language_holder = /datum/language_holder/tajaran
	mutanttongue = /obj/item/organ/internal/tongue/tajaran
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

// Randomize tajaran
/datum/species/tajaran/randomize_features(mob/living/carbon/human/human_mob)
	var/list/features = ..()
	features["tajaran_ears"] = pick("Sharp", "Regular", "Tall", "Fluffy", "Short", "Puffy")
	features["tajaran_snout"] = pick("Snout 1", "Snout 2", "Snout 3", "Snout 4", "Snout 5", "Snout 6")
	features["tajaran_markings"] = pick("Default", "Stripes")
	return features

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
/proc/generate_tajaran_side_shots(datum/sprite_accessory/sprite_accessory, key, include_snout = TRUE)
	var/static/icon/tajaran
	var/static/icon/tajaran_with_snout

	if (isnull(tajaran))
		tajaran = icon('talestation_modules/icons/species/tajaran/bodyparts.dmi', "tajaran_head_m", EAST)
		var/icon/eyes = icon('icons/mob/human/human_face.dmi', "eyes", EAST)
		eyes.Blend(COLOR_BLACK, ICON_MULTIPLY)
		tajaran.Blend(eyes, ICON_OVERLAY)

		tajaran_with_snout = icon(tajaran)
		tajaran_with_snout.Blend(icon('talestation_modules/icons/species/tajaran/tajaran_snouts.dmi', "m_tajaran_snout_wide", EAST), ICON_OVERLAY)

	var/icon/final_icon = include_snout ? icon(tajaran_with_snout) : icon(tajaran)

	if (!isnull(sprite_accessory))
		var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
		final_icon.Blend(accessory_icon, ICON_OVERLAY)

	final_icon.Crop(11, 20, 23, 32)
	final_icon.Scale(32, 32)
	final_icon.Blend(COLOR_GRAY, ICON_MULTIPLY)

	return final_icon

/datum/species/tajaran/get_species_speech_sounds(sound_type)
	return string_assoc_list(list(
		'talestation_modules/sound/voice/meow1.ogg' = 50,
		'talestation_modules/sound/voice/meow2.ogg' = 50,
		'talestation_modules/sound/voice/meow3.ogg' = 50,
	))
