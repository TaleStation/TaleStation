// -- Asset Protection job & outfit datum --
/datum/job/asset_protection
	title = JOB_ASSET_PROTECTION
	description = "Protect Heads of Staff and the Captain \
		from foreign threats and themselves. Exert authority over the Bridge Officer."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_COMMAND
	req_admin_notify = TRUE
	minimal_player_age = 10
	exp_requirements = 3000
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_COMMAND
	config_tag = "ASSET_PROTECTION"
	is_unit_testable = FALSE

	outfit = /datum/outfit/job/asset_protection
	plasmaman_outfit = /datum/outfit/plasmaman/head_of_security

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	bounty_types = CIV_JOB_SEC

	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_ASSET_PROTECTION
	department_for_prefs = /datum/job_department/command
	departments_list = list(
		/datum/job_department/command,
		)

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)

	mail_goodies = list(
		/obj/item/food/donut/choco = 10,
		/obj/item/food/donut/apple = 10,
		/obj/item/food/donut/blumpkin = 5,
		/obj/item/food/donut/caramel = 5,
		/obj/item/food/donut/berry = 5,
		/obj/item/food/donut/matcha = 5,
		/obj/item/storage/fancy/donut_box = 1,
		/obj/item/melee/baton/security/boomerang/loaded = 1,
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	voice_of_god_power = 1.2 // Not quite command staff.
	rpg_title = "Paladin"

/datum/outfit/job/asset_protection
	name = "Asset Protection"
	jobtype = /datum/job/asset_protection

	id = /obj/item/card/id/advanced/silver
	belt = /obj/item/modular_computer/pda/heads/ap
	ears = /obj/item/radio/headset/heads/asset_protection/alt
	glasses = /obj/item/clothing/glasses/sunglasses
	neck = /obj/item/clothing/neck/tie/black/tied
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt/asset_protection
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest/asset_protection
	suit_store = /obj/item/gun/energy/disabler
	id_trim = /datum/id_trim/job/asset_protection
	box = /obj/item/storage/box/survival/security

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/asset_protection/pre_equip(mob/living/carbon/human/H)
	..()
	// If the map we're on doesn't have a ap locker, add in a way to get one
	if(!(locate(/obj/effect/landmark/locker_spawner/asset_protection_equipment) in GLOB.locker_landmarks))
		LAZYADD(backpack_contents, /obj/item/locker_spawner/asset_protection)

// PDA
/obj/item/modular_computer/pda/heads/ap
	name = "asset protections PDA"
	greyscale_config = /datum/greyscale_config/tablet/head
	greyscale_colors = "#d91a40#3F1514"

// Headset encryption key
/obj/item/encryptionkey/heads/hos/asset_protection
	name = "\proper the asset protection's encryption key"
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_COMMAND = 1)

// Headsets
/obj/item/radio/headset/heads/asset_protection
	name = "\proper the asset protection officer's headset"
	desc = "The headset of the man or woman in charge of assisting and protecting the heads of staff."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/hos/asset_protection

// Asset Protection's bowman
/obj/item/radio/headset/heads/asset_protection/alt
	name = "\proper the asset protection officer's bowman headset"
	desc = "The headset of the man or woman in charge of assisting and protecting the heads of staff. Protects ears from flashbangs."
	icon_state = "com_headset_alt"

/obj/item/radio/headset/heads/asset_protection/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

// Locker summoner
/obj/item/locker_spawner/asset_protection
	name = "asset protection equipment beacon"
	desc = "A beacon handed out for stalwart asset protection officers being assigned to stations without proper \
		accommodations made for their occupation. When used, drop-pods in a fully stocked locker of equipment \
		for use when protecting the command staff of Nanotrasen research stations."
	requires_job_path = /datum/job/asset_protection
	spawned_locker_path = /obj/structure/closet/secure_closet/asset_protection
	icon_state = "gangtool-blue"
