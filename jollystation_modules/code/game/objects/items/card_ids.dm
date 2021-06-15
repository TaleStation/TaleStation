/// -- ID card extension and additions. --
/obj/item/card/id
	/// The icon path of our modular ID icons.
	var/alt_icon = 'jollystation_modules/icons/obj/card.dmi'

// Whenever an ID card updates their overlays, if the job is a modular one, swap to our alt_icon. Swap back if it's not a modular job.
/obj/item/card/id/update_overlays()
	if(assignment in get_all_module_jobs())
		icon = alt_icon
	else
		icon = initial(icon)

	. = ..()
