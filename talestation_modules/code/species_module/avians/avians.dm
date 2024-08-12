// GLOB list for the species sprites shit
GLOBAL_LIST_EMPTY(avian_beak_list)
GLOBAL_LIST_EMPTY(avian_tail_list)
GLOBAL_LIST_EMPTY(avian_legs_list)
GLOBAL_LIST_EMPTY(avian_crest_list)
GLOBAL_LIST_INIT(talon_colors, sort_list(list(
	"grey",
	"yellow",
	"orange",
	"blue",
	)))

GLOBAL_LIST_INIT(talon_colors_names, sort_list(list(
	"grey" = "Grey",
	"yellow" = "Yellow",
	"orange" = "Orange",
	"blue" = "Blue",
	)))

/datum/species/avian
	name = "Avian"
	id = SPECIES_AVIAN

	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LITERATE,
		TRAIT_EASILY_WOUNDED,
		TRAIT_MUTANT_COLORS,
		//TRAIT_USES_TALON_COLOR, TO-DO: Reimplament this later
	)

	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_bodyparts = list(
		"avian_legs" = "Planti Talons"
		)
	external_organs = list(
		/obj/item/organ/external/snout/avian_beak = "Regular Beak",
		/obj/item/organ/external/tail/avian_tail = "Wide Tail",
		/obj/item/organ/external/avian_crest = "Kepori",
		)

	mutanteyes = /obj/item/organ/internal/eyes/avian
	mutanttongue = /obj/item/organ/internal/tongue/avian
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

// Randomize avian
/datum/species/avian/randomize_features()
	var/list/features = ..()
	features["avian_legs"] = pick(GLOB.avian_legs_list)
	return features

// Avian species preview in tgui
/datum/species/avian/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	var/obj/item/organ/external/snout/avian_beak/beak = human_for_preview.get_organ_by_type(/obj/item/organ/external/snout/avian_beak)

	human_for_preview.dna.features["mcolor"] = COLOR_WHITE
	human_for_preview.dna.features["avian_crest"] = "Kepori"
	beak.simple_change_sprite(/datum/sprite_accessory/snout/avian_beak/duck)

	human_for_preview.update_body()
	human_for_preview.update_body_parts(update_limb_data = TRUE)

/* TO-DO: Add names later, I copied this over from Tajarans originally, oops!
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
*/

// Generates avian side profile for prefs
/proc/generate_avian_side_shots(datum/sprite_accessory/sprite_accessory, key, include_snout = TRUE)
	var/static/icon/avian
	var/static/icon/avian_with_beak

	if (isnull(avian))
		avian = icon('talestation_modules/icons/species/avians/bodyparts.dmi', "avian_head", EAST)
		var/icon/eyes = icon('icons/mob/human/human_face.dmi', "eyes", EAST)
		eyes.Blend(COLOR_BLACK, ICON_MULTIPLY)
		avian.Blend(eyes, ICON_OVERLAY)

		avian_with_beak = icon(avian)
		avian_with_beak.Blend(icon('talestation_modules/icons/species/avians/avian_beaks.dmi', "m_avian_beak_regular_ADJ", EAST), ICON_OVERLAY)

	var/icon/final_icon = include_snout ? icon(avian_with_beak) : icon(avian)

	if (!isnull(sprite_accessory))
		var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
		final_icon.Blend(accessory_icon, ICON_OVERLAY)

	final_icon.Crop(11, 20, 23, 32)
	final_icon.Scale(32, 32)
	final_icon.Blend(COLOR_WHITE, ICON_MULTIPLY)

	return final_icon

/proc/generate_avian_front_shots(datum/sprite_accessory/sprite_accessory, key, include_snout = TRUE)
	var/static/icon/avian
	var/static/icon/avian_with_beak

	if (isnull(avian))
		avian = icon('talestation_modules/icons/species/avians/bodyparts.dmi', "avian_head", SOUTH)
		var/icon/eyes = icon('icons/mob/human/human_face.dmi', "eyes", SOUTH)
		eyes.Blend(COLOR_BLACK, ICON_MULTIPLY)
		avian.Blend(eyes, ICON_OVERLAY)

		avian_with_beak = icon(avian)
		avian_with_beak.Blend(icon('talestation_modules/icons/species/avians/avian_beaks.dmi', "m_avian_beak_regular_ADJ", SOUTH), ICON_OVERLAY)

	var/icon/final_icon = include_snout ? icon(avian_with_beak) : icon(avian)

	if (!isnull(sprite_accessory))
		var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", SOUTH)
		final_icon.Blend(accessory_icon, ICON_OVERLAY)

	final_icon.Crop(11, 20, 23, 32)
	final_icon.Scale(32, 32)
	final_icon.Blend(COLOR_WHITE, ICON_MULTIPLY)

	return final_icon

/* TO-DO: They need to CAW!!
/datum/species/avian/get_species_speech_sounds(sound_type)
	return string_assoc_list(list(
	))
*/
