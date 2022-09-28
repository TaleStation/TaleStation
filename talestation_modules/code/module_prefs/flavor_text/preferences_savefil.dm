// Modular savefile stuff for our prefs shit

/datum/preferences/proc/load_talestation_prefs(savefile/S)

	// Headshot saves
	READ_FILE(S["headshot"], headshot)

/datum/preferences/proc/save_talestation_prefs(savefile/S)

	// Headshot saves
	WRITE_FILE(S["headshot"], headshot)
