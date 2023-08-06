/// -- mob/living/silicon vars and overrides. --
/mob/living/simple_animal/get_speech_sounds(sound_type)
	return string_assoc_list(list(
		'talestation_modules/sound/voice/radio_ai.ogg' = 100
	))

/mob/living/simple_animal/bot/get_speech_sounds(sound_type)
	return string_assoc_list(list('talestation_modules/sound/voice/radio_ai.ogg' = 100
	))

/mob/living/silicon/get_speech_sounds(sound_type)
	return

// Flavor text for borgs
/mob/living/silicon/robot
	var/datum/examine_panel/tgui = new
