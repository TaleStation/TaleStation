/datum/id_trim/job/asset_protection
	assignment = "Asset Protection"
	trim_icon = 'talestation_modules/icons/obj/card.dmi'
	trim_state = "trim_assetprotection"
	sechud_icon = 'talestation_modules/icons/mob/huds/hud.dmi'
	sechud_icon_state = "hudassetprotection"

	extra_access = list(
		ACCESS_ENGINEERING,
		ACCESS_SHIPPING,
		)
	minimal_access = list(
		ACCESS_BRIG,
		ACCESS_CARGO,
		ACCESS_CONSTRUCTION,
		ACCESS_COURT, ACCESS_EVA,
		ACCESS_EXTERNAL_AIRLOCKS,
		ACCESS_DETECTIVE,
		ACCESS_COMMAND,
		ACCESS_KEYCARD_AUTH,
		ACCESS_LAWYER,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MECH_SECURITY,
		ACCESS_MEDICAL,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_RC_ANNOUNCE,
		ACCESS_RESEARCH,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_SECURITY,
		ACCESS_WEAPONS,
		ACCESS_AP,
		)
	minimal_wildcard_access = list(
		ACCESS_ARMORY,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_HOS,
		ACCESS_CHANGE_IDS,
		)
	job = /datum/job/asset_protection
