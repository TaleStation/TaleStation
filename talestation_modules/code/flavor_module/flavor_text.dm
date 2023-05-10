// -- Flavor text datum stuff. --
/*
* Add our flavor text stuff to the records upstream
* Yes its a single var now fuck off
*/
/datum/record
	/// Var used to pass general record information
	var/old_general_records
	/// Var used to pass medical record information
	var/old_medical_records
	/// Var used to pass security record information
	var/old_security_records

/mob/living/carbon/human
	///The Examine Panel TGUI.
	var/datum/examine_panel/tgui = new

/datum/antagonist
	/// Whether this antag can see exploitable info on examine.
	var/antag_flags = CAN_SEE_EXPOITABLE_INFO

// Flavor text pref datums for prefs
/datum/preference/text/flavor_text
	abstract_type = /datum/preference/text/flavor_text
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	priority = PREFERENCE_PRIORITY_NAMES

/datum/preference/text/flavor_text/flavor_text
	savefile_key = "flavor_text"

/datum/preference/text/flavor_text/flavor_text/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["flavor_text"] = value

/datum/preference/text/flavor_text/silicon_flavor_text
	savefile_key = "silicon_flavor_text"
	// This does not get a apply_to_human proc, this is read directly in silicon/robot/examine.dm

/datum/preference/text/flavor_text/silicon_flavor_text/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE // To prevent the not-implemented runtime

/datum/preference/text/flavor_text/ooc_notes
	savefile_key = "ooc_notes"

/datum/preference/text/flavor_text/ooc_notes/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["ooc_notes"] = value

/datum/preference/text/flavor_text/general
	savefile_key = "general_records"
	maximum_value_length = MAX_FLAVOR_LEN

/datum/preference/text/flavor_text/general/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/text/flavor_text/medical
	savefile_key = "medical_records"
	maximum_value_length = MAX_FLAVOR_LEN

/datum/preference/text/flavor_text/medical/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/text/flavor_text/security
	savefile_key = "security_records"
	maximum_value_length = MAX_FLAVOR_LEN

/datum/preference/text/flavor_text/security/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/text/flavor_text/exploitable
	savefile_key = "exploitable_info"
	maximum_value_length = MAX_FLAVOR_LEN

/datum/preference/text/flavor_text/exploitable/create_default_value()
	return EXPLOITABLE_DEFAULT_TEXT

/datum/preference/text/flavor_text/exploitable/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE
