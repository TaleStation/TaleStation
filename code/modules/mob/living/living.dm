/mob/living/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/movetype_handler)
	register_init_signals()
	if(unique_name)
		set_name()
	var/datum/atom_hud/data/human/medical/advanced/medhud = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	medhud.add_atom_to_hud(src)
	for(var/datum/atom_hud/data/diagnostic/diag_hud in GLOB.huds)
		diag_hud.add_atom_to_hud(src)
	faction += "[REF(src)]"
	GLOB.mob_living_list += src
	SSpoints_of_interest.make_point_of_interest(src)
	update_fov()

/mob/living/prepare_huds()
	..()
	prepare_data_huds()

/mob/living/proc/prepare_data_huds()
	med_hud_set_health()
	med_hud_set_status()

/mob/living/Destroy()
	for(var/datum/status_effect/effect as anything in status_effects)
		// The status effect calls on_remove when its mob is deleted
		if(effect.on_remove_on_mob_delete)
			qdel(effect)

		else
			effect.be_replaced()

	if(buckled)
		buckled.unbuckle_mob(src,force=1)

	remove_from_all_data_huds()
	GLOB.mob_living_list -= src
	if(imaginary_group)
		imaginary_group -= src
		QDEL_LIST(imaginary_group)
	QDEL_LAZYLIST(diseases)
	QDEL_LIST(surgeries)
	return ..()

/mob/living/onZImpact(turf/T, levels, message = TRUE)
	if(!isgroundlessturf(T))
		ZImpactDamage(T, levels)
		message = FALSE
	return ..()

/mob/living/proc/ZImpactDamage(turf/T, levels)
	if(SEND_SIGNAL(src, COMSIG_LIVING_Z_IMPACT, levels, T) & NO_Z_IMPACT_DAMAGE)
		return
	visible_message(span_danger("[src] crashes into [T] with a sickening noise!"), \
					span_userdanger("You crash into [T] with a sickening noise!"))
	adjustBruteLoss((levels * 5) ** 1.5)
	Knockdown(levels * 50)

//Generic Bump(). Override MobBump() and ObjBump() instead of this.
/mob/living/Bump(atom/A)
	if(..()) //we are thrown onto something
		return
	if(buckled || now_pushing)
		return
	if(ismob(A))
		var/mob/M = A
		if(MobBump(M))
			return
	if(isobj(A))
		var/obj/O = A
		if(ObjBump(O))
			return
	if(ismovable(A))
		var/atom/movable/AM = A
		if(PushAM(AM, move_force))
			return

/mob/living/Bumped(atom/movable/AM)
	..()
	last_bumped = world.time

//Called when we bump onto a mob
/mob/living/proc/MobBump(mob/M)
	//No bumping/swapping/pushing others if you are on walk intent
	if(m_intent == MOVE_INTENT_WALK)
		return TRUE

	SEND_SIGNAL(src, COMSIG_LIVING_MOB_BUMP, M)
	//Even if we don't push/swap places, we "touched" them, so spread fire
	spreadFire(M)

	if(now_pushing)
		return TRUE

	var/they_can_move = TRUE
	var/their_combat_mode = FALSE

	if(isliving(M))
		var/mob/living/L = M
		their_combat_mode = L.combat_mode
		they_can_move = L.mobility_flags & MOBILITY_MOVE
		//Also spread diseases
		for(var/thing in diseases)
			var/datum/disease/D = thing
			if(D.spread_flags & DISEASE_SPREAD_CONTACT_SKIN)
				L.ContactContractDisease(D)

		for(var/thing in L.diseases)
			var/datum/disease/D = thing
			if(D.spread_flags & DISEASE_SPREAD_CONTACT_SKIN)
				ContactContractDisease(D)

		//Should stop you pushing a restrained person out of the way
		if(L.pulledby && L.pulledby != src && HAS_TRAIT(L, TRAIT_RESTRAINED))
			if(!(world.time % 5))
				to_chat(src, span_warning("[L] is restrained, you cannot push past."))
			return TRUE

		if(L.pulling)
			if(ismob(L.pulling))
				var/mob/P = L.pulling
				if(HAS_TRAIT(P, TRAIT_RESTRAINED))
					if(!(world.time % 5))
						to_chat(src, span_warning("[L] is restraining [P], you cannot push past."))
					return TRUE

	if(moving_diagonally)//no mob swap during diagonal moves.
		return TRUE

	if(!M.buckled && !M.has_buckled_mobs())
		var/mob_swap = FALSE
		var/too_strong = (M.move_resist > move_force) //can't swap with immovable objects unless they help us
		if(!they_can_move) //we have to physically move them
			if(!too_strong)
				mob_swap = TRUE
		else
			//You can swap with the person you are dragging on grab intent, and restrained people in most cases
			if(M.pulledby == src && !too_strong)
				mob_swap = TRUE
			else if(
				!(HAS_TRAIT(M, TRAIT_NOMOBSWAP) || HAS_TRAIT(src, TRAIT_NOMOBSWAP))&&\
				((HAS_TRAIT(M, TRAIT_RESTRAINED) && !too_strong) || !their_combat_mode) &&\
				(HAS_TRAIT(src, TRAIT_RESTRAINED) || !combat_mode)
			)
				mob_swap = TRUE
		if(mob_swap)
			//switch our position with M
			if(loc && !loc.Adjacent(M.loc))
				return TRUE
			now_pushing = TRUE
			var/oldloc = loc
			var/oldMloc = M.loc


			var/M_passmob = (M.pass_flags & PASSMOB) // we give PASSMOB to both mobs to avoid bumping other mobs during swap.
			var/src_passmob = (pass_flags & PASSMOB)
			M.pass_flags |= PASSMOB
			pass_flags |= PASSMOB

			var/move_failed = FALSE
			if(!M.Move(oldloc) || !Move(oldMloc))
				M.forceMove(oldMloc)
				forceMove(oldloc)
				move_failed = TRUE
			if(!src_passmob)
				pass_flags &= ~PASSMOB
			if(!M_passmob)
				M.pass_flags &= ~PASSMOB

			now_pushing = FALSE

			if(!move_failed)
				return TRUE

	//okay, so we didn't switch. but should we push?
	//not if he's not CANPUSH of course
	if(!(M.status_flags & CANPUSH))
		return TRUE
	if(isliving(M))
		var/mob/living/L = M
		if(HAS_TRAIT(L, TRAIT_PUSHIMMUNE))
			return TRUE
	//If they're a human, and they're not in help intent, block pushing
	if(ishuman(M))
		var/mob/living/carbon/human/human = M
		if(human.combat_mode)
			return TRUE
	//if they are a cyborg, and they're alive and in combat mode, block pushing
	if(iscyborg(M))
		var/mob/living/silicon/robot/borg = M
		if(borg.combat_mode && borg.stat != DEAD)
			return TRUE
	//anti-riot equipment is also anti-push
	for(var/obj/item/I in M.held_items)
		if(!isclothing(M))
			if(prob(I.block_chance*2))
				return

/mob/living/get_photo_description(obj/item/camera/camera)
	var/list/mob_details = list()
	var/list/holding = list()
	var/len = length(held_items)
	if(len)
		for(var/obj/item/I in held_items)
			if(!holding.len)
				holding += "[p_they(TRUE)] [p_are()] holding \a [I]"
			else if(held_items.Find(I) == len)
				holding += ", and \a [I]."
			else
				holding += ", \a [I]"
	holding += "."
	mob_details += "You can also see [src] on the photo[health < (maxHealth * 0.75) ? ", looking a bit hurt":""][holding ? ". [holding.Join("")]":"."]."
	return mob_details.Join("")

//Called when we bump onto an obj
/mob/living/proc/ObjBump(obj/O)
	return

//Called when we want to push an atom/movable
/mob/living/proc/PushAM(atom/movable/AM, force = move_force)
	if(now_pushing)
		return TRUE
	if(moving_diagonally)// no pushing during diagonal moves.
		return TRUE
	if(!client && (mob_size < MOB_SIZE_SMALL))
		return
	now_pushing = TRUE
	SEND_SIGNAL(src, COMSIG_LIVING_PUSHING_MOVABLE, AM)
	var/dir_to_target = get_dir(src, AM)

	// If there's no dir_to_target then the player is on the same turf as the atom they're trying to push.
	// This can happen when a player is stood on the same turf as a directional window. All attempts to push
	// the window will fail as get_dir will return 0 and the player will be unable to move the window when
	// it should be pushable.
	// In this scenario, we will use the facing direction of the /mob/living attempting to push the atom as
	// a fallback.
	if(!dir_to_target)
		dir_to_target = dir

	var/push_anchored = FALSE
	if((AM.move_resist * MOVE_FORCE_CRUSH_RATIO) <= force)
		if(move_crush(AM, move_force, dir_to_target))
			push_anchored = TRUE
	if((AM.move_resist * MOVE_FORCE_FORCEPUSH_RATIO) <= force) //trigger move_crush and/or force_push regardless of if we can push it normally
		if(force_push(AM, move_force, dir_to_target, push_anchored))
			push_anchored = TRUE
	if(ismob(AM))
		var/mob/mob_to_push = AM
		var/atom/movable/mob_buckle = mob_to_push.buckled
		// If we can't pull them because of what they're buckled to, make sure we can push the thing they're buckled to instead.
		// If neither are true, we're not pushing anymore.
		if(mob_buckle && (mob_buckle.buckle_prevents_pull || (force < (mob_buckle.move_resist * MOVE_FORCE_PUSH_RATIO))))
			now_pushing = FALSE
			return
	if((AM.anchored && !push_anchored) || (force < (AM.move_resist * MOVE_FORCE_PUSH_RATIO)))
		now_pushing = FALSE
		return
	if(istype(AM, /obj/structure/window))
		var/obj/structure/window/W = AM
		if(W.fulltile)
			for(var/obj/structure/window/win in get_step(W, dir_to_target))
				now_pushing = FALSE
				return
	if(pulling == AM)
		stop_pulling()
	var/current_dir
	if(isliving(AM))
		current_dir = AM.dir
	if(AM.Move(get_step(AM.loc, dir_to_target), dir_to_target, glide_size))
		AM.add_fingerprint(src)
		Move(get_step(loc, dir_to_target), dir_to_target)
	if(current_dir)
		AM.setDir(current_dir)
	now_pushing = FALSE

/mob/living/start_pulling(atom/movable/AM, state, force = pull_force, supress_message = FALSE)
	if(!AM || !src)
		return FALSE
	if(!(AM.can_be_pulled(src, state, force)))
		return FALSE
	if(throwing || !(mobility_flags & MOBILITY_PULL))
		return FALSE
	if(SEND_SIGNAL(src, COMSIG_LIVING_TRY_PULL, AM, force) & COMSIG_LIVING_CANCEL_PULL)
		return FALSE
	if(SEND_SIGNAL(AM, COMSIG_LIVING_TRYING_TO_PULL, src, force) & COMSIG_LIVING_CANCEL_PULL)
		return FALSE

	AM.add_fingerprint(src)

	// If we're pulling something then drop what we're currently pulling and pull this instead.
	if(pulling)
		// Are we trying to pull something we are already pulling? Then just stop here, no need to continue.
		if(AM == pulling)
			return
		stop_pulling()

	changeNext_move(CLICK_CD_GRABBING)

	if(AM.pulledby)
		if(!supress_message)
			AM.visible_message(span_danger("[src] pulls [AM] from [AM.pulledby]'s grip."), \
							span_danger("[src] pulls you from [AM.pulledby]'s grip."), null, null, src)
			to_chat(src, span_notice("You pull [AM] from [AM.pulledby]'s grip!"))
		log_combat(AM, AM.pulledby, "pulled from", src)
		AM.pulledby.stop_pulling() //an object can't be pulled by two mobs at once.

	pulling = AM
	AM.set_pulledby(src)

	SEND_SIGNAL(src, COMSIG_LIVING_START_PULL, AM, state, force)

	if(!supress_message)
		var/sound_to_play = 'sound/weapons/thudswoosh.ogg'
		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			if(H.dna.species.grab_sound)
				sound_to_play = H.dna.species.grab_sound
			if(HAS_TRAIT(H, TRAIT_STRONG_GRABBER))
				sound_to_play = null
		playsound(src.loc, sound_to_play, 50, TRUE, -1)
	update_pull_hud_icon()

	if(ismob(AM))
		var/mob/M = AM

		log_combat(src, M, "grabbed", addition="passive grab")
		if(!supress_message && !(iscarbon(AM) && HAS_TRAIT(src, TRAIT_STRONG_GRABBER)))
			if(ishuman(M))
				var/mob/living/carbon/human/grabbed_human = M
				var/grabbed_by_hands = (zone_selected == "l_arm" || zone_selected == "r_arm") && grabbed_human.usable_hands > 0
				M.visible_message(span_warning("[src] grabs [M] [grabbed_by_hands ? "by their hands":"passively"]!"), \
								span_warning("[src] grabs you [grabbed_by_hands ? "by your hands":"passively"]!"), null, null, src)
				to_chat(src, span_notice("You grab [M] [grabbed_by_hands ? "by their hands":"passively"]!"))
			else
				M.visible_message(span_warning("[src] grabs [M] passively!"), \
								span_warning("[src] grabs you passively!"), null, null, src)
				to_chat(src, span_notice("You grab [M] passively!"))

		if(!iscarbon(src))
			M.LAssailant = null
		else
			M.LAssailant = WEAKREF(usr)
		if(isliving(M))
			var/mob/living/L = M

			SEND_SIGNAL(M, COMSIG_LIVING_GET_PULLED, src)
			//Share diseases that are spread by touch
			for(var/thing in diseases)
				var/datum/disease/D = thing
				if(D.spread_flags & DISEASE_SPREAD_CONTACT_SKIN)
					L.ContactContractDisease(D)

			for(var/thing in L.diseases)
				var/datum/disease/D = thing
				if(D.spread_flags & DISEASE_SPREAD_CONTACT_SKIN)
					ContactContractDisease(D)

			if(iscarbon(L))
				var/mob/living/carbon/C = L
				if(HAS_TRAIT(src, TRAIT_STRONG_GRABBER))
					C.grippedby(src)

			update_pull_movespeed()

		set_pull_offsets(M, state)

