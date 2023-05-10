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

/datum/antagonist
	/// Whether this antag can see exploitable info on examine.
	var/antag_flags = CAN_SEE_EXPOITABLE_INFO

// Flavor text pref datums
/datum/preference/multiline_text
	abstract_type = /datum/preference/multiline_text
	can_randomize = FALSE

/datum/preference/multiline_text/deserialize(input, datum/preferences/preferences)
	return STRIP_HTML_SIMPLE("[input]", MAX_FLAVOR_LEN)

/datum/preference/multiline_text/serialize(input)
	return STRIP_HTML_SIMPLE(input, MAX_FLAVOR_LEN)

/datum/preference/multiline_text/is_valid(value)
	return istext(value) && !isnull(STRIP_HTML_SIMPLE(value, MAX_FLAVOR_LEN))

/datum/preference/multiline_text/create_default_value()
	return null

/datum/preference/multiline_text/flavor_datum
	abstract_type = /datum/preference/multiline_text/flavor_datum
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	priority = PREFERENCE_PRIORITY_NAMES

/datum/preference/multiline_text/flavor_datum/flavor_text
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "flavor_text"

/datum/preference/multiline_text/flavor_datum/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["flavor_text"] = value

/datum/preference/multiline_text/flavor_datum/silicon_flavor_text
	savefile_key = "silicon_flavor_text"
	// This does not get a apply_to_human proc, this is read directly in silicon/robot/examine.dm

/datum/preference/multiline_text/flavor_datum/silicon_flavor_text/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE // To prevent the not-implemented runtime

/datum/preference/multiline_text/flavor_datum/ooc_notes
	savefile_key = "ooc_notes"

/datum/preference/multiline_text/flavor_datum/ooc_notes/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["ooc_notes"] = value

/datum/preference/multiline_text/flavor_datum/exploitable
	savefile_key = "exploitable_info"

/datum/preference/multiline_text/flavor_datum/exploitable/apply_to_human(mob/living/carbon/human/target, value)
	return FALSE
/datum/preference/multiline_text/flavor_datum/general
	savefile_key = "general_records"

/datum/preference/multiline_text/flavor_datum/general/apply_to_human(mob/living/carbon/human/target, value)
	return FALSE

/datum/preference/multiline_text/flavor_datum/security
	savefile_key = "security_records"

/datum/preference/multiline_text/flavor_datum/security/apply_to_human(mob/living/carbon/human/target, value)
	return FALSE

/datum/preference/multiline_text/flavor_datum/medical
	savefile_key = "medical_records"

/datum/preference/multiline_text/flavor_datum/medical/apply_to_human(mob/living/carbon/human/target, value)
	return FALSE


/mob/living/carbon/human/Topic(href, href_list)
	. = ..()

	if(href_list["lookup_info"])
		switch(href_list["lookup_info"])
			if("open_examine_panel")
				tgui.holder = src
				tgui.ui_interact(usr) //datum has a tgui component, here we open the window

/mob/living/carbon/human
	///The Examine Panel TGUI.
	var/datum/examine_panel/tgui = new
