/// Unique examine element. Refactored from the skyrat module by Gandalf2k15.
/// Attach to an atom with some parameters to give it unique text when examined.

/*
 * Unique examine element parameters
 * Attach this element to an atom to give it unique examine text if it's double examined by certain people!
 *
 * Params:
 *
 * atom/thing - default element parameter, skip this
 * desc - The unique description displayed from this instance of this element
 * desc_requirement - What we check to see if the examiner gets the unique description - see [examine_defines.dm]
 * desc_special - If we chose a requirement that must be supplied a list, this param is the list it uses
 * desc_affiliation - An alternate affiliation to display to to the examiner
 * hint - Whether the atom hints it may have special examine_more text on normal examine or not
 */

/datum/element/unique_examine
	element_flags = ELEMENT_BESPOKE|ELEMENT_DETACH
	id_arg_index = 2
	/// The requirement setting for special descriptions. See examine_defines.dm for more info.
	var/special_desc_requirement = EXAMINE_CHECK_NONE
	/// The special description that is triggered when special_desc_requirements are met. Make sure you set the correct EXAMINE_CHECK!
	var/special_desc = ""
	/// The special affiliation type, basically overrides the "Syndicate Affiliation" for SYNDICATE check types. It will show whatever organisation you put here instead of "Syndicate Affiliation"
	var/special_desc_affiliation = ""
	/// A list of everything we may want to check based on an examine check.
	/// This can be a list of ROLES, JOBS, FACTIONS, SKILL CHIPS, or TRAITS.
	var/list/special_desc_list
	/// If this is a toy. Toys display a message if you don't succeed the check.
	var/toy = FALSE

/datum/element/unique_examine/Attach(atom/thing, desc, desc_requirement, desc_requirement_list, desc_affiliation, hint = TRUE, is_toy = FALSE)
	. = ..()

	/// Init our vars
	special_desc = desc
	special_desc_requirement = desc_requirement
	special_desc_list = desc_requirement_list
	special_desc_affiliation = desc_affiliation
	toy = is_toy

	// What are we doing if we don't even have a description?
	if(!special_desc)
		stack_trace("Unique examine element attempted to attach to something without an examine text set.")
		return ELEMENT_INCOMPATIBLE

	/// If we were passed a examine check that checks the special list, make sure the special list is filled too
	switch(special_desc_requirement)
		if(EXAMINE_CHECK_TRAIT, EXAMINE_CHECK_SKILLCHIP, EXAMINE_CHECK_FACTION, EXAMINE_CHECK_JOB, EXAMINE_CHECK_ROLE, EXAMINE_CHECK_SPECIES)
			if(!special_desc_list.len)
				stack_trace("Unique examine element attempted to attach to something with a special examine requirement [special_desc_requirement] but provided no list to check.")
				return ELEMENT_INCOMPATIBLE
	if(hint)
		RegisterSignal(thing, COMSIG_PARENT_EXAMINE, .proc/hint_at)
	RegisterSignal(thing, COMSIG_PARENT_EXAMINE_MORE, .proc/examine)

/datum/element/unique_examine/Detach(atom/thing)
	. = ..()
	UnregisterSignal(thing, list(COMSIG_PARENT_EXAMINE, COMSIG_PARENT_EXAMINE_MORE))

/datum/element/unique_examine/proc/hint_at(datum/source, mob/examiner, list/examine_list)
	// What IS this thing anyways?
	var/thing = "thing"
	if(ismob(source))
		thing = "creature"
	if(isanimal(source))
		thing = "animal"
	if(ishuman(source))
		thing = "person"
	if(isobj(source))
		thing = "object"
	if(isgun(source))
		thing = "weapon"
	if(isclothing(source))
		thing = "clothing"
	if(ismachinery(source))
		thing = "machine"
	if(isstructure(source))
		thing = "structure"

	examine_list += "<span class='smallnoticeital'>This [thing] might have additional information if you examine closer.</span>"

