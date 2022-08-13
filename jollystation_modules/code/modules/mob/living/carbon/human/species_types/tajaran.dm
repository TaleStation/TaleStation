// Tajarans, the REAL cat people
// GLOB list for the species sprites shit
GLOBAL_LIST_EMPTY(tajaran_snout_list)
GLOBAL_LIST_EMPTY(tajaran_tail_list)
GLOBAL_LIST_EMPTY(tajaran_body_markings_list)

/datum/species/tajaran
	name = "Tajaran"
	id = SPECIES_TAJARAN
	say_mod = "meows"

	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAS_FLESH,
		HAS_BONE,
		HAIR,
	)

	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
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
	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
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
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/tajaran,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/tajaran,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/tajaran,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/tajaran,
	)

	// Body temp effects
	bodytemp_heat_damage_limit = (BODYTEMP_HEAT_DAMAGE_LIMIT - 10)
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT + 10)

	digitigrade_customization = DIGITIGRADE_OPTIONAL

// Taken from felinids - Immunity to carpotoxin
/datum/species/tajaran/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H, delta_time, times_fired)
	. = ..()
	if(istype(chem, /datum/reagent/toxin/carpotoxin))
		var/datum/reagent/toxin/carpotoxin/fish = chem
		fish.toxpwr = 0

// Randomize tajaran
/datum/species/tajaran/randomize_main_appearance_element(mob/living/carbon/human/human_mob)
	var/snout = pick(GLOB.tajaran_snout_list)
	mutant_bodyparts["tajaran_snout"] = snout
	human_mob.dna.features["tajaran_snout"] = snout
	human_mob.dna.features["mcolor"] = COLOR_GRAY

	var/obj/item/organ/internal/ears/tajaran_ears/tajaran_ears = human_mob.getorgan(/obj/item/organ/internal/ears/tajaran_ears)
	if (tajaran_ears)
		tajaran_ears.color = human_mob.hair_color
		human_mob.update_body()

	human_mob.update_body()
	human_mob.update_body_parts(update_limb_data = TRUE)

// Tajaran species preview in tgui
/datum/species/tajaran/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.hair_color = "#918787"
	human_for_preview.dna.features["mcolor"] = COLOR_GRAY
	human_for_preview.dna.features["ears"] = "Tajaran"

	var/obj/item/organ/external/snout/tajaran_snout/snout = human_for_preview.getorgan(/obj/item/organ/external/snout/tajaran_snout)
	snout?.set_sprite("Short")

	var/obj/item/organ/internal/ears/tajaran_ears/tajaran_ears = human_for_preview.getorgan(/obj/item/organ/internal/ears/tajaran_ears)
	if (tajaran_ears)
		tajaran_ears.color = human_for_preview.hair_color
		human_for_preview.update_body()

	human_for_preview.update_body()
	human_for_preview.update_body_parts(update_limb_data = TRUE)

// Tajaran say sounds, just old felinid ones
/datum/species/tajaran
	species_speech_sounds = list('jollystation_modules/sound/voice/meow1.ogg' = 50, \
									'jollystation_modules/sound/voice/meow2.ogg' = 50,
									'jollystation_modules/sound/voice/meow3.ogg' = 50)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()

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

/datum/species/tajaran/get_species_description()
	return "Work in Progress."

/datum/species/tajaran/get_species_lore()
	return list(
		"Work in Progress.",
	)

// Tajaran pref quirks info
/datum/species/tajaran/create_pref_temperature_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "thermometer-empty",
			SPECIES_PERK_NAME = "Thick Fur",
			SPECIES_PERK_DESC = "Due to the climate Tajarans are from, their fur is naturually insulating, keeping them warm.",
	))

	to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "temperature-high",
			SPECIES_PERK_NAME = "Thick Fur",
			SPECIES_PERK_DESC = "Unfortunately, due to Tajarans thick fur, they're prone to overheating easier.",
	))

	to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "fish",
			SPECIES_PERK_NAME = "Sushi Lover",
			SPECIES_PERK_DESC = "Tajarans LOVE to consume fish! As a result, they're immune to the toxin effects of carpotoxin.",
	))

	return to_add
