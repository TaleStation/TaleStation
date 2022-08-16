// -- Ordnance Tech job & outfit datum --
/datum/job/scientist/ordnance_tech
	title = JOB_ORDNANCE_TECH
	description = "Complete your bomb in the first half hour of the \
		shift, make the station shake repeatedly as you refine cores, \
		then sit around as you have nothing else to do."
	total_positions = 1
	spawn_positions = 3
	//most likely can be subtyped later //too late

	outfit = /datum/outfit/job/scientist/ordnance_tech
	plasmaman_outfit = /datum/outfit/plasmaman/science

	display_order = JOB_DISPLAY_ORDER_ORDNANCE_TECH
	mail_goodies = list(
		/obj/item/analyzer = 50,
		/obj/item/raw_anomaly_core/random = 15,
		/obj/item/hot_potato/harmless/toy = 10,
		/obj/item/tank/internals/plasma = 5,
		/obj/item/tank/internals/oxygen = 5,
		/obj/item/toy/nuke = 5,
		/obj/item/transfer_valve = 1,
	)

	rpg_title = "Dwarven Miner"

/datum/outfit/job/scientist/ordnance_tech
	name = "Ordnance Technician"
	suit = /obj/item/clothing/suit/toggle/labcoat/toxic
	uniform = /obj/item/clothing/under/rank/rnd/ordnance_tech
	belt = /obj/item/modular_computer/tablet/pda/science/ordnance_tech
	jobtype = /datum/job/scientist/ordnance_tech
	id_trim = /datum/id_trim/job/ordnance_tech