/mob/living/proc/set_pull_offsets(mob/living/M, grab_state = GRAB_PASSIVE)
	if(M.buckled)
		return //don't make them change direction or offset them if they're buckled into something.
	var/offset = 0
	switch(grab_state)
		if(GRAB_PASSIVE)
			offset = GRAB_PIXEL_SHIFT_PASSIVE
		if(GRAB_AGGRESSIVE)
			offset = GRAB_PIXEL_SHIFT_AGGRESSIVE
		if(GRAB_NECK)
			offset = GRAB_PIXEL_SHIFT_NECK
		if(GRAB_KILL)
			offset = GRAB_PIXEL_SHIFT_NECK
	M.setDir(get_dir(M, src))
	switch(M.dir)
		if(NORTH)
			animate(M, pixel_x = M.base_pixel_x, pixel_y = M.base_pixel_y + offset, 3)
		if(SOUTH)
			animate(M, pixel_x = M.base_pixel_x, pixel_y = M.base_pixel_y - offset, 3)
		if(EAST)
			if(M.lying_angle == 270) //update the dragged dude's direction if we've turned
				M.set_lying_angle(90)
			animate(M, pixel_x = M.base_pixel_x + offset, pixel_y = M.base_pixel_y, 3)
		if(WEST)
			if(M.lying_angle == 90)
				M.set_lying_angle(270)
			animate(M, pixel_x = M.base_pixel_x - offset, pixel_y = M.base_pixel_y, 3)

/mob/living/proc/reset_pull_offsets(mob/living/M, override)
	if(!override && M.buckled)
		return
	animate(M, pixel_x = M.base_pixel_x, pixel_y = M.base_pixel_y, 1)

//mob verbs are a lot faster than object verbs
//for more info on why this is not atom/pull, see examinate() in mob.dm
/mob/living/verb/pulled(atom/movable/AM as mob|obj in oview(1))
	set name = "Pull"
	set category = "Object"

	if(istype(AM) && Adjacent(AM))
		start_pulling(AM)
	else if(!combat_mode) //Don;'t cancel pulls if misclicking in combat mode.
		stop_pulling()

/mob/living/stop_pulling()
	if(ismob(pulling))
		reset_pull_offsets(pulling)
	..()
	update_pull_movespeed()
	update_pull_hud_icon()

/mob/living/verb/stop_pulling1()
	set name = "Stop Pulling"
	set category = "IC"
	stop_pulling()

//same as above
/mob/living/pointed(atom/A as mob|obj|turf in view(client.view, src))
	if(incapacitated())
		return FALSE

	return ..()

/mob/living/_pointed(atom/pointing_at)
	if(!..())
		return FALSE
	log_message("points at [pointing_at]", LOG_EMOTE)
	visible_message("<span class='infoplain'>[span_name("[src]")] points at [pointing_at].</span>", span_notice("You point at [pointing_at]."))

/mob/living/verb/succumb(whispered as null)
	set hidden = TRUE
	if (!CAN_SUCCUMB(src))
		if(HAS_TRAIT(src, TRAIT_SUCCUMB_OVERRIDE))
			if(whispered)
				to_chat(src, text="You are unable to succumb to death! Unless you just press the UI button.", type=MESSAGE_TYPE_INFO)
				return
		else
			to_chat(src, text="You are unable to succumb to death! This life continues.", type=MESSAGE_TYPE_INFO)
			return
	log_message("Has [whispered ? "whispered his final words" : "succumbed to death"] with [round(health, 0.1)] points of health!", LOG_ATTACK)
	adjustOxyLoss(health - HEALTH_THRESHOLD_DEAD)
	updatehealth()
	if(!whispered)
		to_chat(src, span_notice("You have given up life and succumbed to death."))
	investigate_log("has succumbed to death.", INVESTIGATE_DEATHS)
	death()

/**
 * Checks if a mob is incapacitated
 *
 * Normally being restrained, agressively grabbed, or in stasis counts as incapacitated
 * unless there is a flag being used to check if it's ignored
 *
 * args:
 * * flags (optional) bitflags that determine if special situations are exempt from being considered incapacitated
 *
 * bitflags: (see code/__DEFINES/status_effects.dm)
 * * IGNORE_RESTRAINTS - mob in a restraint (handcuffs) is not considered incapacitated
 * * IGNORE_STASIS - mob in stasis (stasis bed, etc.) is not considered incapacitated
 * * IGNORE_GRAB - mob that is agressively grabbed is not considered incapacitated
**/
/mob/living/incapacitated(flags)
	if(HAS_TRAIT(src, TRAIT_INCAPACITATED))
		return TRUE

	if(!(flags & IGNORE_RESTRAINTS) && HAS_TRAIT(src, TRAIT_RESTRAINED))
		return TRUE
	if(!(flags & IGNORE_GRAB) && pulledby && pulledby.grab_state >= GRAB_AGGRESSIVE)
		return TRUE
	if(!(flags & IGNORE_STASIS) && IS_IN_STASIS(src))
		return TRUE
	return FALSE

/mob/living/canUseStorage()
	if (usable_hands <= 0)
		return FALSE
	return TRUE


//This proc is used for mobs which are affected by pressure to calculate the amount of pressure that actually
//affects them once clothing is factored in. ~Errorage
/mob/living/proc/calculate_affecting_pressure(pressure)
	return pressure

/mob/living/proc/getMaxHealth()
	return maxHealth

/mob/living/proc/setMaxHealth(newMaxHealth)
	maxHealth = newMaxHealth

/// Returns the health of the mob while ignoring damage of non-organic (prosthetic) limbs
/// Used by cryo cells to not permanently imprison those with damage from prosthetics,
/// as they cannot be healed through chemicals.
/mob/living/proc/get_organic_health()
	return health

// MOB PROCS //END

/mob/living/proc/mob_sleep()
	set name = "Sleep"
	set category = "IC"

	if(IsSleeping())
		to_chat(src, span_warning("You are already sleeping!"))
		return
	else
		if(tgui_alert(usr, "You sure you want to sleep for a while?", "Sleep", list("Yes", "No")) == "Yes")
			SetSleeping(400) //Short nap


/mob/proc/get_contents()


/**
 * Gets ID card from a mob.
 * Argument:
 * * hand_firsts - boolean that checks the hands of the mob first if TRUE.
 */
/mob/living/proc/get_idcard(hand_first)
	if(!length(held_items)) //Early return for mobs without hands.
		return
	//Check hands
	var/obj/item/held_item = get_active_held_item()
	if(held_item) //Check active hand
		. = held_item.GetID()
	if(!.) //If there is no id, check the other hand
		held_item = get_inactive_held_item()
		if(held_item)
			. = held_item.GetID()

/mob/living/proc/get_id_in_hand()
	var/obj/item/held_item = get_active_held_item()
	if(!held_item)
		return
	return held_item.GetID()

//Returns the bank account of an ID the user may be holding.
/mob/living/proc/get_bank_account()
	RETURN_TYPE(/datum/bank_account)
	var/datum/bank_account/account
	var/obj/item/card/id/I = get_idcard()

	if(I?.registered_account)
		account = I.registered_account
		return account

/mob/living/proc/toggle_resting()
	set name = "Rest"
	set category = "IC"

	set_resting(!resting, FALSE)


///Proc to hook behavior to the change of value in the resting variable.
/mob/living/proc/set_resting(new_resting, silent = TRUE, instant = FALSE)
	if(!(mobility_flags & MOBILITY_REST))
		return
	if(new_resting == resting)
		return
	. = resting
	resting = new_resting
	if(new_resting)
		if(body_position == LYING_DOWN)
			if(!silent)
				to_chat(src, span_notice("You will now try to stay lying down on the floor."))
		else if(HAS_TRAIT(src, TRAIT_FORCED_STANDING) || (buckled && buckled.buckle_lying != NO_BUCKLE_LYING))
			if(!silent)
				to_chat(src, span_notice("You will now lay down as soon as you are able to."))
		else
			if(!silent)
				to_chat(src, span_notice("You lay down."))
			set_lying_down()
	else
		if(body_position == STANDING_UP)
			if(!silent)
				to_chat(src, span_notice("You will now try to remain standing up."))
		else if(HAS_TRAIT(src, TRAIT_FLOORED) || (buckled && buckled.buckle_lying != NO_BUCKLE_LYING))
			if(!silent)
				to_chat(src, span_notice("You will now stand up as soon as you are able to."))
		else
			if(!silent)
				to_chat(src, span_notice("You stand up."))
			get_up(instant)

	update_resting()


/// Proc to append and redefine behavior to the change of the [/mob/living/var/resting] variable.
/mob/living/proc/update_resting()
	update_rest_hud_icon()


/mob/living/proc/get_up(instant = FALSE)
	set waitfor = FALSE
	if(!instant && !do_mob(src, src, 1 SECONDS, timed_action_flags = (IGNORE_USER_LOC_CHANGE|IGNORE_TARGET_LOC_CHANGE|IGNORE_HELD_ITEM), extra_checks = CALLBACK(src, /mob/living/proc/rest_checks_callback), interaction_key = DOAFTER_SOURCE_GETTING_UP))
		return
	if(resting || body_position == STANDING_UP || HAS_TRAIT(src, TRAIT_FLOORED))
		return
	set_lying_angle(0)
	set_body_position(STANDING_UP)


/mob/living/proc/rest_checks_callback()
	if(resting || body_position == STANDING_UP || HAS_TRAIT(src, TRAIT_FLOORED))
		return FALSE
	return TRUE


/// Change the [body_position] to [LYING_DOWN] and update associated behavior.
/mob/living/proc/set_lying_down(new_lying_angle)
	set_body_position(LYING_DOWN)

/// Proc to append behavior related to lying down.
/mob/living/proc/on_lying_down(new_lying_angle)
	if(layer == initial(layer)) //to avoid things like hiding larvas.
		layer = LYING_MOB_LAYER //so mob lying always appear behind standing mobs
	ADD_TRAIT(src, TRAIT_UI_BLOCKED, LYING_DOWN_TRAIT)
	ADD_TRAIT(src, TRAIT_PULL_BLOCKED, LYING_DOWN_TRAIT)
	set_density(FALSE) // We lose density and stop bumping passable dense things.
	if(HAS_TRAIT(src, TRAIT_FLOORED) && !(dir & (NORTH|SOUTH)))
		setDir(pick(NORTH, SOUTH)) // We are and look helpless.
	body_position_pixel_y_offset = PIXEL_Y_OFFSET_LYING


/// Proc to append behavior related to lying down.
/mob/living/proc/on_standing_up()
	if(layer == LYING_MOB_LAYER)
		layer = initial(layer)
	set_density(initial(density)) // We were prone before, so we become dense and things can bump into us again.
	REMOVE_TRAIT(src, TRAIT_UI_BLOCKED, LYING_DOWN_TRAIT)
	REMOVE_TRAIT(src, TRAIT_PULL_BLOCKED, LYING_DOWN_TRAIT)
	body_position_pixel_y_offset = 0



