/// -- Separate file to add in additional blacklists for modular quirks. --
/datum/controller/subsystem/processing/quirks
	/// Modular quirk blacklist. This is added into the master blacklist on Initialize.
	var/static/list/module_blacklist = list(
		list(/datum/quirk/allodynia, /datum/quirk/pain_vulnerability, /datum/quirk/pain_resistance, /datum/quirk/glass_jaw),
		list(/datum/quirk/allodynia, /datum/quirk/bad_touch),
		list(/datum/quirk/body_purist, /datum/quirk/prosthetic_limb/targeted/left_arm),
		list(/datum/quirk/body_purist, /datum/quirk/prosthetic_limb/targeted/left_leg),
		list(/datum/quirk/body_purist, /datum/quirk/prosthetic_limb/targeted/right_arm),
		list(/datum/quirk/body_purist, /datum/quirk/prosthetic_limb/targeted/right_leg),
	)
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

//Extends the initialization proc, adding the module blacklists we have after the main init finishes.
/datum/controller/subsystem/processing/quirks/Initialize(start_timeofday)
	GLOB.quirk_blacklist.Add(module_blacklist)
	return ..()
