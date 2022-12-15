// Species information
/datum/species/tajaran/get_species_description()
	return "Work in Progress."

/datum/species/tajaran/get_species_lore()
	return list(
		"Work in Progress.",
	)

// Tajaran species quirks
/datum/species/tajaran/create_pref_temperature_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "thermometer-empty",
			SPECIES_PERK_NAME = "Thick Fur",
			SPECIES_PERK_DESC = "Due to the climate Tajarans are from, their fur is naturually insulating, keeping them warm.",
	))

	to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "temperature-high",
			SPECIES_PERK_NAME = "Thick Fur",
			SPECIES_PERK_DESC = "Unfortunately, due to Tajarans thick fur, they're prone to overheating easier.",
	))

	return to_add

/datum/species/tajaran/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "eye",
			SPECIES_PERK_NAME = "Adapted Eyes",
			SPECIES_PERK_DESC = "Tajarans have special, adapted eyes that enable them to see better in the dark!.",
	))

	to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "fish",
			SPECIES_PERK_NAME = "Sushi Lover",
			SPECIES_PERK_DESC = "Tajarans LOVE to consume fish! As a result, they're immune to the toxin effects of carpotoxin.",
	))

	return to_add
