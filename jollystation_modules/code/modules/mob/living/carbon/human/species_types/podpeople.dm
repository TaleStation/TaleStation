// -- Podperson species additions --
/datum/species/pod
	species_speech_sounds = list('jollystation_modules/sound/voice/pod.ogg' = 70,
				'jollystation_modules/sound/voice/pod2.ogg' = 60)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()
	species_pain_mod = 1.05

/datum/species/pod/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = "#886600" // this is literally smells the roses moment

	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)

// Description and lore
/datum/species/pod/get_species_description()
	return "Work in Progress."

/datum/species/pod/get_species_lore()
	return list(
		"Work in Progress.",
	)
