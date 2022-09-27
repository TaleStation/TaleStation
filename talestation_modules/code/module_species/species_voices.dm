
// Voices vars
/datum/species
	/// Assoc list of [sounds that play on speech for mobs of this species] to [volume].
	var/species_speech_sounds = list('talestation_modules/sound/voice/speak_1.ogg' = 120, \
									'talestation_modules/sound/voice/speak_2.ogg' = 120, \
									'talestation_modules/sound/voice/speak_3.ogg' = 120, \
									'talestation_modules/sound/voice/speak_4.ogg' = 120)
	/// Assoc list of [sounds that play on question for mobs of this species] to [volume].
	var/species_speech_sounds_ask = list('talestation_modules/sound/voice/speak_1_ask.ogg' = 120, \
										'talestation_modules/sound/voice/speak_2_ask.ogg' = 120, \
										'talestation_modules/sound/voice/speak_3_ask.ogg' = 120, \
										'talestation_modules/sound/voice/speak_4_ask.ogg' = 120)
	/// Assoc list of [sounds that play on exclamation for mobs of this species] to [volume].
	var/species_speech_sounds_exclaim = list('talestation_modules/sound/voice/speak_1_exclaim.ogg' = 120, \
											'talestation_modules/sound/voice/speak_2_exclaim.ogg' = 120, \
											'talestation_modules/sound/voice/speak_3_exclaim.ogg' = 120, \
											'talestation_modules/sound/voice/speak_4_exclaim.ogg' = 120)
	/// Pain modifier that this species receives.
	var/species_pain_mod = null

// Android voices + code
/datum/species/android
	species_speech_sounds = list('talestation_modules/sound/voice/radio_ai.ogg' = 100)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()
	species_pain_mod = 0.2

// Etheral voices
/datum/species/ethereal
	species_speech_sounds = list('talestation_modules/sound/voice/etheral.ogg' = 60)
	species_speech_sounds_ask = list('talestation_modules/sound/voice/etheral_ask.ogg' = 80)
	species_speech_sounds_exclaim = list('talestation_modules/sound/voice/etheral_exclaim.ogg' = 80)

// Felinid voices
/datum/species/human/felinid
	species_speech_sounds = list('talestation_modules/sound/voice/meow1.ogg' = 50, \
									'talestation_modules/sound/voice/meow2.ogg' = 50,
									'talestation_modules/sound/voice/meow3.ogg' = 50)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()

// Fly people voices
/datum/species/fly
	species_speech_sounds = list('talestation_modules/sound/voice/fly.ogg' = 80, \
								'talestation_modules/sound/voice/fly2.ogg' = 80)
	species_speech_sounds_ask = list('talestation_modules/sound/voice/fly_ask.ogg' = 80)
	species_speech_sounds_exclaim = list('talestation_modules/sound/voice/fly_exclaim.ogg' = 80)
	species_pain_mod = 1.2

// Human voices
/datum/species/human
	mutant_bodyparts = list("wings" = "None", "ears" = "None", "tail" = "None")
	external_organs = list(
		/obj/item/organ/external/tail/cat = "None",
	)

// Lizard voices
/datum/species/lizard
	species_speech_sounds = list('talestation_modules/sound/voice/lizard_1.ogg' = 80, \
						'talestation_modules/sound/voice/lizard_2.ogg' = 80, \
						'talestation_modules/sound/voice/lizard_3.ogg' = 80)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()

// Monkey voices
/datum/species/monkey
	species_speech_sounds = list('talestation_modules/sound/voice/monkey_1.ogg' = 90)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()

// Moth voices + code
/datum/species/moth
	species_speech_sounds = list('talestation_modules/sound/voice/moff_1.ogg' = 80, \
						'talestation_modules/sound/voice/moff_2.ogg' = 80, \
						'talestation_modules/sound/voice/moff_3.ogg' = 80)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()
	species_pain_mod = 1.1

// Pod voices + code
/datum/species/pod
	species_speech_sounds = list('talestation_modules/sound/voice/pod.ogg' = 70,
				'talestation_modules/sound/voice/pod2.ogg' = 60)
	species_speech_sounds_ask = list()
	species_speech_sounds_exclaim = list()
	species_pain_mod = 1.05

// Skeleton voices + code
/datum/species/skeleton
	name = "Skeleton"
	species_speech_sounds = list('talestation_modules/sound/voice/skelly.ogg' = 90)
	species_speech_sounds_exclaim = list('talestation_modules/sound/voice/skelly_ask.ogg' = 90)
	species_speech_sounds_ask = list('talestation_modules/sound/voice/skelly_exclaim.ogg' = 90)
	species_pain_mod = 0.4
