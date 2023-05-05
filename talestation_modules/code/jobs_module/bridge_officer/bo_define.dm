// -- Bridge Officer job & outfit datum --
/datum/job/bridge_officer
	title = JOB_BRIDGE_OFFICER
	description = "File paperwork to Central Command via your fax machine. \
		Pretend to be a Head of Staff. Fetch coffee for the real Heads of Staff instead."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_COMMAND
	req_admin_notify = 1
	minimal_player_age = 10
	exp_requirements = 3000
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_COMMAND
	config_tag = "BRIDGE_OFFICER"
	is_unit_testable = FALSE

	outfit = /datum/outfit/job/bridge_officer
	plasmaman_outfit = /datum/outfit/plasmaman/head_of_personnel

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SRV
	bounty_types = CIV_JOB_RANDOM

	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_BRIDGE_OFFICER
	department_for_prefs = /datum/job_department/command
	departments_list = list(
		/datum/job_department/command,
		)

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)

	mail_goodies = list(
		/obj/item/food/donut/choco = 10,
		/obj/item/food/donut/apple = 10,
		/obj/item/reagent_containers/cup/glass/coffee = 10,
		/obj/item/food/donut/blumpkin = 5,
		/obj/item/food/donut/caramel = 5,
		/obj/item/food/donut/berry = 5,
		/obj/item/food/donut/matcha = 5,
		/obj/item/storage/fancy/cigarettes/cigars/havana = 5,
		/obj/item/clothing/mask/whistle = 5,
		/obj/item/reagent_containers/cup/glass/mug/tea = 5,
		/obj/item/reagent_containers/cup/glass/mug/coco = 1,
		/obj/item/storage/box/office_supplies = 1,
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	rpg_title = "Guildperson"

/datum/outfit/job/bridge_officer
	name = "Bridge Officer"
	jobtype = /datum/job/bridge_officer

	id = /obj/item/card/id/advanced/silver
	belt = /obj/item/modular_computer/pda/heads/bo
	ears = /obj/item/radio/headset/heads/bridge_officer
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/white
	uniform = /obj/item/clothing/under/rank/security/bridge_officer/black
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/beret/black/bridge_officer
	id_trim = /datum/id_trim/job/bridge_officer
	box = /obj/item/storage/box/survival

	backpack_contents = list(
		/obj/item/melee/baton/telescopic = 1,
		/obj/item/gun/energy/disabler = 1,
	)

/datum/outfit/job/bridge_officer/pre_equip(mob/living/carbon/human/H)
	..()
	// If the map we're on doesn't have a brige officer locker, add in a way to get one
	if(!(locate(/obj/effect/landmark/locker_spawner/bridge_officer_equipment) in GLOB.locker_landmarks))
		LAZYADD(backpack_contents, /obj/item/locker_spawner/bridge_officer)


	// 0.1% chance on spawn to be given a meme flash in place of a real one.
	if(r_pocket)
		if(prob(0.1))
			backpack_contents += /obj/item/assembly/flash/memorizer
		else
			backpack_contents += /obj/item/assembly/flash
	else
		if(prob(0.1))
			r_pocket = /obj/item/assembly/flash/memorizer
		else
			r_pocket = /obj/item/assembly/flash

// PDA
/obj/item/modular_computer/pda/heads/bo
	name = "bridge officer PDA"
	greyscale_config = /datum/greyscale_config/tablet/head
	greyscale_colors = "#99ccff#000099"

// Headset encryption key
/obj/item/encryptionkey/heads/hop/bridge_officer
	name = "\proper the bridge officer's encryption key"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_COMMAND = 1)

// Headsets
/obj/item/radio/headset/heads/bridge_officer
	name = "\proper the bridge officer's headset"
	desc = "The headset of the man or woman in charge of filing paperwork for the heads of staff."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/hop/bridge_officer

// Locker summoner
/obj/item/locker_spawner/bridge_officer
	name = "bridge officer equipment beacon"
	desc = "A beacon handed out for enterprising bridge officers being assigned to stations without proper \
		accommodations made for their occupation. When used, drop-pods in a fully stocked locker of equipment \
		for use when manning the bridge of Nanotrasen research stations."
	requires_job_path = /datum/job/bridge_officer
	spawned_locker_path = /obj/structure/closet/secure_closet/bridge_officer
	icon_state = "gangtool-blue"
