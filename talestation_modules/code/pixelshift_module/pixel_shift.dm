/// -- Pixelshifting UI and component. --
/// Keybinding hotkey signal.
#define COMSIG_KB_MOVEMENT_PIXELSHIFT_DOWN "keybinding_movement_pixelshift_down"
#define COMSIG_KB_MOVEMENT_PIXELSHIFT_TOGGLE_DOWN "keybinding_movement_pixelshift_toggle_down"
#define COMSIG_KB_MOVEMENT_PIXELSHIFT_RESET_DOWN "keybinding_movement_pixelshift_reset_down"

/// Defines for mins and maxs of x and y shifts.
#define PIXELSHIFT_Y_LIMIT 16
#define PIXELSHIFT_X_LIMIT 16

/client/var/pixelshifting = FALSE
/mob/living/var/pixelshift_movement_reset = TRUE
/mob/living/var/pixelshift_x = 0
/mob/living/var/pixelshift_y = 0

/mob/living/verb/toggle_pixelshift_movement_reset()
	set name = "Toggle Pixelshift Reset on Movement"
	set category = "Pixelshift"

	if(!CONFIG_GET(flag/pixelshift_toggle_allow))
		to_chat(src, span_warning("This feature is disabled via config."))
		return

	pixelshift_movement_reset = !pixelshift_movement_reset
	to_chat(src, span_notice("Pixelshifts will [(pixelshift_movement_reset ? "now" : "no longer")] reset on movements."))

/mob/living/Move(atom/newloc, direct, glide_size_override)
	if(pixelshift_movement_reset)
		pixelshift_x = pixelshift_y = 0
		update_pixelshift()
	return ..()

/mob/living/on_restrained_trait_gain(datum/source)
	. = ..()
	reset_pixelshift()

/mob/living/on_incapacitated_trait_gain(datum/source)
	. = ..()
	reset_pixelshift()

/mob/living/on_floored_trait_gain(datum/source)
	. = ..()
	reset_pixelshift()

/mob/living/on_immobilized_trait_gain(datum/source)
	. = ..()
	reset_pixelshift()

/mob/living/on_knockedout_trait_gain(datum/source)
	. = ..()
	reset_pixelshift()

/mob/living/proc/allow_pixelshifting()
	if(stat)
		return FALSE
	if(IsStun())
		return FALSE
	if(HAS_TRAIT(src, TRAIT_RESTRAINED))
		return FALSE
	if(HAS_TRAIT(src, TRAIT_INCAPACITATED))
		return FALSE
	if(HAS_TRAIT(src, TRAIT_FLOORED))
		return FALSE
	if(HAS_TRAIT(src, TRAIT_IMMOBILIZED))
		return FALSE
	if(HAS_TRAIT(src, TRAIT_KNOCKEDOUT))
		return FALSE
	return TRUE

/mob/living/set_stat(new_stat)
	. = ..()
	if(!allow_pixelshifting())
		reset_pixelshift()

/mob/living/SetStun(amount, ignore_canstun)
	. = ..()
	if(!allow_pixelshifting())
		reset_pixelshift()

/mob/living/verb/reset_pixelshift()
	set name = "Reset Pixelshift"
	set category = "Pixelshift"

	pixelshift_x = 0
	pixelshift_y = 0
	update_pixelshift()

/mob/living/verb/pixelshift_north()
	set name = "Shift North"
	set category = "Pixelshift"

	if(pixelshift_y >= PIXELSHIFT_Y_LIMIT)
		return

	pixelshift_y++
	update_pixelshift()

/mob/living/verb/pixelshift_south()
	set name = "Shift South"
	set category = "Pixelshift"

	if(pixelshift_y <= -PIXELSHIFT_Y_LIMIT)
		return

	pixelshift_y--
	update_pixelshift()

/mob/living/verb/pixelshift_west()
	set name = "Shift West"
	set category = "Pixelshift"

	if(pixelshift_x <= -PIXELSHIFT_X_LIMIT)
		return

	pixelshift_x--
	update_pixelshift()

/mob/living/verb/pixelshift_east()
	set name = "Shift East"
	set category = "Pixelshift"

	if(pixelshift_x >= PIXELSHIFT_X_LIMIT)
		return

	pixelshift_x++
	update_pixelshift()

/mob/living/proc/update_pixelshift()
	pixel_x = base_pixel_x + pixelshift_x + body_position_pixel_x_offset
	pixel_y = base_pixel_y + pixelshift_y + body_position_pixel_y_offset

/datum/keybinding/mob/living/pixel_shift
	hotkey_keys = list("'")
	name = "pixelshifthold"
	full_name = "Hold Pixel Shift"
	description = "Hold to activate pixel shifting. ITS IMPORTANT THAT THIS IS A SINGLE KEY AND DOES NOT CONFLICT WITH ANYTHING ELSE"
	keybind_signal = COMSIG_KB_MOVEMENT_PIXELSHIFT_DOWN
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/living/pixel_shift_toggle
	hotkey_keys = list("\[")
	name = "pixelshifttoggle"
	full_name = "Toggle Pixel Shift"
	description = "Press to toggle pixel shifting. ITS IMPORTANT THAT THIS IS A SINGLE KEY AND DOES NOT CONFLICT WITH ANYTHING ELSE"
	keybind_signal = COMSIG_KB_MOVEMENT_PIXELSHIFT_TOGGLE_DOWN
	category = CATEGORY_MOVEMENT


/datum/keybinding/mob/living/pixel_shift_reset
	hotkey_keys = list(";")
	name = "pixelshift_reset"
	full_name = "Reset Pixel Shift"
	description = "Press to reset your pixel shift."
	keybind_signal = COMSIG_KB_MOVEMENT_PIXELSHIFT_RESET_DOWN
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/living/pixel_shift/down(client/user)
	. = ..()
	user.pixelshifting = TRUE

/datum/keybinding/mob/living/pixel_shift/up(client/user)
	. = ..()
	user.pixelshifting = FALSE
	// prevents accidental movements right after releasing
	user.next_move_dir_sub = ALL

/datum/keybinding/mob/living/pixel_shift_toggle/down(client/user)
	. = ..()
	user.pixelshifting = !user.pixelshifting
	if(!user.pixelshifting)
		user.next_move_dir_sub = ALL
	to_chat(user, span_notice("Pixel Shifting is now [(user.pixelshifting ? "enabled" : "disabled")]"))

/datum/keybinding/mob/living/pixel_shift_reset/down(client/user)
	. = ..()
	var/mob/living/user_mob = user.mob
	if(istype(user_mob))
		user_mob.reset_pixelshift()

/mob/living/keyLoop(client/user)
	if(!user.pixelshifting)
		return ..()
	var/mob/living/living_mob = user.mob
	if(!istype(living_mob))
		return

	var/movement
	for(var/_key in user?.keys_held)
		movement = movement | user.movement_keys[_key]
	if(movement & NORTH)
		living_mob.pixelshift_north()
	if(movement & SOUTH)
		living_mob.pixelshift_south()
	if(movement & EAST)
		living_mob.pixelshift_east()
	if(movement & WEST)
		living_mob.pixelshift_west()
