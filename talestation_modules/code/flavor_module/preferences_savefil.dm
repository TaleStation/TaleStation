// Modular savefile stuff for our prefs shit

/datum/preferences/proc/load_talestation_prefs(list/save_data)

	// Headshot saves
	headshot = save_data?["headshot"]

/datum/preferences/proc/save_talestation_prefs(list/save_data)

	// Headshot saves
	save_data["headshot"] = headshot
