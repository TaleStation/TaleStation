// Modular Overrides

/*
* Research Director
*/
/datum/id_trim/job/research_director
	trim_icon = 'talestation_modules/icons/jobs/card.dmi'
	sechud_icon = 'talestation_modules/icons/jobs/hud.dmi'

/*
* Scientist
*/
/datum/id_trim/job/scientist
	trim_icon = 'talestation_modules/icons/jobs/card.dmi'
	sechud_icon = 'talestation_modules/icons/jobs/hud.dmi'
	minimal_access = list(
		ACCESS_AUX_BASE,
		ACCESS_MECH_SCIENCE,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_ORDNANCE,
		ACCESS_ORDNANCE_STORAGE,
		ACCESS_RESEARCH,
		ACCESS_SCIENCE,
		ACCESS_TECH_STORAGE,
		)

// Unique Jobs

/*
* Asset Protection
*/
/datum/id_trim/job/asset_protection
	assignment = "Asset Protection"
	trim_icon = 'talestation_modules/icons/jobs/card.dmi'
	trim_state = "trim_assetprotection"
	sechud_icon = 'talestation_modules/icons/jobs/hud.dmi'
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

/*
* Bridge Officer
*/
/datum/id_trim/job/bridge_officer
	assignment = "Bridge Officer"
	trim_icon = 'talestation_modules/icons/jobs/card.dmi'
	trim_state = "trim_bridgeofficer"
	sechud_icon = 'talestation_modules/icons/jobs/hud.dmi'
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

/*
* Xenobiologist
*/
/datum/id_trim/job/xenobiologist
	assignment = "Xenobiologist"
	trim_icon = 'talestation_modules/icons/jobs/card.dmi'
	trim_state = "trim_xenobiologist"
	sechud_icon = 'talestation_modules/icons/jobs/hud.dmi'
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

/*
* Antag trim faction additions
*/
// -- Infiltrator Job Datum --
/datum/job/infiltrator
	title = ROLE_INFILTRATOR
	faction_alignment = JOB_SYNDICATE

// -- Syndicate job definitions. --
/datum/job/lavaland_syndicate
	faction_alignment = JOB_SYNDICATE

/datum/job/syndicate_cybersun
	faction_alignment = JOB_SYNDICATE

/datum/job/syndicate_cybersun_captain
	faction_alignment = JOB_SYNDICATE

/datum/job/space_syndicate
	faction_alignment = JOB_SYNDICATE

/datum/job/nuclear_operative
	faction_alignment = JOB_SYNDICATE

/datum/job/clown_operative
	faction_alignment = JOB_SYNDICATE
