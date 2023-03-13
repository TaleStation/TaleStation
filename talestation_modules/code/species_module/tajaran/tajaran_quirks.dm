// Species information
/datum/species/tajaran/get_species_description()
	return "Tajaran are cold-alinged species. Their thick fur helps protect them during sever cold temperatures, but \
		doesn't offer much if its any warmer than room temperature. \
		\
		Tajaran's are very sociable, loving to enjoy parties and be around others. Some are more serious to the occasion \
		than some of their other brothers and sisters, but altogether, Tajarans love a good party. \
		\
		Tajaran's are also a force to be reckoned with. Due to Kalt's long nights, Tajaran's have adapted elevated rods in their \
		eyes, enabling enhanced vision at night."

/datum/species/tajaran/get_species_lore()
	return list(
		"Kalt is the home world for Tajarans. A cold, frozen planet where the sun on rises every couple of years.\
		\
		Kalt is known mainly for Snefald, or, the snow season. This is what Tajaran's know, until Sol occurs. Sol is the season \
		of the Sun, befittingly named. Sol only occurs once every three Earth seasons. Sometimes, it may not even occur for many, \
		MANY years, leaving Kalt and the Tajarans in an endless Snefald. \
		\
		Tajarans's are sociable creatures, enjoying many holidays together, even celebrating the smallest of celebrations. \
		Birthdays, weddings, even their non-aligned holidays, Tajarans will always throw the biggest and baddest parties. \
		\
		Tajaran's celebrate two notable holidays; \
		\
		On Galactic March 2nd, Solljarm is celebrated. Solljarm is a memorable day in Tajaran history, that being, 'The Day the Sun Finally Rose'. \
		After a brutal 10 years of Snefald, Sol finally occured and the Tajarans basked in the suns warm rays. Some say, that Sol was the warmest Kalt ever experienced. \
		\
		On Galactic August 4th, Kristne is celebrated. Kristne is the birth of one of Tajaras longest reigning monarchs, who passed in 2509. This former monarch \
		was beloved by all and guided the Tajarans through many cold and harsh Snefald nights. Under their hand, Kristne gave warmth to those far and wide, becoming \
		the known Tajara symbol for Hope and Love.",
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

	return to_add
