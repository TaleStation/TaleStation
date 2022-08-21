/// -- Pixelshifting UI and component. --
/// Keybinding hotkey signal.
#define COMSIG_KB_MOVEMENT_PIXELSHIFT_DOWN "keybinding_movement_pixelshift_down"
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

	pixelshift_movement_reset = !pixelshift_movement_reset
	to_chat(src, span_notice("Pixelshifts will [(pixelshift_movement_reset ? "now" : "no longer")] reset on movements."))

/mob/living/Move(atom/newloc, direct, glide_size_override)
	if(pixelshift_movement_reset)
		pixelshift_x = pixelshift_y = 0
		update_pixelshift()
	return ..()

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
	pixel_x = base_pixel_x + pixelshift_x
	pixel_y = base_pixel_y + pixelshift_y

/datum/keybinding/mob/living/pixel_shift
	hotkey_keys = list("'")
	name = "pixelshift"
	full_name = "Hold Pixel Shift"
	description = "Hold to activate pixel shifting. ITS IMPORTANT THAT THIS IS A SINGLE KEY AND DOES NOT CONFLICT WITH ANYTHING ELSE"
	keybind_signal = COMSIG_KB_MOVEMENT_PIXELSHIFT_DOWN
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/living/pixel_shift_reset
	hotkey_keys = list(";")
	name = "pixelshift_reset"
	full_name = "Reset Pixel Shift"
	description = "Press to reset your pixel shift."
	keybind_signal = COMSIG_KB_MOVEMENT_PIXELSHIFT_RESET_DOWN
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/living/pixel_shift_reset/down(client/user)
	. = ..()
	var/mob/living/user_mob = user.mob
	if(istype(user_mob))
		user_mob.reset_pixelshift()

/datum/keybinding/mob/living/pixel_shift/down(client/user)
	. = ..()
	user.pixelshifting = TRUE

/datum/keybinding/mob/living/pixel_shift/up(client/user)
	. = ..()
	user.pixelshifting = FALSE
	// prevents accidental movements right after releasing
	user.next_move_dir_sub = ALL

/mob/living/keyLoop(client/user)
	if(!user.pixelshifting)
		return ..()
	return

/datum/keybinding/movement/north/down(client/user)
	if(!user.pixelshifting)
		return ..()
	var/mob/living/user_mob = user.mob
	if(istype(user_mob))
		user_mob.pixelshift_north()

/datum/keybinding/movement/south/down(client/user)
	if(!user.pixelshifting)
		return ..()
	var/mob/living/user_mob = user.mob
	if(istype(user_mob))
		user_mob.pixelshift_south()

/datum/keybinding/movement/east/down(client/user)
	if(!user.pixelshifting)
		return ..()
	var/mob/living/user_mob = user.mob
	if(istype(user_mob))
		user_mob.pixelshift_east()

/datum/keybinding/movement/west/down(client/user)
	if(!user.pixelshifting)
		return ..()
	var/mob/living/user_mob = user.mob
	if(istype(user_mob))
		user_mob.pixelshift_west()
