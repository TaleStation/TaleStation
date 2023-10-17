#define COMSIG_KB_MOB_PIXEL_SHIFT_DOWN "keybinding_mob_pixel_shift_down"
#define COMSIG_KB_MOB_PIXEL_SHIFT_UP "keybinding_mob_pixel_shift_up"

/// from base of living/set_pull_offset(): (mob/living/pull_target, grab_state)
#define COMSIG_LIVING_SET_PULL_OFFSET "living_set_pull_offset"
/// from base of living/reset_pull_offsets(): (mob/living/pull_target, override)
#define COMSIG_LIVING_RESET_PULL_OFFSETS "living_reset_pull_offsets"
/// from base of living/CanAllowThrough(): (atom/movable/mover, border_dir)
#define COMSIG_LIVING_CAN_ALLOW_THROUGH "living_can_allow_through"
	#define COMPONENT_LIVING_PASSABLE (1<<0)

/mob/living/set_pull_offsets(mob/living/pull_target, grab_state)
	. = ..()
	SEND_SIGNAL(pull_target, COMSIG_LIVING_SET_PULL_OFFSET)

/mob/living/reset_pull_offsets(mob/living/pull_target, override)
	. = ..()
	SEND_SIGNAL(pull_target, COMSIG_LIVING_RESET_PULL_OFFSETS)

/mob/living/CanAllowThrough(atom/movable/mover, border_dir)
	if(SEND_SIGNAL(src, COMSIG_LIVING_CAN_ALLOW_THROUGH, mover, border_dir) & COMPONENT_LIVING_PASSABLE)
		return TRUE
	return ..()

/datum/keybinding/mob/pixel_shift
	hotkey_keys = list("B")
	name = "pixel_shift"
	full_name = "Pixel Shift"
	description = "Shift your characters offset."
	category = CATEGORY_MOVEMENT
	keybind_signal = COMSIG_KB_MOB_PIXEL_SHIFT_DOWN

/datum/keybinding/mob/pixel_shift/down(client/user)
	. = ..()
	if(.)
		return
	user.mob.add_pixel_shift_component()

/datum/keybinding/mob/pixel_shift/up(client/user)
	. = ..()
	SEND_SIGNAL(user.mob, COMSIG_KB_MOB_PIXEL_SHIFT_UP)

/// Adds pixel_shift component on call. Default proc does nothing.
/mob/proc/add_pixel_shift_component()
	return

/mob/living/add_pixel_shift_component()
	AddComponent(/datum/component/pixel_shift)
