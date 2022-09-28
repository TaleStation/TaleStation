
// Lizard overrides
/datum/species/lizard
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE, HAIR)

/datum/species/lizard/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = sanitize_hexcolor(COLOR_DARK_LIME)

	var/obj/item/organ/external/frills/frills = human.getorgan(/obj/item/organ/external/frills)
	frills?.set_sprite("Short")

	var/obj/item/organ/external/horns/horns = human.getorgan(/obj/item/organ/external/horns)
	horns?.set_sprite("Simple")

	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)

// Jelly overrides
/datum/species/jelly
	species_pain_mod = 0.5
	// Changes the default jellyperson to look like slimepeople instead of stargazers
	// (Because slimepeople are more customizable / less ugly)
	hair_color = "mutcolor"
	hair_alpha = 150
	examine_limb_id = SPECIES_JELLYPERSON

/datum/species/jelly/New()
	. = ..()
	species_traits += list(HAIR, FACEHAIR)

/datum/species/jelly/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = sanitize_hexcolor(COLOR_PINK)
	human.hairstyle = "Bob Hair 2"
	human.hair_color = "mutcolor"

	human.update_hair()
	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)

// Plasmaman pain addition
/datum/species/plasmaman
	species_pain_mod = 0.75

// Pod overrides
/datum/species/pod
	species_speech_sounds = list('talestation_modules/sound/voice/pod.ogg' = 70,
				'talestation_modules/sound/voice/pod2.ogg' = 60)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()
	species_pain_mod = 1.05

/datum/species/pod/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = "#886600" // this is literally smells the roses moment

	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)
