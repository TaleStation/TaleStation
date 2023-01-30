/datum/id_trim/job/bridge_officer
	assignment = "Bridge Officer"
	trim_icon = 'talestation_modules/icons/obj/card.dmi'
	trim_state = "trim_bridgeofficer"
	sechud_icon = 'talestation_modules/icons/mob/huds/hud.dmi'
	sechud_icon_state = "hudbridgeofficer"

	extra_access = list(
		ACCESS_RESEARCH,
		ACCESS_SCIENCE,
		)

	extra_wildcard_access = list(
		ACCESS_ARMORY
		)

	minimal_access = list(
		ACCESS_BRIG,
		ACCESS_CARGO,
		ACCESS_CONSTRUCTION,
		ACCESS_COURT,
		ACCESS_COMMAND,
		ACCESS_KEYCARD_AUTH,
		ACCESS_LAWYER,
		ACCESS_SHIPPING,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MEDICAL,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_RC_ANNOUNCE,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_SECURITY,
		ACCESS_WEAPONS,
		ACCESS_BO,
		)

	minimal_wildcard_access = list(
		ACCESS_VAULT,
		)

	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_HOP,
		ACCESS_CHANGE_IDS,
		)

	job = /datum/job/bridge_officer
