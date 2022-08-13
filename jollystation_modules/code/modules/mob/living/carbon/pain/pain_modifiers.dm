// -- Pain modifiers. --
// Species pain modifiers.
/datum/species/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = ..()
	if(!isnull(species_pain_mod))
		C.set_pain_mod(PAIN_MOD_SPECIES, species_pain_mod)

/datum/species/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	C.unset_pain_mod(PAIN_MOD_SPECIES)

// Eternal youth gives a small bonus pain mod.
/datum/symptom/youth/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	switch(A.stage)
		if(5)
			A.affected_mob.set_pain_mod(PAIN_MOD_YOUTH, 0.9)

/datum/symptom/youth/End(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	A.affected_mob.unset_pain_mod(PAIN_MOD_YOUTH)

// Some Traumas
/datum/brain_trauma/mild/concussion/on_life(delta_time, times_fired)
	. = ..()
	if(DT_PROB(1, delta_time))
		owner.cause_pain(BODY_ZONE_HEAD, 10)

/datum/brain_trauma/special/tenacity/on_gain()
	. = ..()
	owner.set_pain_mod(PAIN_MOD_TENACITY, 0)

/datum/brain_trauma/special/tenacity/on_lose()
	owner.unset_pain_mod(PAIN_MOD_TENACITY)
	. = ..()

// Near death experience
/mob/living/carbon/human/set_health(new_value)
	. = ..()
	if(HAS_TRAIT_FROM(src, TRAIT_SIXTHSENSE, "near-death"))
		src.add_mood_event("near-death", /datum/mood_event/deaths_door)
		set_pain_mod(PAIN_MOD_NEAR_DEATH, 0.1)
	else
		src.clear_mood_event("near-death")
		unset_pain_mod(PAIN_MOD_NEAR_DEATH)
