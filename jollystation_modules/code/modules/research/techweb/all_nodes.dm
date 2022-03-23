/// -- Modified pre-existing or new tech nodes. --
/// Adds illegal tech requirement to phazons.
/datum/techweb_node/phazon
	prereq_id_add = list("syndicate_basic")

/// Adds cybernetic cat ears to cybernetic organs.
/datum/techweb_node/cyber_organs
	id_additions = list(
		"cybernetic_cat_ears",
		)

//Xenobotany tech web
/datum/techweb_node/xeno_botany
	id = "xenobotany"
	display_name = "XenoBotany"
	description = "Team up with the botanist to unleash horrors beyond everyons creation."
	prereq_ids = list("botany")
	design_ids = list(
		"XenoBotany",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
