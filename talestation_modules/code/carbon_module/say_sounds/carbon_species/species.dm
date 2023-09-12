/// -- Extensions of species and species procs. --
/datum/species
	/// Pain modifier that this species receives.
	var/species_pain_mod = null

/datum/species/proc/get_species_speech_sounds(sound_type)
	switch(sound_type)
		if(SOUND_QUESTION)
			return string_assoc_list(list(
				'talestation_modules/sound/voice/speak_1_ask.ogg' = 35,
			))
		if(SOUND_EXCLAMATION)
			return string_assoc_list(list(
				'talestation_modules/sound/voice/speak_1_exclaim.ogg' = 35,
			))
		else
			return string_assoc_list(list(
				'talestation_modules/sound/voice/speak_1.ogg' = 35,
				'talestation_modules/sound/voice/speak_2.ogg' = 35,
			))
