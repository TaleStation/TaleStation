// Make runed metal not rigid.
/datum/material/runedmetal/New()
	. = ..()
	categories -= MAT_CATEGORY_RIGID

// Real cult walls have a special examine for non-cultists.
/turf/closed/wall/mineral/cult/examine(mob/user)
	. = ..()
	if(isliving(user) && !IS_CULTIST(user))
		var/mob/living/living_user = user
		if(prob(66))
			living_user.set_timed_status_effect(25 SECONDS, /datum/status_effect/dizziness, only_if_higher = TRUE)
			. += span_hypnophrase("The shifting symbols cause you to feel dizzy...")
