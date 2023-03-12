/// Tajaran langauge
/datum/language/tajaran
	name = "Tajaranese"
	desc = "What's describe as 'psp psp psp with a lot of love', Tajaranese is the langauge \
			of Tajarans, if the name itself wasn't a giveaway."
	key = "t"
	space_chance = 75
	syllables = list(
		"psp", "pspsp", "mow", "mraw", "mwa", "maawh", "psssp", "psspss")
	default_priority = 90
	icon_state = "animal"

/datum/language_holder/tajaran
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/tajaran = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/tajaran = list(LANGUAGE_ATOM))