//Recursive function to find everything a mob is holding. Really shitty proc tbh.
/mob/living/get_contents()
	var/list/ret = list()
	ret |= contents //add our contents
	for(var/atom/iter_atom as anything in ret.Copy()) //iterate storage objects
		iter_atom.atom_storage?.return_inv(ret)
	for(var/obj/item/folder/F in ret.Copy()) //very snowflakey-ly iterate folders
		ret |= F.contents
	return ret

/**
 * Returns whether or not the mob can be injected. Should not perform any side effects.
 *
 * Arguments:
 * * user - The user trying to inject the mob.
 * * target_zone - The zone being targeted.
 * * injection_flags - A bitflag for extra properties to check.
 *   Check __DEFINES/injection.dm for more details, specifically the ones prefixed INJECT_CHECK_*.
 */
/mob/living/proc/can_inject(mob/user, target_zone, injection_flags)
	return TRUE

/**
 * Like can_inject, but it can perform side effects.
 *
 * Arguments:
 * * user - The user trying to inject the mob.
 * * target_zone - The zone being targeted.
 * * injection_flags - A bitflag for extra properties to check. Check __DEFINES/injection.dm for more details.
 *   Check __DEFINES/injection.dm for more details. Unlike can_inject, the INJECT_TRY_* defines will behave differently.
 */
/mob/living/proc/try_inject(mob/user, target_zone, injection_flags)
	return can_inject(user, target_zone, injection_flags)

/mob/living/is_injectable(mob/user, allowmobs = TRUE)
	return (allowmobs && reagents && can_inject(user))

/mob/living/is_drawable(mob/user, allowmobs = TRUE)
	return (allowmobs && reagents && can_inject(user))


///Sets the current mob's health value. Do not call directly if you don't know what you are doing, use the damage procs, instead.
/mob/living/proc/set_health(new_value)
	. = health
	health = new_value


/mob/living/proc/updatehealth()
	if(status_flags & GODMODE)
		return
	set_health(maxHealth - getOxyLoss() - getToxLoss() - getFireLoss() - getBruteLoss() - getCloneLoss())
	staminaloss = getStaminaLoss()
	update_stat()
	med_hud_set_health()
	med_hud_set_status()
	update_health_hud()

/mob/living/update_health_hud()
	var/severity = 0
	var/healthpercent = (health/maxHealth) * 100
	if(hud_used?.healthdoll) //to really put you in the boots of a simplemob
		var/atom/movable/screen/healthdoll/living/livingdoll = hud_used.healthdoll
		switch(healthpercent)
			if(100 to INFINITY)
				severity = 0
			if(80 to 100)
				severity = 1
			if(60 to 80)
				severity = 2
			if(40 to 60)
				severity = 3
			if(20 to 40)
				severity = 4
			if(1 to 20)
				severity = 5
			else
				severity = 6
		livingdoll.icon_state = "living[severity]"
		if(!livingdoll.filtered)
			livingdoll.filtered = TRUE
			var/icon/mob_mask = icon(icon, icon_state)
			if(mob_mask.Height() > world.icon_size || mob_mask.Width() > world.icon_size)
				var/health_doll_icon_state = health_doll_icon ? health_doll_icon : "megasprite"
				mob_mask = icon('icons/hud/screen_gen.dmi', health_doll_icon_state) //swap to something generic if they have no special doll
			livingdoll.add_filter("mob_shape_mask", 1, alpha_mask_filter(icon = mob_mask))
			livingdoll.add_filter("inset_drop_shadow", 2, drop_shadow_filter(size = -1))
	if(severity > 0)
		overlay_fullscreen("brute", /atom/movable/screen/fullscreen/brute, severity)
	else
		clear_fullscreen("brute")

/**
 * Proc used to resuscitate a mob, bringing them back to life.
 *
 * Note that, even if a mob cannot be revived, the healing from this proc will still be applied.
 *
 * Arguments
 * * full_heal_flags - Optional. If supplied, [/mob/living/fully_heal] will be called with these flags before revival.
 * * excess_healing - Optional. If supplied, this number will be used to apply a bit of healing to the mob. Currently, 1 "excess healing" translates to -1 oxyloss, -1 toxloss, +2 blood, -5 to all organ damage.
 * * force_grab_ghost - We grab the ghost of the mob on revive. If TRUE, we force grab the ghost (includes suiciders). If FALSE, we do not. See [/mob/grab_ghost].
 *
 */
/mob/living/proc/revive(full_heal_flags = NONE, excess_healing = 0, force_grab_ghost = FALSE)
	if(excess_healing)
		adjustOxyLoss(-excess_healing, FALSE)
		adjustToxLoss(-excess_healing, FALSE, TRUE) //slime friendly
		updatehealth()

	grab_ghost(force_grab_ghost)
	if(full_heal_flags)
		fully_heal(full_heal_flags)

	if(stat == DEAD && can_be_revived()) //in some cases you can't revive (e.g. no brain)
		set_suicide(FALSE)
		set_stat(UNCONSCIOUS) //the mob starts unconscious,
		updatehealth() //then we check if the mob should wake up.
		if(full_heal_flags & HEAL_ADMIN)
			get_up(TRUE)
		update_sight()
		clear_alert(ALERT_NOT_ENOUGH_OXYGEN)
		reload_fullscreen()
		. = TRUE
		if(excess_healing)
			INVOKE_ASYNC(src, PROC_REF(emote), "gasp")
			log_combat(src, src, "revived")

	else if(full_heal_flags & HEAL_ADMIN)
		updatehealth()
		get_up(TRUE)

	// The signal is called after everything else so components can properly check the updated values
	SEND_SIGNAL(src, COMSIG_LIVING_REVIVE, full_heal_flags)

/**
 * Heals up the mob up to [heal_to] of the main damage types.
 * EX: If heal_to is 50, and they have 150 brute damage, they will heal 100 brute (up to 50 brute damage)
 *
 * If the target is dead, also revives them and heals their organs / restores blood.
 * If we have a [revive_message], play a visible message if the revive was successful.
 *
 * Arguments
 * * heal_to - the health threshold to heal the mob up to for each of the main damage types.
 * * revive_message - if provided, a visible message to show on a successful revive.
 *
 * Returns TRUE if the mob is alive afterwards, or FALSE if they're still dead (revive failed).
 */
/mob/living/proc/heal_and_revive(heal_to = 50, revive_message)

	// Heal their brute and burn up to the threshold we're looking for
	var/brute_to_heal = heal_to - getBruteLoss()
	var/burn_to_heal = heal_to - getFireLoss()
	var/oxy_to_heal = heal_to - getOxyLoss()
	var/tox_to_heal = heal_to - getToxLoss()
	if(brute_to_heal < 0)
		adjustBruteLoss(brute_to_heal, FALSE)
	if(burn_to_heal < 0)
		adjustFireLoss(burn_to_heal, FALSE)
	if(oxy_to_heal < 0)
		adjustOxyLoss(oxy_to_heal, FALSE)
	if(tox_to_heal < 0)
		adjustToxLoss(tox_to_heal, FALSE, TRUE)

	// Run updatehealth once to set health for the revival check
	updatehealth()

	// We've given them a decent heal.
	// If they happen to be dead too, try to revive them - if possible.
	if(stat == DEAD && can_be_revived())
		// If the revive is successful, show our revival message (if present).
		if(revive(FALSE, FALSE, 10) && revive_message)
			visible_message(revive_message)

	// Finally update health again after we're all done
	updatehealth()

	return stat != DEAD

/**
 * A grand proc used whenever this mob is, quote, "fully healed".
 * Fully healed could mean a number of things, such as "healing all the main damage types", "healing all the organs", etc
 * So, you can pass flags to specify
 *
 * See [mobs.dm] for more information on the flags
 *
 * If you ever think "hey I'm adding something and want it to be reverted on full heal",
 * consider handling it via signal instead of implementing it in this proc
 */
/mob/living/proc/fully_heal(heal_flags = HEAL_ALL)
	SHOULD_CALL_PARENT(TRUE)

	if(heal_flags & HEAL_TOX)
		setToxLoss(0, FALSE, TRUE)
	if(heal_flags & HEAL_OXY)
		setOxyLoss(0, FALSE, TRUE)
	if(heal_flags & HEAL_CLONE)
		setCloneLoss(0, FALSE, TRUE)
	if(heal_flags & HEAL_BRUTE)
		setBruteLoss(0, FALSE, TRUE)
	if(heal_flags & HEAL_BURN)
		setFireLoss(0, FALSE, TRUE)
	if(heal_flags & HEAL_STAM)
		setStaminaLoss(0, FALSE, TRUE)

	// I don't really care to keep this under a flag
	set_nutrition(NUTRITION_LEVEL_FED + 50)

	// These should be tracked by status effects
	losebreath = 0
	set_blindness(0)
	set_blurriness(0)
	set_drowsyness(0)
	set_disgust(0)
	cure_nearsighted()
	cure_blind()
	cure_husk()

	if(heal_flags & HEAL_TEMP)
		bodytemperature = get_body_temp_normal(apply_change = FALSE)
	if(heal_flags & HEAL_BLOOD)
		restore_blood()
	if(reagents && (heal_flags & HEAL_ALL_REAGENTS))
		reagents.clear_reagents()

	if(heal_flags & HEAL_ADMIN)
		suiciding = FALSE

	updatehealth()
	stop_sound_channel(CHANNEL_HEARTBEAT)
	SEND_SIGNAL(src, COMSIG_LIVING_POST_FULLY_HEAL, heal_flags)

/// Checks if we are actually able to ressuscitate this mob.
/// (We don't want to revive then to have them instantly die again)
/mob/living/proc/can_be_revived()
	if(health <= HEALTH_THRESHOLD_DEAD)
		return FALSE
	return TRUE

/mob/living/proc/update_damage_overlays()
	return

/// Proc that only really gets called for humans, to handle bleeding overlays.
/mob/living/proc/update_wound_overlays()
	return

/mob/living/Move(atom/newloc, direct, glide_size_override)
	if(lying_angle != 0)
		lying_angle_on_movement(direct)
	if (buckled && buckled.loc != newloc) //not updating position
		if (!buckled.anchored)
			buckled.moving_from_pull = moving_from_pull
			. = buckled.Move(newloc, direct, glide_size)
			buckled.moving_from_pull = null
		return

	var/old_direction = dir
	var/turf/T = loc

	if(pulling)
		update_pull_movespeed()

	. = ..()

	if(moving_diagonally != FIRST_DIAG_STEP && isliving(pulledby))
		var/mob/living/L = pulledby
		L.set_pull_offsets(src, pulledby.grab_state)

	if(active_storage && !((active_storage.parent?.resolve() in important_recursive_contents?[RECURSIVE_CONTENTS_ACTIVE_STORAGE]) || CanReach(active_storage.parent?.resolve(),view_only = TRUE)))
		active_storage.hide_contents(src)

	if(body_position == LYING_DOWN && !buckled && prob(getBruteLoss()*200/maxHealth))
		makeTrail(newloc, T, old_direction)


///Called by mob Move() when the lying_angle is different than zero, to better visually simulate crawling.
/mob/living/proc/lying_angle_on_movement(direct)
	if(direct & EAST)
		set_lying_angle(90)
	else if(direct & WEST)
		set_lying_angle(270)

/mob/living/carbon/alien/adult/lying_angle_on_movement(direct)
	return

/mob/living/proc/makeTrail(turf/target_turf, turf/start, direction)
	if(!has_gravity() || !isturf(start) || !blood_volume)
		return

	var/blood_exists = locate(/obj/effect/decal/cleanable/trail_holder) in start

	var/trail_type = getTrail()
	if(!trail_type)
		return

	var/brute_ratio = round(getBruteLoss() / maxHealth, 0.1)
	if(blood_volume < max(BLOOD_VOLUME_NORMAL*(1 - brute_ratio * 0.25), 0))//don't leave trail if blood volume below a threshold
		return

	var/bleed_amount = bleedDragAmount()
	blood_volume = max(blood_volume - bleed_amount, 0) //that depends on our brute damage.
	var/newdir = get_dir(target_turf, start)
	if(newdir != direction)
		newdir = newdir | direction
		if(newdir == (NORTH|SOUTH))
			newdir = NORTH
		else if(newdir == (EAST|WEST))
			newdir = EAST
	if((newdir in GLOB.cardinals) && (prob(50)))
		newdir = turn(get_dir(target_turf, start), 180)
	if(!blood_exists)
		new /obj/effect/decal/cleanable/trail_holder(start, get_static_viruses())

	for(var/obj/effect/decal/cleanable/trail_holder/TH in start)
		if((!(newdir in TH.existing_dirs) || trail_type == "trails_1" || trail_type == "trails_2") && TH.existing_dirs.len <= 16) //maximum amount of overlays is 16 (all light & heavy directions filled)
			TH.existing_dirs += newdir
			TH.add_overlay(image('icons/effects/blood.dmi', trail_type, dir = newdir))
			TH.transfer_mob_blood_dna(src)

