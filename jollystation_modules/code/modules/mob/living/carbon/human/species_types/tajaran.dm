// Tajarans, the REAL cat people
// GLOB list for the species sprites shit
GLOBAL_LIST_EMPTY(tajaran_ears_list)
GLOBAL_LIST_EMPTY(tajaran_snout_list)
GLOBAL_LIST_EMPTY(tajaran_tail_list)
GLOBAL_LIST_EMPTY(tajaran_markings_list)

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
	mutant_bodyparts = list("body_markings" = "None", "legs" = "Normal Legs")
	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	disliked_food = CLOTH
	liked_food = GRAIN | MEAT
	payday_modifier = 0.75
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	examine_limb_id = SPECIES_MAMMAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/tajaran,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/tajaran,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/tajaran,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/tajaran,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/tajaran,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/tajaran,
	)
	digitigrade_customization = DIGITIGRADE_OPTIONAL

/datum/species/tajaran/randomize_main_appearance_element(mob/living/carbon/human/human_mob)
	var/tail = pick(GLOB.tails_list_lizard)
	human_mob.dna.features["tail_lizard"] = tail
	mutant_bodyparts["tail_lizard"] = tail
	human_mob.update_body()

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

/datum/species/tajaran/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = sanitize_hexcolor(COLOR_GRAY)
	human.update_body()
	human.update_body_parts()

/datum/species/tajaran/get_species_description()
	return "Work in Progress."

/datum/species/tajaran/get_species_lore()
	return list(
		"Work in Progress.",
	)

/mob/living/carbon/human/species/tajaran
	race = /datum/species/tajaran

// Tajarans unique organs and stuff
/obj/item/organ/external/tajaran_ears
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_TAJARAN_EARS
	layers = EXTERNAL_FRONT
	dna_block = DNA_TAJARAN_EARS_BLOCK
	feature_key = "tajaran_ears"
	preference = "feature_tajaran_ears"

/obj/item/organ/external/tajaran_ears/get_global_feature_list()
	return GLOB.tajaran_ears_list

/obj/item/organ/external/tajaran_tail
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_EXTERNAL_TAJARAN_TAIL
	layers = EXTERNAL_BEHIND
	dna_block = DNA_TAJARAN_TAIL_BLOCK
	feature_key = "tajaran_tail"
	preference = "feature_tajaran_tail"

/obj/item/organ/external/tajaran_tail/get_global_feature_list()
	return GLOB.tajaran_tail_list
