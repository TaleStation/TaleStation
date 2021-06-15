// -- Defines for player prefs --
/datum/preferences
	/// Character preferences
	var/flavor_text = ""
	var/general_records = ""
	var/security_records = ""
	var/medical_records = ""
	var/exploitable_info = ""
	var/runechat_color = "aaa"
	/// Loadout prefs. Assoc list of slot to typepath.
	var/list/loadout_list
	var/list/greyscale_loadout_list

	/// Client preferences
	var/hear_speech_sounds = TRUE
	var/hear_radio_sounds = TRUE
