// -- Extra mob/ level procs and extensions --
// This is pretty much just a mirror of atom/proc/prepare_huds().
// There's probably be a better way of doing this...
/atom/proc/prepare_jollystation_huds()
	hud_list = list()
	for(var/hud in hud_possible)
		var/hint = hud_possible[hud]
		switch(hint)
			if(HUD_LIST_LIST)
				hud_list[hud] = list()
			else
				var/image/I = image('jollystation_modules/icons/mob/hud.dmi', src, "")
				I.appearance_flags = RESET_COLOR|RESET_TRANSFORM
				hud_list[hud] = I
