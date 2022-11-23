
/mob
	/// Last time our client was connected to their mob.
	var/last_connection_time = 0

/mob/Logout()
	. = ..()
	last_connection_time = world.time
