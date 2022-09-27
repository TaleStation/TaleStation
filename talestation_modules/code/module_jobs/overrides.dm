
// RD heirloom override
/datum/job/research_director/New()
	. = ..()
	family_heirlooms += list(
		/obj/item/book/manual/wiki/cytology,
		/obj/item/reagent_containers/cup/beaker/large,
	)

// Scientist heirloom override
/datum/job/scientist
	family_heirlooms = list(
		/obj/item/book/manual/wiki/cytology,
		/obj/item/reagent_containers/cup/beaker/large,
		/obj/item/toy/plush/slimeplushie,
		/obj/item/toy/nuke,
	)
