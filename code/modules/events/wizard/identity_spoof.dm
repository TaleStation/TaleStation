/datum/round_event_control/wizard/identity_spoof //now EVERYONE is the wizard!
	name = "Mass Identity Spoof"
	weight = 5
	typepath = /datum/round_event/wizard/identity_spoof
	max_occurrences = 1
	description = "Makes everyone dressed up like a wizard."

/datum/round_event_control/wizard/identity_spoof/canSpawnEvent(players_amt)
	. = ..()
<<<<<<< HEAD
	if(.)
		return FALSE
=======
	if(!.)
		return .

>>>>>>> 1aa85b6f10ce (Makes wizard event not run when it isnt supposed to (#70178))
	if(GLOB.current_anonymous_theme) //already anonymous, ABORT ABORT
		return FALSE

/datum/round_event/wizard/identity_spoof/start()
	if(GLOB.current_anonymous_theme)
		QDEL_NULL(GLOB.current_anonymous_theme)
	GLOB.current_anonymous_theme = new /datum/anonymous_theme/wizards(extras_enabled = TRUE, alert_players = TRUE)