/mob/living/carbon/human/makeTrail(turf/T)
	if((NOBLOOD in dna.species.species_traits) || !is_bleeding() || HAS_TRAIT(src, TRAIT_NOBLEED))
		return
	..()

///Returns how much blood we're losing from being dragged a tile, from [/mob/living/proc/makeTrail]
/mob/living/proc/bleedDragAmount()
	var/brute_ratio = round(getBruteLoss() / maxHealth, 0.1)
	return max(1, brute_ratio * 2)

/mob/living/carbon/bleedDragAmount()
	var/bleed_amount = 0
	for(var/i in all_wounds)
		var/datum/wound/iter_wound = i
		bleed_amount += iter_wound.drag_bleed_amount()
	return bleed_amount

/mob/living/proc/getTrail()
	if(getBruteLoss() < 300)
		return pick("ltrails_1", "ltrails_2")
	else
		return pick("trails_1", "trails_2")

/mob/living/experience_pressure_difference(pressure_difference, direction, pressure_resistance_prob_delta = 0)
	playsound(src, 'sound/effects/space_wind.ogg', 50, TRUE)
	if(buckled || mob_negates_gravity())
		return

	if(client && client.move_delay >= world.time + world.tick_lag*2)
		pressure_resistance_prob_delta -= 30

	var/list/turfs_to_check = list()

	if(!has_limbs)
		var/turf/T = get_step(src, angle2dir(dir2angle(direction)+90))
		if (T)
			turfs_to_check += T

		T = get_step(src, angle2dir(dir2angle(direction)-90))
		if(T)
			turfs_to_check += T

		for(var/t in turfs_to_check)
			T = t
			if(T.density)
				pressure_resistance_prob_delta -= 20
				continue
			for (var/atom/movable/AM in T)
				if (AM.density && AM.anchored)
					pressure_resistance_prob_delta -= 20
					break
	..(pressure_difference, direction, pressure_resistance_prob_delta)

/mob/living/can_resist()
	if(next_move > world.time)
		return FALSE
	if(HAS_TRAIT(src, TRAIT_INCAPACITATED))
		return FALSE
	return TRUE

/mob/living/verb/resist()
	set name = "Resist"
	set category = "IC"

	DEFAULT_QUEUE_OR_CALL_VERB(VERB_CALLBACK(src, PROC_REF(execute_resist)))

///proc extender of [/mob/living/verb/resist] meant to make the process queable if the server is overloaded when the verb is called
/mob/living/proc/execute_resist()
	if(!can_resist())
		return
	changeNext_move(CLICK_CD_RESIST)

	SEND_SIGNAL(src, COMSIG_LIVING_RESIST, src)
	//resisting grabs (as if it helps anyone...)
	if(!HAS_TRAIT(src, TRAIT_RESTRAINED) && pulledby)
		log_combat(src, pulledby, "resisted grab")
		resist_grab()
		return

	//unbuckling yourself
	if(buckled && last_special <= world.time)
		resist_buckle()

	//Breaking out of a container (Locker, sleeper, cryo...)
	else if(loc != get_turf(src))
		loc.container_resist_act(src)

	else if(mobility_flags & MOBILITY_MOVE)
		if(on_fire)
			resist_fire() //stop, drop, and roll
		else if(last_special <= world.time)
			resist_restraints() //trying to remove cuffs.

/mob/proc/resist_grab(moving_resist)
	return 1 //returning 0 means we successfully broke free

/mob/living/resist_grab(moving_resist)
	. = TRUE
	if(pulledby.grab_state || body_position == LYING_DOWN || HAS_TRAIT(src, TRAIT_GRABWEAKNESS))
		var/altered_grab_state = pulledby.grab_state
		if((body_position == LYING_DOWN || HAS_TRAIT(src, TRAIT_GRABWEAKNESS)) && pulledby.grab_state < GRAB_KILL) //If prone, resisting out of a grab is equivalent to 1 grab state higher. won't make the grab state exceed the normal max, however
			altered_grab_state++
		var/resist_chance = BASE_GRAB_RESIST_CHANCE /// see defines/combat.dm, this should be baseline 60%
		resist_chance = (resist_chance/altered_grab_state) ///Resist chance divided by the value imparted by your grab state. It isn't until you reach neckgrab that you gain a penalty to escaping a grab.
		if(prob(resist_chance))
			visible_message(span_danger("[src] breaks free of [pulledby]'s grip!"), \
							span_danger("You break free of [pulledby]'s grip!"), null, null, pulledby)
			to_chat(pulledby, span_warning("[src] breaks free of your grip!"))
			log_combat(pulledby, src, "broke grab")
			pulledby.stop_pulling()
			return FALSE
		else
			adjustStaminaLoss(rand(15,20))//failure to escape still imparts a pretty serious penalty
			visible_message(span_danger("[src] struggles as they fail to break free of [pulledby]'s grip!"), \
							span_warning("You struggle as you fail to break free of [pulledby]'s grip!"), null, null, pulledby)
			to_chat(pulledby, span_danger("[src] struggles as they fail to break free of your grip!"))
		if(moving_resist && client) //we resisted by trying to move
			client.move_delay = world.time + 4 SECONDS
	else
		pulledby.stop_pulling()
		return FALSE

/mob/living/proc/resist_buckle()
	buckled.user_unbuckle_mob(src,src)

/mob/living/proc/resist_fire()
	return

/mob/living/proc/resist_restraints()
	return

/mob/living/proc/get_visible_name()
	return name

/mob/living/update_gravity(gravity)
	. = ..()
	if(!SSticker.HasRoundStarted())
		return
	var/atom/movable/screen/alert/gravity_alert = alerts[ALERT_GRAVITY]
	switch(gravity)
		if(-INFINITY to NEGATIVE_GRAVITY)
			if(!istype(gravity_alert, /atom/movable/screen/alert/negative))
				throw_alert(ALERT_GRAVITY, /atom/movable/screen/alert/negative)
				var/matrix/flipped_matrix = transform
				flipped_matrix.b = -flipped_matrix.b
				flipped_matrix.e = -flipped_matrix.e
				animate(src, transform = flipped_matrix, pixel_y = pixel_y+4, time = 0.5 SECONDS, easing = EASE_OUT)
				base_pixel_y += 4
		if(NEGATIVE_GRAVITY + 0.01 to 0)
			if(!istype(gravity_alert, /atom/movable/screen/alert/weightless))
				throw_alert(ALERT_GRAVITY, /atom/movable/screen/alert/weightless)
				ADD_TRAIT(src, TRAIT_MOVE_FLOATING, NO_GRAVITY_TRAIT)
		if(0.01 to STANDARD_GRAVITY)
			if(gravity_alert)
				clear_alert(ALERT_GRAVITY)
		if(STANDARD_GRAVITY + 0.01 to GRAVITY_DAMAGE_THRESHOLD - 0.01)
			throw_alert(ALERT_GRAVITY, /atom/movable/screen/alert/highgravity)
		if(GRAVITY_DAMAGE_THRESHOLD to INFINITY)
			throw_alert(ALERT_GRAVITY, /atom/movable/screen/alert/veryhighgravity)

	// If we had no gravity alert, or the same alert as before, go home
	if(!gravity_alert || alerts[ALERT_GRAVITY] == gravity_alert)
		return
	// By this point we know that we do not have the same alert as we used to
	if(istype(gravity_alert, /atom/movable/screen/alert/weightless))
		REMOVE_TRAIT(src, TRAIT_MOVE_FLOATING, NO_GRAVITY_TRAIT)
	if(istype(gravity_alert, /atom/movable/screen/alert/negative))
		var/matrix/flipped_matrix = transform
		flipped_matrix.b = -flipped_matrix.b
		flipped_matrix.e = -flipped_matrix.e
		animate(src, transform = flipped_matrix, pixel_y = pixel_y-4, time = 0.5 SECONDS, easing = EASE_OUT)
		base_pixel_y -= 4

/mob/living/singularity_pull(S, current_size)
	..()
	if(move_resist == INFINITY)
		return
	if(current_size >= STAGE_SIX) //your puny magboots/wings/whatever will not save you against supermatter singularity
		throw_at(S, 14, 3, src, TRUE)
	else if(!src.mob_negates_gravity())
		step_towards(src,S)

/mob/living/proc/get_temperature(datum/gas_mixture/environment)
	var/loc_temp = environment ? environment.temperature : T0C
	if(isobj(loc))
		var/obj/oloc = loc
		var/obj_temp = oloc.return_temperature()
		if(obj_temp != null)
			loc_temp = obj_temp
	else if(isspaceturf(get_turf(src)))
		var/turf/heat_turf = get_turf(src)
		loc_temp = heat_turf.temperature
	if(ismovable(loc))
		var/atom/movable/occupied_space = loc
		loc_temp = ((1 - occupied_space.contents_thermal_insulation) * loc_temp) + (occupied_space.contents_thermal_insulation * bodytemperature)
	return loc_temp

/mob/living/cancel_camera()
	..()
	cameraFollow = null

/mob/living/proc/can_track(mob/living/user)
	//basic fast checks go first. When overriding this proc, I recommend calling ..() at the end.
	if(SEND_SIGNAL(src, COMSIG_LIVING_CAN_TRACK, user) & COMPONENT_CANT_TRACK)
		return FALSE
	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	if(is_centcom_level(T.z)) //dont detect mobs on centcom
		return FALSE
	if(is_away_level(T.z))
		return FALSE
	if(user != null && src == user)
		return FALSE
	if(invisibility || alpha == 0)//cloaked
		return FALSE
	// Now, are they viewable by a camera? (This is last because it's the most intensive check)
	if(!near_camera(src))
		return FALSE
	return TRUE

/mob/living/proc/harvest(mob/living/user) //used for extra objects etc. in butchering
	return

/mob/living/can_hold_items(obj/item/I)
	return usable_hands && ..()

/mob/living/canUseTopic(atom/movable/M, be_close=FALSE, no_dexterity=FALSE, no_tk=FALSE, need_hands = FALSE, floor_okay=FALSE)
	if(!(mobility_flags & MOBILITY_UI) && !floor_okay)
		to_chat(src, span_warning("You can't do that right now!"))
		return FALSE
	if(be_close && !Adjacent(M) && (M.loc != src))
		if(no_tk)
			to_chat(src, span_warning("You are too far away!"))
			return FALSE
		var/datum/dna/D = has_dna()
		if(!D || !D.check_mutation(/datum/mutation/human/telekinesis) || !tkMaxRangeCheck(src, M))
			to_chat(src, span_warning("You are too far away!"))
			return FALSE
	if(need_hands && !can_hold_items(isitem(M) ? M : null)) //almost redundant if it weren't for mobs,
		to_chat(src, span_warning("You don't have the physical ability to do this!"))
		return FALSE
	if(!no_dexterity && !ISADVANCEDTOOLUSER(src))
		to_chat(src, span_warning("You don't have the dexterity to do this!"))
		return FALSE
	return TRUE

/mob/living/proc/can_use_guns(obj/item/G)//actually used for more than guns!
	if(G.trigger_guard == TRIGGER_GUARD_NONE)
		to_chat(src, span_warning("You are unable to fire this!"))
		return FALSE
	if(G.trigger_guard != TRIGGER_GUARD_ALLOW_ALL && (!ISADVANCEDTOOLUSER(src) && !HAS_TRAIT(src, TRAIT_GUN_NATURAL)))
		to_chat(src, span_warning("You try to fire [G], but can't use the trigger!"))
		return FALSE
	return TRUE

/mob/living/proc/update_stamina()
	return

/mob/living/carbon/alien/update_stamina()
	return

/mob/living/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first = 0, datum/callback/callback, force, gentle = FALSE, quickstart = TRUE)
	stop_pulling()
	. = ..()

// Used in polymorph code to shapeshift mobs into other creatures
/**
 * Polymorphs our mob into another mob.
 * If successful, our current mob is qdeleted!
 *
 * what_to_randomize - what are we randomizing the mob into? See the defines for valid options.
 * change_flags - only used for humanoid randomization (currently), what pool of changeflags should we draw from?
 *
 * Returns a mob (what our mob turned into) or null (if we failed).
 */
