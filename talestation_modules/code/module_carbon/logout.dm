
/// Extra defines to put on the /mob level.
/mob
	/// Last time our client was connected to their mob.
	var/last_connection_time = 0

/// Extension of the mob/logout proc.
/mob/Logout()
	. = ..()
	last_connection_time = world.time

// -- Extra mob/ level procs and extensions --
/mob/living/carbon/human/sec_hud_set_ID()
	. = ..()
	var/image/holder = hud_list[ID_HUD]
	var/obj/item/card/id/id = wear_id?.GetID()
	if(!id?.trim)
		holder.icon = 'icons/mob/huds/hud.dmi'
		return

	holder.icon = id.trim.sechud_icon