/datum/element/unique_examine/proc/examine(datum/source, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	var/composed_message = "<span class='info'>"
	switch(special_desc_requirement)
		//Will always show if set
		if(EXAMINE_CHECK_NONE)
			composed_message += "You note the following: <br>"
			composed_message += special_desc
		//Mindshield checks
		if(EXAMINE_CHECK_MINDSHIELD)
			if(HAS_TRAIT(examiner, TRAIT_MINDSHIELD))
				composed_message += "You note the following because of your <span class='blue'><b>mindshield</b></span>: <br>"
				composed_message += special_desc
		//Standard syndicate checks
		if(EXAMINE_CHECK_ANTAG)
			if(examiner.mind)
				var/datum/mind/M = examiner.mind
				for(var/antag_datum in special_desc_list)
					if(M.has_antag_datum(antag_datum))
						composed_message += "You note the following because of your <span class='red'><b>[special_desc_affiliation ? special_desc_affiliation : "Antagonist Affiliation"]</b></span>: <br>"
						composed_message += special_desc
		//Standard role checks
		if(EXAMINE_CHECK_ROLE)
			if(examiner.mind)
				var/datum/mind/M = examiner.mind
				for(var/checked_role in special_desc_list)
					if(M.special_role == checked_role)
						composed_message += "You note the following because of your <b>[checked_role]</b> role: <br>"
						composed_message += special_desc
		//Standard job checks
		if(EXAMINE_CHECK_JOB)
			if(ishuman(examiner))
				var/mob/living/carbon/human/H = examiner
				for(var/checked_job in special_desc_list)
					if(H.job == checked_job)
						composed_message += "You note the following because of your job as a <b>[checked_job]</b>: <br>"
						composed_message += special_desc
		//Standard faction checks
		if(EXAMINE_CHECK_FACTION)
			for(var/checked_faction in special_desc_list)
				if(checked_faction in examiner.faction)
					composed_message += "You note the following because of your loyalty to <b>[get_formatted_faction(checked_faction)]</b>: <br>"
					composed_message += special_desc
		// Skillchip checks
		if(EXAMINE_CHECK_SKILLCHIP)
			if(ishuman(examiner))
				var/mob/living/carbon/human/human_examiner = examiner
				var/obj/item/organ/brain/examiner_brain = human_examiner.getorganslot(ORGAN_SLOT_BRAIN)
				if(examiner_brain)
					for(var/obj/item/skillchip/checked_skillchip in examiner_brain.skillchips)
						if(checked_skillchip.active && (checked_skillchip.type in special_desc_list))
							composed_message += "You note the following because of your implanted <font color = '#c5c900'><b>[checked_skillchip.name]</b></font>: <br>"
							composed_message += special_desc
		// Trait checks
		if(EXAMINE_CHECK_TRAIT)
			for(var/checked_trait in special_desc_list)
				if(HAS_TRAIT(examiner, checked_trait))
					composed_message += "You note the following because of a <font color = '#c5c900'><b>trait</b></font> you have: <br>"
					composed_message += special_desc
		// Species checks
		if(EXAMINE_CHECK_SPECIES)
			for(var/checked_species in special_desc_list)
				if(is_species(examiner, checked_species))
					composed_message += "You note the following because of <font color = '#008a17'><b>your species</b></font>: <br>"
					composed_message += special_desc

	if(length(composed_message) >= 20) // >= 20 instead of 0 to account for the span
		composed_message += "</span>"
		examine_list += composed_message
	else if(toy) //If we don't have a message and we're a toy, add on the toy message.
		composed_message += "The popular toy resembling [source] from your local arcade, suitable for children and adults alike. </span>"
		examine_list += composed_message

// When given some of the more commonly set factions, formats them into a more accurate title
/datum/element/unique_examine/proc/get_formatted_faction(faction)
	switch(faction)
		if(ROLE_WIZARD)
			return "<span class='hypnophrase'>the Wizard Federation</span>"
		if(ROLE_SYNDICATE)
			return "<span class='red'>the Syndicate</span>"
		if(ROLE_ALIEN)
			return "<span class='alien'>the alien hivemind</span>"
		if(ROLE_NINJA)
			return "<span class='hypnophrase'>the spider clan</span>"
		// I love that some factions use role defines while others use magic strings
		if("Nanotrasen")
			return "<span class='blue'>Nanotrasen</span>" // not necessary but keeping it here
		if("Station")
			return "<span class='blue'>[station_name()]</span>"
		if("heretics")
			return "<span class='hypnophrase'>the Mansus</span>"
		if("cult")
			return "<span class='cult'>Nar'sie</span>"
		if("pirate")
			return "<span class='red'>the Jolly Roger</span>"
		if("plants")
			return "<span class='green'>nature</span>"
		if("ashwalker")
			return "<span class='red'>the tendril</span>"
		if("carp")
			return "<span class='green'>space carp</span>"
		else
			return faction