/mob/living/proc/wabbajack(what_to_randomize, change_flags = WABBAJACK)
	if(stat == DEAD || notransform || (GODMODE & status_flags))
		return

	if(SEND_SIGNAL(src, COMSIG_LIVING_PRE_WABBAJACKED, what_to_randomize) & STOP_WABBAJACK)
		return

	notransform = TRUE
	ADD_TRAIT(src, TRAIT_IMMOBILIZED, MAGIC_TRAIT)
	ADD_TRAIT(src, TRAIT_HANDS_BLOCKED, MAGIC_TRAIT)
	icon = null
	cut_overlays()
	invisibility = INVISIBILITY_ABSTRACT

	var/list/item_contents = list()

	if(iscyborg(src))
		var/mob/living/silicon/robot/Robot = src
		// Disconnect AI's in shells
		if(Robot.connected_ai)
			Robot.connected_ai.disconnect_shell()
		if(Robot.mmi)
			qdel(Robot.mmi)
		Robot.notify_ai(AI_NOTIFICATION_NEW_BORG)
	else
		for(var/obj/item/item in src)
			if(!dropItemToGround(item))
				qdel(item)
				continue
			item_contents += item

	var/mob/living/new_mob

	var/static/list/possible_results = list(
		WABBAJACK_MONKEY,
		WABBAJACK_ROBOT,
		WABBAJACK_SLIME,
		WABBAJACK_XENO,
		WABBAJACK_HUMAN,
		WABBAJACK_ANIMAL,
	)

	// If we weren't passed one, pick a default one
	what_to_randomize ||= pick(possible_results)

	switch(what_to_randomize)
		if(WABBAJACK_MONKEY)
			new_mob = new /mob/living/carbon/human/species/monkey(loc)

		if(WABBAJACK_ROBOT)
			var/static/list/robot_options = list(
				/mob/living/silicon/robot = 200,
				/mob/living/simple_animal/drone/polymorphed = 200,
				/mob/living/silicon/robot/model/syndicate = 1,
				/mob/living/silicon/robot/model/syndicate/medical = 1,
				/mob/living/silicon/robot/model/syndicate/saboteur = 1,
			)

			var/picked_robot = pick(robot_options)
			new_mob = new picked_robot(loc)
			if(issilicon(new_mob))
				var/mob/living/silicon/robot/created_robot = new_mob
				new_mob.gender = gender
				new_mob.invisibility = 0
				new_mob.job = JOB_CYBORG
				created_robot.lawupdate = FALSE
				created_robot.connected_ai = null
				created_robot.mmi.transfer_identity(src) //Does not transfer key/client.
				created_robot.clear_inherent_laws(announce = FALSE)
				created_robot.clear_zeroth_law(announce = FALSE)

		if(WABBAJACK_SLIME)
			new_mob = new /mob/living/simple_animal/slime/random(loc)

		if(WABBAJACK_XENO)
			var/picked_xeno_type

			if(ckey)
				picked_xeno_type = pick(
					/mob/living/carbon/alien/adult/hunter,
					/mob/living/carbon/alien/adult/sentinel,
				)
			else
				picked_xeno_type = pick(
					/mob/living/carbon/alien/adult/hunter,
					/mob/living/simple_animal/hostile/alien/sentinel,
				)
			new_mob = new picked_xeno_type(loc)

		if(WABBAJACK_ANIMAL)
			var/picked_animal = pick(
				/mob/living/simple_animal/hostile/carp,
				/mob/living/simple_animal/hostile/bear,
				/mob/living/simple_animal/hostile/mushroom,
				/mob/living/simple_animal/hostile/netherworld/statue,
				/mob/living/simple_animal/hostile/retaliate/bat,
				/mob/living/simple_animal/hostile/retaliate/goat,
				/mob/living/simple_animal/hostile/killertomato,
				/mob/living/simple_animal/hostile/giant_spider,
				/mob/living/simple_animal/hostile/giant_spider/hunter,
				/mob/living/simple_animal/hostile/blob/blobbernaut/independent,
				/mob/living/simple_animal/hostile/carp/ranged,
				/mob/living/simple_animal/hostile/carp/ranged/chaos,
				/mob/living/simple_animal/hostile/asteroid/basilisk/watcher,
				/mob/living/simple_animal/hostile/asteroid/goliath/beast,
				/mob/living/simple_animal/hostile/headcrab,
				/mob/living/simple_animal/hostile/morph,
				/mob/living/basic/stickman,
				/mob/living/basic/stickman/dog,
				/mob/living/simple_animal/hostile/megafauna/dragon/lesser,
				/mob/living/simple_animal/hostile/gorilla,
				/mob/living/simple_animal/parrot,
				/mob/living/simple_animal/pet/dog/corgi,
				/mob/living/simple_animal/crab,
				/mob/living/simple_animal/pet/dog/pug,
				/mob/living/simple_animal/pet/cat,
				/mob/living/basic/mouse,
				/mob/living/simple_animal/chicken,
				/mob/living/basic/cow,
				/mob/living/simple_animal/hostile/lizard,
				/mob/living/simple_animal/pet/fox,
				/mob/living/simple_animal/butterfly,
				/mob/living/simple_animal/pet/cat/cak,
				/mob/living/simple_animal/pet/dog/breaddog,
				/mob/living/simple_animal/chick,
			)
			new_mob = new picked_animal(loc)

		if(WABBAJACK_HUMAN)
			var/mob/living/carbon/human/new_human = new(loc)

			// 50% chance that we'll also randomice race
			if(prob(50))
				var/list/chooseable_races = list()
				for(var/datum/species/species_type as anything in subtypesof(/datum/species))
					if(initial(species_type.changesource_flags) & change_flags)
						chooseable_races += species_type

				if(length(chooseable_races))
					new_human.set_species(pick(chooseable_races))

			// Randomize everything but the species, which was already handled above.
			new_human.randomize_human_appearance(~RANDOMIZE_SPECIES)
			new_human.update_body(is_creating = TRUE)
			new_human.dna.update_dna_identity()
			new_mob = new_human

		else
			stack_trace("wabbajack() was called without an invalid randomization choice. ([what_to_randomize])")

	if(!new_mob)
		return

	to_chat(src, span_hypnophrase(span_big("Your form morphs into that of a [what_to_randomize]!")))

	// And of course, make sure they get policy for being transformed
	var/poly_msg = get_policy(POLICY_POLYMORPH)
	if(poly_msg)
		to_chat(src, poly_msg)

	// Some forms can still wear some items
	for(var/obj/item/item as anything in item_contents)
		new_mob.equip_to_appropriate_slot(item)

	// I don't actually know why we do this
	new_mob.set_combat_mode(TRUE)

	// on_wabbajack is where we handle setting up the name,
	// transfering the mind and observerse, and other miscellaneous
	// actions that should be done before we delete the original mob.
	on_wabbajacked(new_mob)

	qdel(src)
	return new_mob

// Called when we are hit by a bolt of polymorph and changed
// Generally the mob we are currently in is about to be deleted
/mob/living/proc/on_wabbajacked(mob/living/new_mob)
	log_message("became [new_mob.name] ([new_mob.type])", LOG_ATTACK, color = "orange")
	SEND_SIGNAL(src, COMSIG_LIVING_ON_WABBAJACKED, new_mob)
	new_mob.name = real_name
	new_mob.real_name = real_name

	// Transfer mind to the new mob (also handles actions and observers and stuff)
	if(mind)
		mind.transfer_to(new_mob)

	// Well, no mmind, guess we should try to move a key over
	else if(key)
		new_mob.key = key

/mob/living/proc/unfry_mob() //Callback proc to tone down spam from multiple sizzling frying oil dipping.
	REMOVE_TRAIT(src, TRAIT_OIL_FRIED, "cooking_oil_react")

//Mobs on Fire

/// Global list that containes cached fire overlays for mobs
GLOBAL_LIST_EMPTY(fire_appearances)

/mob/living/proc/ignite_mob()
	if(fire_stacks <= 0)
		return FALSE

	var/datum/status_effect/fire_handler/fire_stacks/fire_status = has_status_effect(/datum/status_effect/fire_handler/fire_stacks)
	if(!fire_status || fire_status.on_fire)
		return FALSE

	return fire_status.ignite()

/mob/living/proc/update_fire()
	var/datum/status_effect/fire_handler/fire_handler = has_status_effect(/datum/status_effect/fire_handler)
	if(fire_handler)
		fire_handler.update_overlay()

/**
 * Extinguish all fire on the mob
 *
 * This removes all fire stacks, fire effects, alerts, and moods
 * Signals the extinguishing.
 */
/mob/living/proc/extinguish_mob()
	var/datum/status_effect/fire_handler/fire_stacks/fire_status = has_status_effect(/datum/status_effect/fire_handler/fire_stacks)
	if(!fire_status || !fire_status.on_fire)
		return

	remove_status_effect(/datum/status_effect/fire_handler/fire_stacks)

/**
 * Adjust the amount of fire stacks on a mob
 *
 * This modifies the fire stacks on a mob.
 *
 * Vars:
 * * stacks: int The amount to modify the fire stacks
 * * fire_type: type Type of fire status effect that we apply, should be subtype of /datum/status_effect/fire_handler/fire_stacks
 */

/mob/living/proc/adjust_fire_stacks(stacks, fire_type = /datum/status_effect/fire_handler/fire_stacks)
	if(stacks < 0)
		stacks = max(-fire_stacks, stacks)
	apply_status_effect(fire_type, stacks)

/mob/living/proc/adjust_wet_stacks(stacks, wet_type = /datum/status_effect/fire_handler/wet_stacks)
	if(stacks < 0)
		stacks = max(fire_stacks, stacks)
	apply_status_effect(wet_type, stacks)

/**
 * Set the fire stacks on a mob
 *
 * This sets the fire stacks on a mob, stacks are clamped between -20 and 20.
 * If the fire stacks are reduced to 0 then we will extinguish the mob.
 *
 * Vars:
 * * stacks: int The amount to set fire_stacks to
 * * fire_type: type Type of fire status effect that we apply, should be subtype of /datum/status_effect/fire_handler/fire_stacks
 * * remove_wet_stacks: bool If we remove all wet stacks upon doing this
 */

/mob/living/proc/set_fire_stacks(stacks, fire_type = /datum/status_effect/fire_handler/fire_stacks, remove_wet_stacks = TRUE)
	if(stacks < 0) //Shouldn't happen, ever
		CRASH("set_fire_stacks recieved negative [stacks] fire stacks")

	if(remove_wet_stacks)
		remove_status_effect(/datum/status_effect/fire_handler/wet_stacks)

	if(stacks == 0)
		remove_status_effect(fire_type)
		return

	apply_status_effect(fire_type, stacks, TRUE)

/mob/living/proc/set_wet_stacks(stacks, wet_type = /datum/status_effect/fire_handler/wet_stacks, remove_fire_stacks = TRUE)
	if(stacks < 0)
		CRASH("set_wet_stacks recieved negative [stacks] wet stacks")

	if(remove_fire_stacks)
		remove_status_effect(/datum/status_effect/fire_handler/fire_stacks)

	if(stacks == 0)
		remove_status_effect(wet_type)
		return

	apply_status_effect(wet_type, stacks, TRUE)

//Share fire evenly between the two mobs
//Called in MobBump() and Crossed()
/mob/living/proc/spreadFire(mob/living/spread_to)
	if(!istype(spread_to))
		return

	// can't spread fire to mobs that don't catch on fire
	if(HAS_TRAIT(spread_to, TRAIT_NOFIRE_SPREAD) || HAS_TRAIT(src, TRAIT_NOFIRE_SPREAD))
		return

	var/datum/status_effect/fire_handler/fire_stacks/fire_status = has_status_effect(/datum/status_effect/fire_handler/fire_stacks)
	var/datum/status_effect/fire_handler/fire_stacks/their_fire_status = spread_to.has_status_effect(/datum/status_effect/fire_handler/fire_stacks)
	if(fire_status && fire_status.on_fire)
		if(their_fire_status && their_fire_status.on_fire)
			var/firesplit = (fire_stacks + spread_to.fire_stacks) / 2
			var/fire_type = (spread_to.fire_stacks > fire_stacks) ? their_fire_status.type : fire_status.type
			set_fire_stacks(firesplit, fire_type)
			spread_to.set_fire_stacks(firesplit, fire_type)
			return

		adjust_fire_stacks(-fire_stacks / 2, fire_status.type)
		spread_to.adjust_fire_stacks(fire_stacks, fire_status.type)
		if(spread_to.ignite_mob())
			log_message("bumped into [key_name(spread_to)] and set them on fire.", LOG_ATTACK)
		return

	if(!their_fire_status || !their_fire_status.on_fire)
		return

	spread_to.adjust_fire_stacks(-spread_to.fire_stacks / 2, their_fire_status.type)
	adjust_fire_stacks(spread_to.fire_stacks, their_fire_status.type)
	ignite_mob()

