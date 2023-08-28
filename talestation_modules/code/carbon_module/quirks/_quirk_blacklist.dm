/// -- Separate file to add in additional blacklists for modular quirks. --
/datum/controller/subsystem/processing/quirks

	/// Species blacklist. Quirks cannot be added to species in the supplied list.
	/* Doesn't work :(
	* Needs to be made on /tg/ tho
	var/static/list/species_blacklist = list(
		"Light Drinker" = list(/datum/species/skrell),
		"Night Vision" = list(/datum/species/tajaran),
		"Frail" = list(/datum/species/avian),
	)
	*/

	/// Species whitelist. Quirks can only be added to species in the supplied list.
	var/static/list/species_whitelist = list(
		//"Language - High Draconic" = list(/datum/species/lizard),
	)
