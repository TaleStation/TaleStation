/**
 * Attempts to ui_interact the paper to the given user.
 */
/obj/item/paper/proc/show_from_chat(mob/living/user)
	if(!can_show_to_mob_from_chat(user))
		return

	return ui_interact(user)

/**
 * Checks to make sure the user is an observer or admin.
 */
/obj/item/paper/proc/can_show_to_mob_from_chat(mob/living/user)
	if(!user)
		return FALSE

	return (isobserver(user) || is_admin(user.client))

/obj/item/paper/ui_state(mob/user)
	// If this isn't one of the special copies that has been sent to admins, we don't do anything special.
	if(!(src in GLOB.faxes_sent_to_admins))
		return ..()

	// But if it is, we want to let observers and admins have the ability to read it, as it'll be linked to
	// them in chat.
	if(is_admin(user.client))
		return GLOB.admin_state

	if(isobserver(user))
		return GLOB.observer_state
