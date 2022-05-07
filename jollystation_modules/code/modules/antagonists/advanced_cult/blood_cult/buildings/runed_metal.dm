// Make runed metal not rigid.
/datum/material/runedmetal/New()
	. = ..()
	categories -= MAT_CATEGORY_RIGID

// Real cult walls have a special examine for non-cultists.
/turf/closed/wall/mineral/cult/examine(mob/user)
	. = ..()
	if(isliving(user) && !IS_CULTIST(user))
		var/mob/living/living_user = user
		var/datum/status_effect/dizziness = living_user.has_status_effect(/datum/status_effect/dizziness)
		if(dizziness && dizziness.duration <= 25 && prob(66))
			living_user.set_timed_status_effect(20 SECONDS, /datum/status_effect/dizziness)
			. += span_hypnophrase("The shifting symbols cause you to feel dizzy...")
