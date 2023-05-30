/// -- Extensions of species and species procs. --
/datum/species
	/// Assoc list of [sounds that play on speech for mobs of this species] to [volume].
	var/species_speech_sounds = list('talestation_modules/sound/voice/speak_1.ogg' = 35, \
									'talestation_modules/sound/voice/speak_2.ogg' = 35, \
									)
	/// Assoc list of [sounds that play on question for mobs of this species] to [volume].
	var/species_speech_sounds_ask = list('talestation_modules/sound/voice/speak_1_ask.ogg' = 35, \
									)
	/// Assoc list of [sounds that play on exclamation for mobs of this species] to [volume].
	var/species_speech_sounds_exclaim = list('talestation_modules/sound/voice/speak_1_exclaim.ogg' = 35, \
									)
	/// Pain modifier that this species receives.
	var/species_pain_mod = null
