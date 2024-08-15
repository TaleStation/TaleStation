/obj/item/grenade/firecracker/rat_bomb_explosive
	name = "vermin bomb"
	desc = "Not to be confused with its sister, the vermin grenade. This one has a faint smell of gunpowder.."
	icon = 'icons/obj/weapons/grenade.dmi'
	primer_sound = 'sound/effects/fuse.ogg'
	ex_heavy = 1
	ex_light = 3
	ex_flame = 4

/obj/item/grenade/firecracker/rat_bomb_explosive/Initialize(mapload)
	. = ..()
	base_icon_state = pick(list(
		"rat_bomb_brown",
		"rat_bomb_gray",
		"rat_bomb_white",
		))

	icon_state = base_icon_state

	update_appearance()

/obj/item/grenade/firecracker/rat_bomb_explosive/arm_grenade(mob/user, delayoverride)
	. = ..()
	icon_state = base_icon_state + "_active"
