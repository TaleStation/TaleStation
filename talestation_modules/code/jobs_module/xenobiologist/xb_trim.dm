/datum/id_trim/job/xenobiologist
	assignment = "Xenobiologist"
	trim_icon = 'talestation_modules/icons/obj/card.dmi'
	trim_state = "trim_xenobiologist"
	sechud_icon = 'talestation_modules/icons/mob/huds/hud.dmi'
	sechud_icon_state = "hudxenobiologist"

	extra_access = list(
		ACCESS_GENETICS,
		ACCESS_ROBOTICS,
		ACCESS_ORDNANCE,
		ACCESS_ORDNANCE_STORAGE,
		)

	minimal_access = list(
		ACCESS_MECH_SCIENCE,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_RESEARCH,
		ACCESS_SCIENCE,
		ACCESS_XENOBIOLOGY,
		ACCESS_XENOBOTANY,
		)

	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_RD,
		ACCESS_CHANGE_IDS,
		)

	job = /datum/job/scientist/xenobiologist
