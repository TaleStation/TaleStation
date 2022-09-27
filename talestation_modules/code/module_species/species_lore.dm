
// Human lore + perk
/datum/species/human/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "dna",
			SPECIES_PERK_NAME = "Genetic Modifications",
			SPECIES_PERK_DESC = "Humans have opened the flood gates to editing their genomes. \
				And no, we're not talking about the ability to breath fire. Humans can select to apply \
				cat ears or tails to their persons. However, keep in mind, genetically modifying yourself \
				does not protect you from Asimov! Silicons are free to ignore you, as you're now subhuman filth. \
				Disgusting.",
		))

	if(CONFIG_GET(number/default_laws) == 0) // Default lawset is set to Asimov
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "robot",
			SPECIES_PERK_NAME = "Asimov Superiority",
			SPECIES_PERK_DESC = "The AI and their cyborgs are, by default, subservient only \
				to humans. As a human, silicons are required to both protect and obey you.",
		))

	return to_add

// Jelly lore
/datum/species/jelly/get_species_description()
	return "Work in Progress."

/datum/species/jelly/get_species_lore()
	return list(
		"Work in Progress.",
	)

// Pod lore
/datum/species/pod/get_species_description()
	return "Work in Progress."

/datum/species/pod/get_species_lore()
	return list(
		"Work in Progress.",
	)
