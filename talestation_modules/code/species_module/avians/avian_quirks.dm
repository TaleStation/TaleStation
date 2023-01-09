/datum/species/avian/get_species_description()
	return "Work in Progress."

/datum/species/avian/get_species_lore()
	return list(
		"Work in Progress.",
	)

/datum/species/avian/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "eye",
			SPECIES_PERK_NAME = "Adapted Eyes",
			SPECIES_PERK_DESC = "Tajarans have special, adapted eyes that enable them to see better in the dark!.",
	))

	return to_add
