// -- Good Modular quirks. --

/// Blacklist for the random language quirk. We won't give these languages out.
#define LANGUAGE_QUIRK_RANDOM_BLACKLIST list( \
	/datum/language/uncommon, \
	/datum/language/common, \
	/datum/language/narsie, \
	/datum/language/xenocommon )

// New quirks

/datum/quirk/no_appendix
	name = "Appendicitis Survivor"
	desc = "You had a run in with appendicitis in the past and no longer have an appendix."
	icon = FA_ICON_NOTES_MEDICAL
	value = 2
	gain_text = span_notice("You no longer have an appendix.")
	lose_text = span_danger("Your appendix has magically.. regrown?")
	medical_record_text = "Patient had appendicitis in the past and has had their appendix surgically removed."
	/// The mob's original appendix
	var/obj/item/organ/internal/appendix/old_appendix

/datum/quirk/no_appendix/post_add()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder
	old_appendix = carbon_quirk_holder.get_organ_slot(ORGAN_SLOT_APPENDIX)

	if(isnull(old_appendix))
		return

	old_appendix.Remove(carbon_quirk_holder, special = TRUE)
	old_appendix.moveToNullspace()

	STOP_PROCESSING(SSobj, old_appendix)

/datum/quirk/no_appendix/remove()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder

	if(isnull(old_appendix))
		return

	var/obj/item/organ/internal/appendix/current_appendix = carbon_quirk_holder.get_organ_slot(ORGAN_SLOT_APPENDIX)

	// if we have not gained an appendix already, put the old one back
	if(isnull(current_appendix))
		old_appendix.Insert(carbon_quirk_holder, special = TRUE)
	else
		qdel(old_appendix)

	old_appendix = null

// Less vulnerable to pain (lower pain modifier)
/datum/quirk/pain_resistance
	name = "Hypoalgesia"
	desc = "You're more resistant to pain - Your pain naturally decreases faster and you receive less overall."
	icon = FA_ICON_FIST_RAISED
	value = 8
	gain_text = span_notice("You feel duller.")
	lose_text = span_danger("You feel sharper.")
	medical_record_text = "Patient has Hypoalgesia, and is less susceptible to pain stimuli than most."

/datum/quirk/pain_resistance/add()
	var/mob/living/carbon/carbon_holder = quirk_holder
	if(istype(carbon_holder))
		carbon_holder.set_pain_mod(PAIN_MOD_QUIRK, 0.9)

/datum/quirk/pain_resistance/remove()
	var/mob/living/carbon/carbon_holder = quirk_holder
	if(istype(carbon_holder))
		carbon_holder.unset_pain_mod(PAIN_MOD_QUIRK)

/datum/quirk/bilingual
	desc = "Over the years you've picked up an extra language! (This quirk enables the langauge manager.)"
	value = 2

#undef LANGUAGE_QUIRK_RANDOM_BLACKLIST
