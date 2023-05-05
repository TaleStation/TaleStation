// -- Xenobiologist job & outfit datum --
/datum/job/scientist/xenobiologist
	title = JOB_XENOBIOLOGIST
	description = "Feed slimes all shift, never exit xenobiology for any reason. \
		Leave after two hours as an unkillable god with an army of monsters."
	total_positions = 2
	spawn_positions = 3
	config_tag = "XENOBIOLOGIST"
	is_unit_testable = FALSE

	outfit = /datum/outfit/job/scientist/xenobiologist
	plasmaman_outfit = /datum/outfit/plasmaman/science

	display_order = JOB_DISPLAY_ORDER_XENOBIOLOGIST

	mail_goodies = list(
		/obj/item/toy/plush/slimeplushie = 25,
		/obj/item/reagent_containers/cup/beaker/bluespace = 20,
		/obj/item/slimepotion/slime/sentience = 15,
		/obj/item/slimepotion/slime/docility = 15,
		/obj/item/slimepotion/slime/steroid = 10,
		/obj/item/slime_extract/yellow = 10,
		/obj/item/slime_extract/darkblue = 10,
		/obj/item/reagent_containers/syringe/bluespace = 5,
		/obj/item/slime_extract/green = 5,
		/obj/item/slime_extract/bluespace = 1,
		/obj/item/slime_extract/adamantine = 1,
		/obj/item/slime_extract/oil = 1
	)

	rpg_title = "Slime Rancher"

/datum/outfit/job/scientist/xenobiologist
	name = "Xenobiologist"
	suit = /obj/item/clothing/suit/toggle/labcoat/xenobio
	uniform = /obj/item/clothing/under/rank/rnd/xenobiologist
	belt = /obj/item/modular_computer/pda/science/xenobiologist
	jobtype = /datum/job/scientist/xenobiologist
	id_trim = /datum/id_trim/job/xenobiologist

/datum/outfit/job/scientist/xenobiologist/pre_equip(mob/living/carbon/human/H)
	..()
	// If the map we're on doesn't have a xenobotany locker, add in a way to get one
	if(!(locate(/obj/effect/landmark/locker_spawner/xenobotany_equipment) in GLOB.locker_landmarks))
		LAZYADD(backpack_contents, /obj/item/locker_spawner/xenobotany)

// PDA
/obj/item/modular_computer/pda/science/xenobiologist
	name = "xenobiologist PDA"
	greyscale_colors = "#e2e2e2#000099#6eaec8"

// Locker summoner
/obj/item/locker_spawner/xenobotany
	name = "xenobotany equipment beacon"
	desc = "A beacon handed out for upcoming xenobiologists being assigned to stations without proper \
		accommodations made for their occupation. When used, drop-pods in a fully stocked locker of equipment \
		for use when you want to overrun the station with kuduz, the botanist way."
	requires_job_path = /datum/job/scientist
	spawned_locker_path = /obj/structure/closet/secure_closet/xeno_botany
	icon_state = "gangtool-purple"