/**
 * Sets fire overlay of the mob.
 *
 * Vars:
 * * stacks: Current amount of fire_stacks
 * * on_fire: If we're lit on fire
 * * last_icon_state: Holds last fire overlay icon state, used for optimization
 * * suffix: Suffix for the fire icon state for special fire types
 *
 * This should return last_icon_state for the fire status efect
 */

/mob/living/proc/update_fire_overlay(stacks, on_fire, last_icon_state, suffix = "")
	return last_icon_state

/**
 * Handles effects happening when mob is on normal fire
 *
 * Vars:
 * * delta_time
 * * times_fired
 * * fire_handler: Current fire status effect that called the proc
 */

/mob/living/proc/on_fire_stack(delta_time, times_fired, datum/status_effect/fire_handler/fire_stacks/fire_handler)
	return

//Mobs on Fire end

// used by secbot and monkeys Crossed
/mob/living/proc/knockOver(mob/living/carbon/C)
	if(C.key) //save us from monkey hordes
		C.visible_message("<span class='warning'>[pick( \
						"[C] dives out of [src]'s way!", \
						"[C] stumbles over [src]!", \
						"[C] jumps out of [src]'s path!", \
						"[C] trips over [src] and falls!", \
						"[C] topples over [src]!", \
						"[C] leaps out of [src]'s way!")]</span>")
	C.Paralyze(40)

/mob/living/can_be_pulled()
	return ..() && !(buckled?.buckle_prevents_pull)


/// Called when mob changes from a standing position into a prone while lacking the ability to stand up at the moment.
/mob/living/proc/on_fall()
	return

/mob/living/forceMove(atom/destination)
	if(!currently_z_moving)
		stop_pulling()
		if(buckled && !HAS_TRAIT(src, TRAIT_CANNOT_BE_UNBUCKLED))
			buckled.unbuckle_mob(src, force = TRUE)
		if(has_buckled_mobs())
			unbuckle_all_mobs(force = TRUE)
	. = ..()
	if(. && client)
		reset_perspective()


/mob/living/proc/update_z(new_z) // 1+ to register, null to unregister
	if (registered_z != new_z)
		if (registered_z)
			SSmobs.clients_by_zlevel[registered_z] -= src
		if (client)
			if (new_z)
				//Figure out how many clients were here before
				var/oldlen = SSmobs.clients_by_zlevel[new_z].len
				SSmobs.clients_by_zlevel[new_z] += src
				for (var/I in length(SSidlenpcpool.idle_mobs_by_zlevel[new_z]) to 1 step -1) //Backwards loop because we're removing (guarantees optimal rather than worst-case performance), it's fine to use .len here but doesn't compile on 511
					var/mob/living/simple_animal/SA = SSidlenpcpool.idle_mobs_by_zlevel[new_z][I]
					if (SA)
						if(oldlen == 0)
							//Start AI idle if nobody else was on this z level before (mobs will switch off when this is the case)
							SA.toggle_ai(AI_IDLE)

						//If they are also within a close distance ask the AI if it wants to wake up
						if(get_dist(get_turf(src), get_turf(SA)) < MAX_SIMPLEMOB_WAKEUP_RANGE)
							SA.consider_wakeup() // Ask the mob if it wants to turn on it's AI
					//They should clean up in destroy, but often don't so we get them here
					else
						SSidlenpcpool.idle_mobs_by_zlevel[new_z] -= SA


			registered_z = new_z
		else
			registered_z = null

/mob/living/on_changed_z_level(turf/old_turf, turf/new_turf, same_z_layer, notify_contents)
	..()
	update_z(new_turf?.z)

/mob/living/MouseDrop_T(atom/dropping, atom/user)
	var/mob/living/U = user
	if(isliving(dropping))
		var/mob/living/M = dropping
		if(M.can_be_held && U.pulling == M)
			M.mob_try_pickup(U)//blame kevinz
			return//dont open the mobs inventory if you are picking them up
	. = ..()

/mob/living/proc/mob_pickup(mob/living/L)
	var/obj/item/clothing/head/mob_holder/holder = new(get_turf(src), src, held_state, head_icon, held_lh, held_rh, worn_slot_flags)
	L.visible_message(span_warning("[L] scoops up [src]!"))
	L.put_in_hands(holder)

/mob/living/proc/set_name()
	numba = rand(1, 1000)
	name = "[name] ([numba])"
	real_name = name

/mob/living/proc/mob_try_pickup(mob/living/user, instant=FALSE)
	if(!ishuman(user))
		return
	if(!user.get_empty_held_indexes())
		to_chat(user, span_warning("Your hands are full!"))
		return FALSE
	if(buckled)
		to_chat(user, span_warning("[src] is buckled to something!"))
		return FALSE
	if(!instant)
		user.visible_message(span_warning("[user] starts trying to scoop up [src]!"), \
						span_danger("You start trying to scoop up [src]..."), null, null, src)
		to_chat(src, span_userdanger("[user] starts trying to scoop you up!"))
		if(!do_after(user, 2 SECONDS, target = src))
			return FALSE
	mob_pickup(user)
	return TRUE

/mob/living/proc/get_static_viruses() //used when creating blood and other infective objects
	if(!LAZYLEN(diseases))
		return
	var/list/datum/disease/result = list()
	for(var/datum/disease/D in diseases)
		var/static_virus = D.Copy()
		result += static_virus
	return result

/mob/living/reset_perspective(atom/A)
	if(!..())
		return
	update_sight()
	update_fullscreen()
	update_pipe_vision()

/// Proc used to handle the fullscreen overlay updates, realistically meant for the reset_perspective() proc.
/mob/living/proc/update_fullscreen()
	if(client.eye && client.eye != src)
		var/atom/client_eye = client.eye
		client_eye.get_remote_view_fullscreens(src)
	else
		clear_fullscreen("remote_view", 0)

/mob/living/vv_edit_var(var_name, var_value)
	switch(var_name)
		if (NAMEOF(src, maxHealth))
			if (!isnum(var_value) || var_value <= 0)
				return FALSE
		if(NAMEOF(src, health)) //this doesn't work. gotta use procs instead.
			return FALSE
		if(NAMEOF(src, resting))
			set_resting(var_value)
			. = TRUE
		if(NAMEOF(src, lying_angle))
			set_lying_angle(var_value)
			. = TRUE
		if(NAMEOF(src, buckled))
			set_buckled(var_value)
			. = TRUE
		if(NAMEOF(src, num_legs))
			set_num_legs(var_value)
			. = TRUE
		if(NAMEOF(src, usable_legs))
			set_usable_legs(var_value)
			. = TRUE
		if(NAMEOF(src, num_hands))
			set_num_hands(var_value)
			. = TRUE
		if(NAMEOF(src, usable_hands))
			set_usable_hands(var_value)
			. = TRUE
		if(NAMEOF(src, body_position))
			set_body_position(var_value)
			. = TRUE

	if(!isnull(.))
		datum_flags |= DF_VAR_EDITED
		return

	. = ..()

	switch(var_name)
		if(NAMEOF(src, maxHealth))
			updatehealth()
		if(NAMEOF(src, resize))
			update_transform()
		if(NAMEOF(src, lighting_alpha))
			sync_lighting_plane_alpha()


/mob/living/vv_get_header()
	. = ..()
	var/refid = REF(src)
	. += {"
		<br><font size='1'>[VV_HREF_TARGETREF(refid, VV_HK_GIVE_DIRECT_CONTROL, "[ckey || "no ckey"]")] / [VV_HREF_TARGETREF_1V(refid, VV_HK_BASIC_EDIT, "[real_name || "no real name"]", NAMEOF(src, real_name))]</font>
		<br><font size='1'>
			BRUTE:<font size='1'><a href='?_src_=vars;[HrefToken()];mobToDamage=[refid];adjustDamage=brute' id='brute'>[getBruteLoss()]</a>
			FIRE:<font size='1'><a href='?_src_=vars;[HrefToken()];mobToDamage=[refid];adjustDamage=fire' id='fire'>[getFireLoss()]</a>
			TOXIN:<font size='1'><a href='?_src_=vars;[HrefToken()];mobToDamage=[refid];adjustDamage=toxin' id='toxin'>[getToxLoss()]</a>
			OXY:<font size='1'><a href='?_src_=vars;[HrefToken()];mobToDamage=[refid];adjustDamage=oxygen' id='oxygen'>[getOxyLoss()]</a>
			CLONE:<font size='1'><a href='?_src_=vars;[HrefToken()];mobToDamage=[refid];adjustDamage=clone' id='clone'>[getCloneLoss()]</a>
			BRAIN:<font size='1'><a href='?_src_=vars;[HrefToken()];mobToDamage=[refid];adjustDamage=brain' id='brain'>[getOrganLoss(ORGAN_SLOT_BRAIN)]</a>
			STAMINA:<font size='1'><a href='?_src_=vars;[HrefToken()];mobToDamage=[refid];adjustDamage=stamina' id='stamina'>[getStaminaLoss()]</a>
		</font>
	"}

/mob/living/vv_get_dropdown()
	. = ..()
	VV_DROPDOWN_OPTION("", "---------")
	VV_DROPDOWN_OPTION(VV_HK_GIVE_SPEECH_IMPEDIMENT, "Impede Speech (Slurring, stuttering, etc)")
	VV_DROPDOWN_OPTION(VV_HK_ADD_MOOD, "Add Mood Event")
	VV_DROPDOWN_OPTION(VV_HK_REMOVE_MOOD, "Remove Mood Event")
	VV_DROPDOWN_OPTION(VV_HK_GIVE_HALLUCINATION, "Give Hallucination")
	VV_DROPDOWN_OPTION(VV_HK_GIVE_DELUSION_HALLUCINATION, "Give Delusion Hallucination")

/mob/living/vv_do_topic(list/href_list)
	. = ..()

	if(href_list[VV_HK_GIVE_SPEECH_IMPEDIMENT])
		if(!check_rights(NONE))
			return
		admin_give_speech_impediment(usr)
	if (href_list[VV_HK_ADD_MOOD])
		admin_add_mood_event(usr)
	if (href_list[VV_HK_REMOVE_MOOD])
		admin_remove_mood_event(usr)

	if(href_list[VV_HK_GIVE_HALLUCINATION])
		if(!check_rights(NONE))
			return
		admin_give_hallucination(usr)

	if(href_list[VV_HK_GIVE_DELUSION_HALLUCINATION])
		if(!check_rights(NONE))
			return
		admin_give_delusion(usr)

/mob/living/proc/move_to_error_room()
	var/obj/effect/landmark/error/error_landmark = locate(/obj/effect/landmark/error) in GLOB.landmarks_list
	if(error_landmark)
		forceMove(error_landmark.loc)
	else
		forceMove(locate(4,4,1)) //Even if the landmark is missing, this should put them in the error room.
		//If you're here from seeing this error, I'm sorry. I'm so very sorry. The error landmark should be a sacred object that nobody has any business messing with, and someone did!
		//Consider seeing a therapist.
		var/ERROR_ERROR_LANDMARK_ERROR = "ERROR-ERROR: ERROR landmark missing!"
		log_mapping(ERROR_ERROR_LANDMARK_ERROR)
		CRASH(ERROR_ERROR_LANDMARK_ERROR)

/**
 * Changes the inclination angle of a mob, used by humans and others to differentiate between standing up and prone positions.
 *
 * In BYOND-angles 0 is NORTH, 90 is EAST, 180 is SOUTH and 270 is WEST.
 * This usually means that 0 is standing up, 90 and 270 are horizontal positions to right and left respectively, and 180 is upside-down.
 * Mobs that do now follow these conventions due to unusual sprites should require a special handling or redefinition of this proc, due to the density and layer changes.
 * The return of this proc is the previous value of the modified lying_angle if a change was successful (might include zero), or null if no change was made.
 */
/mob/living/proc/set_lying_angle(new_lying)
	if(new_lying == lying_angle)
		return
	. = lying_angle
	lying_angle = new_lying
	if(lying_angle != lying_prev)
		update_transform()
		lying_prev = lying_angle


/**
 * add_body_temperature_change Adds modifications to the body temperature
 *
 * This collects all body temperature changes that the mob is experiencing to the list body_temp_changes
 * the aggrogate result is used to derive the new body temperature for the mob
 *
 * arguments:
 * * key_name (str) The unique key for this change, if it already exist it will be overridden
 * * amount (int) The amount of change from the base body temperature
 */
/mob/living/proc/add_body_temperature_change(key_name, amount)
	body_temp_changes["[key_name]"] = amount

/**
 * remove_body_temperature_change Removes the modifications to the body temperature
 *
 * This removes the recorded change to body temperature from the body_temp_changes list
 *
 * arguments:
 * * key_name (str) The unique key for this change that will be removed
 */
/mob/living/proc/remove_body_temperature_change(key_name)
	body_temp_changes -= key_name

/**
 * get_body_temp_normal_change Returns the aggregate change to body temperature
 *
 * This aggregates all the changes in the body_temp_changes list and returns the result
 */
/mob/living/proc/get_body_temp_normal_change()
	var/total_change = 0
	if(body_temp_changes.len)
		for(var/change in body_temp_changes)
			total_change += body_temp_changes["[change]"]
	return total_change

/**
 * get_body_temp_normal Returns the mobs normal body temperature with any modifications applied
 *
 * This applies the result from proc/get_body_temp_normal_change() against the BODYTEMP_NORMAL and returns the result
 *
 * arguments:
 * * apply_change (optional) Default True This applies the changes to body temperature normal
 */
/mob/living/proc/get_body_temp_normal(apply_change=TRUE)
	if(!apply_change)
		return BODYTEMP_NORMAL
	return BODYTEMP_NORMAL + get_body_temp_normal_change()

///Returns the body temperature at which this mob will start taking heat damage.
/mob/living/proc/get_body_temp_heat_damage_limit()
	return BODYTEMP_HEAT_DAMAGE_LIMIT

///Returns the body temperature at which this mob will start taking cold damage.
/mob/living/proc/get_body_temp_cold_damage_limit()
	return BODYTEMP_COLD_DAMAGE_LIMIT

///Checks if the user is incapacitated or on cooldown.
/mob/living/proc/can_look_up()
	return !(incapacitated(IGNORE_RESTRAINTS))

/**
 * look_up Changes the perspective of the mob to any openspace turf above the mob
 *
 * This also checks if an openspace turf is above the mob before looking up or resets the perspective if already looking up
 *
 */
/mob/living/proc/look_up()
	if(client.perspective != MOB_PERSPECTIVE) //We are already looking up.
		stop_look_up()
	if(!can_look_up())
		return
	changeNext_move(CLICK_CD_LOOK_UP)
	RegisterSignal(src, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(stop_look_up)) //We stop looking up if we move.
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(start_look_up)) //We start looking again after we move.
	start_look_up()

/mob/living/proc/start_look_up()
	SIGNAL_HANDLER
	var/turf/ceiling = get_step_multiz(src, UP)
	if(!ceiling) //We are at the highest z-level.
		if (prob(0.1))
			to_chat(src, span_warning("You gaze out into the infinite vastness of deep space, for a moment, you have the impulse to continue travelling, out there, out into the deep beyond, before your conciousness reasserts itself and you decide to stay within travelling distance of the station."))
			return
		to_chat(src, span_warning("There's nothing interesting up there."))
		return
	else if(!istransparentturf(ceiling)) //There is no turf we can look through above us
		var/turf/front_hole = get_step(ceiling, dir)
		if(istransparentturf(front_hole))
			ceiling = front_hole
		else
			var/list/checkturfs = block(locate(x-1,y-1,ceiling.z),locate(x+1,y+1,ceiling.z))-ceiling-front_hole //Try find hole near of us
			for(var/turf/checkhole in checkturfs)
				if(istransparentturf(checkhole))
					ceiling = checkhole
					break
		if(!istransparentturf(ceiling))
			to_chat(src, span_warning("You can't see through the floor above you."))
			return

	reset_perspective(ceiling)

/mob/living/proc/stop_look_up()
	SIGNAL_HANDLER
	reset_perspective()

/mob/living/proc/end_look_up()
	stop_look_up()
	UnregisterSignal(src, COMSIG_MOVABLE_PRE_MOVE)
	UnregisterSignal(src, COMSIG_MOVABLE_MOVED)

/**
 * look_down Changes the perspective of the mob to any openspace turf below the mob
 *
 * This also checks if an openspace turf is below the mob before looking down or resets the perspective if already looking up
 *
 */
/mob/living/proc/look_down()
	if(client.perspective != MOB_PERSPECTIVE) //We are already looking down.
		stop_look_down()
	if(!can_look_up()) //if we cant look up, we cant look down.
		return
	changeNext_move(CLICK_CD_LOOK_UP)
	RegisterSignal(src, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(stop_look_down)) //We stop looking down if we move.
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(start_look_down)) //We start looking again after we move.
	start_look_down()

