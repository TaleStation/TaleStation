// -- Flavor text datum stuff. --
/// Global list of all flavor texts we have generated. Associated list of [mob name] to [datum ref]
GLOBAL_LIST_EMPTY(flavor_texts)

/*
 * Gets the mob's flavor text datum from the global associated lists of flavor texts.
 * If no flavor text was found, create a new flavor text datum for [added_mob]
 *
 * Returns a datum instance - either a new flavor text or a flavor text from the global list
 * Returns null if the mob was not living or something goes wrong
 */
/proc/add_or_get_mob_flavor_text(mob/living/added_mob)
	RETURN_TYPE(/datum/flavor_text)

	if(!istype(added_mob))
		return null

	var/datum/flavor_text/found_text = GLOB.flavor_texts[added_mob.real_name]
	if(!found_text)
		found_text = new /datum/flavor_text(added_mob)
		GLOB.flavor_texts[added_mob.real_name] = found_text
		if(added_mob.linked_flavor)
			stack_trace("We just made a new flavor text datum for [added_mob] even though it had flavor text linked already, something is messed up")
		added_mob.linked_flavor = found_text

	return found_text

/*
* Add our flavor text stuff to the records upstream
* Yes its a single var now fuck off
*/
/datum/record
	/// Var used to pass general record information
	var/old_general_records = "Unknown"
	/// Var used to pass medical record information
	var/old_medical_records = "Unknown"
	/// Var used to pass security record information
	var/old_security_records = "Unknown"

/// Flavor text define for carbons.
/mob/living
	/// The flavor text linked to our carbon.
	var/datum/flavor_text/linked_flavor

/mob/living/Destroy()
	linked_flavor = null // We should never QDEL flavor text datums.
	return ..()

/// The actual flavor text datum. This should never be qdeleted - just leave it floating in the global list.
/datum/flavor_text
	/// The mob that owns this flavor text.
	var/datum/weakref/owner
	/// The name associated with this flavor text.
	var/name
	/// The species associated with this flavor text.
	var/linked_species
	/// The actual flavor text.
	var/flavor_text
	/// General records associated with this flavor text
	var/gen_records
	/// Medical records associated with this flavor text
	var/med_records
	/// Security records associated with this flavor text
	var/sec_records
	/// Exploitable info associated with this flavor text
	var/expl_info

/datum/flavor_text/New(mob/living/initial_linked_mob)
	owner = WEAKREF(initial_linked_mob)
	name = initial_linked_mob.real_name

	if(issilicon(initial_linked_mob))
		linked_species = "silicon"
	else if(ishuman(initial_linked_mob))
		var/mob/living/carbon/human/human_mob = initial_linked_mob
		linked_species = human_mob.dna?.species?.id
	else
		linked_species = "simple"

/*
 * Get the href buttons for all the mob's records, formatted.
 *
 * examiner - who's POV we're gettting the records from
 *
 * returns a string
 */
/datum/flavor_text/proc/get_records_text(mob/living/carbon/human/examiner)
	if(!examiner)
		CRASH("get_records_text() called without an examiner argument - proc is not implemented for a null examiner")

	. = ""

	// Antagonists can see exploitable info.
	if(examiner.mind?.antag_datums && expl_info)
		for(var/datum/antagonist/antag_datum as anything in examiner.mind.antag_datums)
			if(antag_datum.antag_flags & CAN_SEE_EXPOITABLE_INFO)
				. += "<a href='?src=[REF(src)];exploitable_info=1'>\[Exploitable Info\]</a>"
				break

	// Medhuds can see medical records.
	if(examiner.check_med_hud_and_access())
		if(med_records)
			. += "<a href='?src=[REF(src)];medical_records=1'>\[Past Medical Records\]</a>"
		if(gen_records)
			. += "<a href='?src=[REF(src)];general_records=1'>\[General Records\]</a>"
	// Sechuds can see security records.
	if(sec_records && examiner.check_sec_hud_and_access())
		. += "<a href='?src=[REF(src)];security_records=1'>\[Past Security Records\]</a>"

	if(.)
		. += "\n"

/*
 * All-In-One proc that gets the flavor text and record hrefs and formats it into one message.
 *
 * examiner - who's POV we're gettting this flavor text from
 * shorten - whether to cut it off at [EXAMINE_FLAVOR_MAX_DISPLAYED]
 *
 * returns a string
 */
/datum/flavor_text/proc/get_flavor_and_records_links(mob/living/carbon/human/examiner, shorten = TRUE)
	if(!examiner)
		CRASH("get_flavor_and_records_links() called without an examiner argument - proc is not implemented for a null examiner")

	. = ""

	// Whether or not we would have additional info on `examine_more()`.
	var/list/added_info = list()

	// Antagonists can see expoitable information.
	if(expl_info && examiner.mind?.antag_datums)
		for(var/datum/antagonist/antag_datum as anything in examiner.mind.antag_datums)
			if(antag_datum.antag_flags & CAN_SEE_EXPOITABLE_INFO)
				added_info += "exploitable information"
				break
	// Medhuds can see medical and general records, with adequate access.
	if(examiner.check_med_hud_and_access() && (med_records || gen_records))
		added_info += "past records"
	// Sechuds can see security records, with adequate access.
	else if(examiner.check_sec_hud_and_access() && sec_records)
		added_info += "past records"

	else
		. += get_records_text(examiner)

/datum/flavor_text/Topic(href, href_list)
	. = ..()
	if(href_list["flavor_text"])
		if(flavor_text)
			var/datum/browser/popup = new(usr, "[name]'s flavor text", "[name]'s Flavor Text (expanded)", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s flavor text (expanded)", replacetext(flavor_text, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["general_records"])
		if(gen_records)
			var/datum/browser/popup = new(usr, "[name]'s gen rec", "[name]'s General Record", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s general records", replacetext(gen_records, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["security_records"])
		if(sec_records)
			var/datum/browser/popup = new(usr, "[name]'s sec rec", "[name]'s Security Record", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s security records", replacetext(sec_records, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["medical_records"])
		if(med_records)
			var/datum/browser/popup = new(usr, "[name]'s med rec", "[name]'s Medical Record", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s medical records", replacetext(med_records, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["exploitable_info"])
		if(expl_info)
			var/datum/browser/popup = new(usr, "[name]'s exp info", "[name]'s Exploitable Info", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s exploitable information", replacetext(expl_info, "\n", "<BR>")))
			popup.open()
			return

// Flavor text pref datums for prefs
/datum/preference/text/flavor_text
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "flavor_text"

/datum/preference/text/flavor_text/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["flavor_text"] = value

/datum/preference/text/silicon_flavor_text
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "silicon_flavor_text"
	// This does not get a apply_to_human proc, this is read directly in silicon/robot/examine.dm

/datum/preference/text/silicon_flavor_text/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE // To prevent the not-implemented runtime

/datum/preference/text/ooc_notes
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "ooc_notes"

/datum/preference/text/ooc_notes/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["ooc_notes"] = value

/datum/preference/text/custom_species
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "custom_species"

/datum/preference/text/custom_species/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["custom_species"] = value

/datum/preference/text/custom_species_lore
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "custom_species_lore"

/datum/preference/text/custom_species_lore/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["custom_species_lore"] = value
