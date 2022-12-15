// Lizard perks for TGUI
/datum/species/lizard/get_species_description()
	return "Work in Progress."

/datum/species/lizard/get_species_lore()
	return list(
		"Work in Progress.",
	)


/datum/species/lizard/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "drumstick-bite",
			SPECIES_PERK_NAME = "Nutritious Regeneration",
			SPECIES_PERK_DESC = "Lizards heal brute damage when well fed.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "heart",
			SPECIES_PERK_NAME = "Second Heart",
			SPECIES_PERK_DESC = "Lizards have a secondary heart, which acts as the majority of their better-than-average blood regeneration.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "allergies",
			SPECIES_PERK_NAME = "Scaled Body",
			SPECIES_PERK_DESC = "Lizards have a harder time being cut up due to their scales, so surgery on them takes longer.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "wind",
			SPECIES_PERK_NAME = "Finer Senses",
			SPECIES_PERK_DESC = "Lizards who lose their tongue will become monochromatic! Better hold onto your tongues if you know whats good for you. \
								You specifically need a forked tongue for your senses to return.",
	))

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "biohazard",
			SPECIES_PERK_NAME = "Toxin Weakness",
			SPECIES_PERK_DESC = "Lizards have a weakness to toxins, taking additional damage from them, and being worse at purging them from their body.",
	))

	return to_add