/mob/living/proc/start_look_down()
	SIGNAL_HANDLER
	var/turf/floor = get_turf(src)
	var/turf/lower_level = get_step_multiz(floor, DOWN)
	if(!lower_level) //We are at the lowest z-level.
		to_chat(src, span_warning("You can't see through the floor below you."))
		return
	else if(!istransparentturf(floor)) //There is no turf we can look through below us
		var/turf/front_hole = get_step(floor, dir)
		if(istransparentturf(front_hole))
			floor = front_hole
			lower_level = get_step_multiz(front_hole, DOWN)
		else
			var/list/checkturfs = block(locate(x-1,y-1,z),locate(x+1,y+1,z))-floor //Try find hole near of us
			for(var/turf/checkhole in checkturfs)
				if(istransparentturf(checkhole))
					floor = checkhole
					lower_level = get_step_multiz(checkhole, DOWN)
					break
		if(!istransparentturf(floor))
			to_chat(src, span_warning("You can't see through the floor below you."))
			return

	reset_perspective(lower_level)

/mob/living/proc/stop_look_down()
	SIGNAL_HANDLER
	reset_perspective()

/mob/living/proc/end_look_down()
	stop_look_down()
	UnregisterSignal(src, COMSIG_MOVABLE_PRE_MOVE)
	UnregisterSignal(src, COMSIG_MOVABLE_MOVED)


/mob/living/set_stat(new_stat)
	. = ..()
	if(isnull(.))
		return

	switch(.) //Previous stat.
		if(CONSCIOUS)
			if(stat >= UNCONSCIOUS)
				ADD_TRAIT(src, TRAIT_IMMOBILIZED, TRAIT_KNOCKEDOUT)
			ADD_TRAIT(src, TRAIT_HANDS_BLOCKED, STAT_TRAIT)
			ADD_TRAIT(src, TRAIT_INCAPACITATED, STAT_TRAIT)
			ADD_TRAIT(src, TRAIT_FLOORED, STAT_TRAIT)
		if(SOFT_CRIT)
			if(stat >= UNCONSCIOUS)
				ADD_TRAIT(src, TRAIT_IMMOBILIZED, TRAIT_KNOCKEDOUT) //adding trait sources should come before removing to avoid unnecessary updates
			if(pulledby)
				REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, PULLED_WHILE_SOFTCRIT_TRAIT)
		if(UNCONSCIOUS)
			if(stat != HARD_CRIT)
				cure_blind(UNCONSCIOUS_TRAIT)
		if(HARD_CRIT)
			if(stat != UNCONSCIOUS)
				cure_blind(UNCONSCIOUS_TRAIT)
		if(DEAD)
			remove_from_dead_mob_list()
			add_to_alive_mob_list()
	switch(stat) //Current stat.
		if(CONSCIOUS)
			if(. >= UNCONSCIOUS)
				REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, TRAIT_KNOCKEDOUT)
			REMOVE_TRAIT(src, TRAIT_HANDS_BLOCKED, STAT_TRAIT)
			REMOVE_TRAIT(src, TRAIT_INCAPACITATED, STAT_TRAIT)
			REMOVE_TRAIT(src, TRAIT_FLOORED, STAT_TRAIT)
			REMOVE_TRAIT(src, TRAIT_CRITICAL_CONDITION, STAT_TRAIT)
		if(SOFT_CRIT)
			if(pulledby)
				ADD_TRAIT(src, TRAIT_IMMOBILIZED, PULLED_WHILE_SOFTCRIT_TRAIT) //adding trait sources should come before removing to avoid unnecessary updates
			if(. >= UNCONSCIOUS)
				REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, TRAIT_KNOCKEDOUT)
			ADD_TRAIT(src, TRAIT_CRITICAL_CONDITION, STAT_TRAIT)
		if(UNCONSCIOUS)
			if(. != HARD_CRIT)
				become_blind(UNCONSCIOUS_TRAIT)
			if(health <= crit_threshold && !HAS_TRAIT(src, TRAIT_NOSOFTCRIT))
				ADD_TRAIT(src, TRAIT_CRITICAL_CONDITION, STAT_TRAIT)
			else
				REMOVE_TRAIT(src, TRAIT_CRITICAL_CONDITION, STAT_TRAIT)
		if(HARD_CRIT)
			if(. != UNCONSCIOUS)
				become_blind(UNCONSCIOUS_TRAIT)
			ADD_TRAIT(src, TRAIT_CRITICAL_CONDITION, STAT_TRAIT)
		if(DEAD)
			REMOVE_TRAIT(src, TRAIT_CRITICAL_CONDITION, STAT_TRAIT)
			remove_from_alive_mob_list()
			add_to_dead_mob_list()


///Reports the event of the change in value of the buckled variable.
/mob/living/proc/set_buckled(new_buckled)
	if(new_buckled == buckled)
		return
	SEND_SIGNAL(src, COMSIG_LIVING_SET_BUCKLED, new_buckled)
	. = buckled
	buckled = new_buckled
	if(buckled)
		if(!HAS_TRAIT(buckled, TRAIT_NO_IMMOBILIZE))
			ADD_TRAIT(src, TRAIT_IMMOBILIZED, BUCKLED_TRAIT)
		switch(buckled.buckle_lying)
			if(NO_BUCKLE_LYING) // The buckle doesn't force a lying angle.
				REMOVE_TRAIT(src, TRAIT_FLOORED, BUCKLED_TRAIT)
			if(0) // Forcing to a standing position.
				REMOVE_TRAIT(src, TRAIT_FLOORED, BUCKLED_TRAIT)
				set_body_position(STANDING_UP)
				set_lying_angle(0)
			else // Forcing to a lying position.
				ADD_TRAIT(src, TRAIT_FLOORED, BUCKLED_TRAIT)
				set_body_position(LYING_DOWN)
				set_lying_angle(buckled.buckle_lying)
	else
		REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, BUCKLED_TRAIT)
		REMOVE_TRAIT(src, TRAIT_FLOORED, BUCKLED_TRAIT)
		if(.) // We unbuckled from something.
			var/atom/movable/old_buckled = .
			if(old_buckled.buckle_lying == 0 && (resting || HAS_TRAIT(src, TRAIT_FLOORED))) // The buckle forced us to stay up (like a chair)
				set_lying_down() // We want to rest or are otherwise floored, so let's drop on the ground.

/mob/living/set_pulledby(new_pulledby)
	. = ..()
	if(. == FALSE) //null is a valid value here, we only want to return if FALSE is explicitly passed.
		return
	if(pulledby)
		if(!. && stat == SOFT_CRIT)
			ADD_TRAIT(src, TRAIT_IMMOBILIZED, PULLED_WHILE_SOFTCRIT_TRAIT)
	else if(. && stat == SOFT_CRIT)
		REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, PULLED_WHILE_SOFTCRIT_TRAIT)


/// Updates the grab state of the mob and updates movespeed
/mob/living/setGrabState(newstate)
	. = ..()
	switch(grab_state)
		if(GRAB_PASSIVE)
			remove_movespeed_modifier(MOVESPEED_ID_MOB_GRAB_STATE)
		if(GRAB_AGGRESSIVE)
			add_movespeed_modifier(/datum/movespeed_modifier/grab_slowdown/aggressive)
		if(GRAB_NECK)
			add_movespeed_modifier(/datum/movespeed_modifier/grab_slowdown/neck)
		if(GRAB_KILL)
			add_movespeed_modifier(/datum/movespeed_modifier/grab_slowdown/kill)


/// Only defined for carbons who can wear masks and helmets, we just assume other mobs have visible faces
/mob/living/proc/is_face_visible()
	return TRUE


///Proc to modify the value of num_legs and hook behavior associated to this event.
/mob/living/proc/set_num_legs(new_value)
	if(num_legs == new_value)
		return
	. = num_legs
	num_legs = new_value


