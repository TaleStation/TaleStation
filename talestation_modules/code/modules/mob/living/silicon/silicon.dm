/// -- mob/living/silicon vars and overrides. --
/mob/living/silicon
	mob_radio_sounds = list('talestation_modules/sound/voice/radio_ai.ogg' = 100)
	mob_speech_sounds = list('talestation_modules/sound/voice/radio_ai.ogg' = 100)

// Flavor text for borgs
/mob/living/silicon/robot
	var/datum/examine_panel/tgui = new
