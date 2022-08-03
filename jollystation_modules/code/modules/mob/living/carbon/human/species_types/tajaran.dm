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
	mutant_bodyparts = list("legs" = "Normal Legs",)
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

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/tajaran,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/tajaran,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/tajaran,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/tajaran,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/tajaran,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/tajaran,
	)

	digitigrade_customization = DIGITIGRADE_OPTIONAL

/datum/species/moth/randomize_main_appearance_element(mob/living/carbon/human/human_mob)
	var/snout = pick(GLOB.tajaran_snout_list)
	mutant_bodyparts["tajaran_snout"] = snout
	human_mob.dna.features["snout"] = snout
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

/datum/species/tajaran/get_species_description()
	return "Work in Progress."

/datum/species/tajaran/get_species_lore()
	return list(
		"Work in Progress.",
	)

// Tajarans unique organs and stuff
/obj/item/organ/internal/ears/tajaran_ears
	name = "tajaran ears"
	visual = TRUE
	damage_multiplier = 2

/obj/item/organ/internal/ears/tajaran_ears/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		color = ear_owner.hair_color
		ear_owner.dna.features["tajaran_ears"] = ear_owner.dna.species.mutant_bodyparts["tajaran_ears"] = "Large"
		ear_owner.dna.update_uf_block(DNA_TAJARAN_EARS_BLOCK)
		ear_owner.update_body()
