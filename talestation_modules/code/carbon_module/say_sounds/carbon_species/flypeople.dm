// -- Flyperson species additions --
/datum/species/fly/get_species_speech_sounds(sound_type)
	switch(sound_type)
		if(SOUND_QUESTION)
			return string_assoc_list(list('talestation_modules/sound/voice/fly_ask.ogg' = 80))
		if(SOUND_EXCLAMATION)
			return string_assoc_list(list('talestation_modules/sound/voice/fly_exclaim.ogg' = 80))
		else
			return string_assoc_list(list(
				'talestation_modules/sound/voice/fly.ogg' = 80,
				'talestation_modules/sound/voice/fly2.ogg' = 80,
			))