///Proc to modify the value of usable_legs and hook behavior associated to this event.
/mob/living/proc/set_usable_legs(new_value)
	if(usable_legs == new_value)
		return
	if(new_value < 0) // Sanity check
		stack_trace("[src] had set_usable_legs() called on them with a negative value!")
		new_value = 0

	. = usable_legs
	usable_legs = new_value

	if(new_value > .) // Gained leg usage.
		REMOVE_TRAIT(src, TRAIT_FLOORED, LACKING_LOCOMOTION_APPENDAGES_TRAIT)
		REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, LACKING_LOCOMOTION_APPENDAGES_TRAIT)
	else if(!(movement_type & (FLYING | FLOATING))) //Lost leg usage, not flying.
		if(!usable_legs)
			ADD_TRAIT(src, TRAIT_FLOORED, LACKING_LOCOMOTION_APPENDAGES_TRAIT)
			if(!usable_hands)
				ADD_TRAIT(src, TRAIT_IMMOBILIZED, LACKING_LOCOMOTION_APPENDAGES_TRAIT)

	if(usable_legs < default_num_legs)
		var/limbless_slowdown = (default_num_legs - usable_legs) * 3
		if(!usable_legs && usable_hands < default_num_hands)
			limbless_slowdown += (default_num_hands - usable_hands) * 3
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/limbless, multiplicative_slowdown = limbless_slowdown)
	else
		remove_movespeed_modifier(/datum/movespeed_modifier/limbless)


///Proc to modify the value of num_hands and hook behavior associated to this event.
/mob/living/proc/set_num_hands(new_value)
	if(num_hands == new_value)
		return
	. = num_hands
	num_hands = new_value


///Proc to modify the value of usable_hands and hook behavior associated to this event.
/mob/living/proc/set_usable_hands(new_value)
	if(usable_hands == new_value)
		return
	. = usable_hands
	usable_hands = new_value

	if(new_value > .) // Gained hand usage.
		REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, LACKING_LOCOMOTION_APPENDAGES_TRAIT)
	else if(!(movement_type & (FLYING | FLOATING)) && !usable_hands && !usable_legs) //Lost a hand, not flying, no hands left, no legs.
		ADD_TRAIT(src, TRAIT_IMMOBILIZED, LACKING_LOCOMOTION_APPENDAGES_TRAIT)


/// Whether or not this mob will escape from storages while being picked up/held.
/mob/living/proc/will_escape_storage()
	return FALSE

//Used specifically for the clown box suicide act
/mob/living/carbon/human/will_escape_storage()
	return TRUE

/// Sets the mob's hunger levels to a safe overall level. Useful for TRAIT_NOHUNGER species changes.
/mob/living/proc/set_safe_hunger_level()
	// Nutrition reset and alert clearing.
	nutrition = NUTRITION_LEVEL_FED
	clear_alert(ALERT_NUTRITION)
	satiety = 0

	// Trait removal if obese
	if(HAS_TRAIT_FROM(src, TRAIT_FAT, OBESITY))
		if(overeatduration >= (200 SECONDS))
			to_chat(src, span_notice("Your transformation restores your body's natural fitness!"))

		REMOVE_TRAIT(src, TRAIT_FAT, OBESITY)
		remove_movespeed_modifier(/datum/movespeed_modifier/obesity)
		update_worn_undersuit()
		update_worn_oversuit()

	// Reset overeat duration.
	overeatduration = 0


/// Changes the value of the [living/body_position] variable.
/mob/living/proc/set_body_position(new_value)
	if(body_position == new_value)
		return
	if((new_value == LYING_DOWN) && !(mobility_flags & MOBILITY_LIEDOWN))
		return
	. = body_position
	body_position = new_value
	SEND_SIGNAL(src, COMSIG_LIVING_SET_BODY_POSITION, new_value, .)
	if(new_value == LYING_DOWN) // From standing to lying down.
		on_lying_down()
	else // From lying down to standing up.
		on_standing_up()


/// Proc to append behavior to the condition of being floored. Called when the condition starts.
/mob/living/proc/on_floored_start()
	if(body_position == STANDING_UP) //force them on the ground
		set_lying_angle(pick(90, 270))
		set_body_position(LYING_DOWN)
		on_fall()


/// Proc to append behavior to the condition of being floored. Called when the condition ends.
/mob/living/proc/on_floored_end()
	if(!resting)
		get_up()


/// Proc to append behavior to the condition of being handsblocked. Called when the condition starts.
/mob/living/proc/on_handsblocked_start()
	drop_all_held_items()
	ADD_TRAIT(src, TRAIT_UI_BLOCKED, TRAIT_HANDS_BLOCKED)
	ADD_TRAIT(src, TRAIT_PULL_BLOCKED, TRAIT_HANDS_BLOCKED)


/// Proc to append behavior to the condition of being handsblocked. Called when the condition ends.
/mob/living/proc/on_handsblocked_end()
	REMOVE_TRAIT(src, TRAIT_UI_BLOCKED, TRAIT_HANDS_BLOCKED)
	REMOVE_TRAIT(src, TRAIT_PULL_BLOCKED, TRAIT_HANDS_BLOCKED)


/// Returns the attack damage type of a living mob such as [BRUTE].
/mob/living/proc/get_attack_type()
	return BRUTE


/**
 * Apply a martial art move from src to target.
 *
 * This is used to process martial art attacks against nonhumans.
 * It is also used to process martial art attacks by nonhumans, even against humans
 * Human vs human attacks are handled in species code right now.
 */
/mob/living/proc/apply_martial_art(mob/living/target, modifiers, is_grab = FALSE)
	if(HAS_TRAIT(target, TRAIT_MARTIAL_ARTS_IMMUNE))
		return MARTIAL_ATTACK_INVALID
	var/datum/martial_art/style = mind?.martial_art
	if (!style)
		return MARTIAL_ATTACK_INVALID
	// will return boolean below since it's not invalid
	if (is_grab)
		return style.grab_act(src, target)
	if (LAZYACCESS(modifiers, RIGHT_CLICK))
		return style.disarm_act(src, target)
	if(combat_mode)
		if (HAS_TRAIT(src, TRAIT_PACIFISM))
			return FALSE
		return style.harm_act(src, target)
	return style.help_act(src, target)

/**
 * Returns an assoc list of assignments and minutes for updating a client's exp time in the databse.
 *
 * Arguments:
 * * minutes - The number of minutes to allocate to each valid role.
 */
/mob/living/proc/get_exp_list(minutes)
	var/list/exp_list = list()

	if(mind && mind.special_role && !(mind.datum_flags & DF_VAR_EDITED))
		exp_list[mind.special_role] = minutes

	if(mind.assigned_role.title in GLOB.exp_specialmap[EXP_TYPE_SPECIAL])
		exp_list[mind.assigned_role.title] = minutes

	return exp_list

/**
 * A proc triggered by callback when someone gets slammed by the tram and lands somewhere.
 *
 * This proc is used to force people to fall through things like lattice and unplated flooring at the expense of some
 * extra damage, so jokers can't use half a stack of iron rods to make getting hit by the tram immediately lethal.
 */
/mob/living/proc/tram_slam_land()
	if(!istype(loc, /turf/open/openspace) && !isplatingturf(loc))
		return

	if(isplatingturf(loc))
		var/turf/open/floor/smashed_plating = loc
		visible_message(span_danger("[src] is thrown violently into [smashed_plating], smashing through it and punching straight through!"),
				span_userdanger("You're thrown violently into [smashed_plating], smashing through it and punching straight through!"))
		apply_damage(rand(5,20), BRUTE, BODY_ZONE_CHEST)
		smashed_plating.ScrapeAway(1, CHANGETURF_INHERIT_AIR)

	for(var/obj/structure/lattice/lattice in loc)
		visible_message(span_danger("[src] is thrown violently into [lattice], smashing through it and punching straight through!"),
			span_userdanger("You're thrown violently into [lattice], smashing through it and punching straight through!"))
		apply_damage(rand(5,10), BRUTE, BODY_ZONE_CHEST)
		lattice.deconstruct(FALSE)

/**
 * Proc used by different station pets such as Ian and Poly so that some of their data can persist between rounds.
 * This base definition only contains a trait and comsig to stop memory from being (over)written.
 * Specific behavior is defined on subtypes that use it.
 */
/mob/living/proc/Write_Memory(dead, gibbed)
	SHOULD_CALL_PARENT(TRUE)
	if(HAS_TRAIT(src, TRAIT_DONT_WRITE_MEMORY)) //always prevent data from being written.
		return FALSE
	// for selective behaviors that may or may not prevent data from being written.
	if(SEND_SIGNAL(src, COMSIG_LIVING_WRITE_MEMORY, dead, gibbed) & COMPONENT_DONT_WRITE_MEMORY)
		return FALSE
	return TRUE

/// Admin only proc for giving a certain speech impediment to this mob
/mob/living/proc/admin_give_speech_impediment(mob/admin)
	if(!admin || !check_rights(NONE))
		return

	var/list/impediments = list()
	for(var/datum/status_effect/possible as anything in typesof(/datum/status_effect/speech))
		if(!initial(possible.id))
			continue

		impediments[initial(possible.id)] = possible

	var/chosen = tgui_input_list(admin, "What speech impediment?", "Impede Speech", impediments)
	if(!chosen || !ispath(impediments[chosen], /datum/status_effect/speech) || QDELETED(src) || !check_rights(NONE))
		return

	var/duration = tgui_input_number(admin, "How long should it last (in seconds)? Max is infinite duration.", "Duration", 0, INFINITY, 0 SECONDS)
	if(!isnum(duration) || duration <= 0 || QDELETED(src) || !check_rights(NONE))
		return

	adjust_timed_status_effect(duration * 1 SECONDS, impediments[chosen])

/mob/living/proc/admin_add_mood_event(mob/admin)
	if (!admin || !check_rights(NONE))
		return

	var/list/mood_events = typesof(/datum/mood_event)

	var/chosen = tgui_input_list(admin, "What mood event?", "Add Mood Event", mood_events)
	if (!chosen || QDELETED(src) || !check_rights(NONE))
		return

	mob_mood.add_mood_event("[rand(1, 50)]", chosen)

/mob/living/proc/admin_remove_mood_event(mob/admin)
	if (!admin || !check_rights(NONE))
		return

	var/list/mood_events = list()
	for (var/category in mob_mood.mood_events)
		var/datum/mood_event/event = mob_mood.mood_events[category]
		mood_events[event] = category


	var/datum/mood_event/chosen = tgui_input_list(admin, "What mood event?", "Remove Mood Event", mood_events)
	if (!chosen || QDELETED(src) || !check_rights(NONE))
		return

	mob_mood.clear_mood_event(mood_events[chosen])

/// Adds a mood event to the mob
/mob/living/proc/add_mood_event(category, type, ...)
	if(QDELETED(mob_mood))
		return
	mob_mood.add_mood_event(arglist(args))

/// Clears a mood event from the mob
/mob/living/proc/clear_mood_event(category)
	if(QDELETED(mob_mood))
		return
	mob_mood.clear_mood_event(category)

/mob/living/played_game()
	. = ..()
	add_mood_event("gaming", /datum/mood_event/gaming)

/// Admin only proc for making the mob hallucinate a certain thing
/mob/living/proc/admin_give_hallucination(mob/admin)
	if(!admin || !check_rights(NONE))
		return

	var/chosen = select_hallucination_type(admin, "What hallucination do you want to give to [src]?", "Give Hallucination")
	if(!chosen || QDELETED(src) || !check_rights(NONE))
		return

	if(!cause_hallucination(chosen, "admin forced by [key_name_admin(admin)]"))
		to_chat(admin, "That hallucination ([chosen]) could not be run - it may be invalid with this type of mob or has no effects.")
		return

	message_admins("[key_name_admin(admin)] gave [ADMIN_LOOKUPFLW(src)] a hallucination. (Type: [chosen])")
	log_admin("[key_name(admin)] gave [src] a hallucination. (Type: [chosen])")

/// Admin only proc for giving the mob a delusion hallucination with specific arguments
/mob/living/proc/admin_give_delusion(mob/admin)
	if(!admin || !check_rights(NONE))
		return

	var/list/delusion_args = create_delusion(admin)
	if(QDELETED(src) || !check_rights(NONE) || !length(delusion_args))
		return

	delusion_args[2] = "admin forced"
	message_admins("[key_name_admin(admin)] gave [ADMIN_LOOKUPFLW(src)] a delusion hallucination. (Type: [delusion_args[1]])")
	log_admin("[key_name(admin)] gave [src] a delusion hallucination. (Type: [delusion_args[1]])")
	// Not using the wrapper here because we already have a list / arglist
	_cause_hallucination(delusion_args)
