// -- Job datum definitions --
/datum/job
	/// Bitflags of factions this job itself can be associated with.
	/// Alternative to checking for faction on the mind, since faction isn't very consistent
	var/faction_alignment

	/// This is for the job_spawn_landmark unit test, set FALSE for modular jobs because it runs on all maps
	var/is_unit_testable = TRUE

/datum/id_trim
	/// Icon file for the sechud.
	var/sechud_icon = 'icons/mob/huds/hud.dmi'
