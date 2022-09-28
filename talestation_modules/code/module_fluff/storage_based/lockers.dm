
// XenoBotany locker
/obj/structure/closet/secure_closet/xeno_botany
	name = "xeno botany equipment locker"
	icon_state = "science"
	req_access = list(ACCESS_XENOBOTANY, ACCESS_XENOBIOLOGY)

/obj/structure/closet/secure_closet/xeno_botany/PopulateContents()
	. = ..()
	new /obj/item/xeno_analyzer(src)
	new /obj/item/circuitboard/machine/hydroponics/xeno(src)
	new /obj/item/circuitboard/machine/seed_extractor/xeno(src)
	new /obj/item/storage/bag/plants/xenobotany(src)
	new /obj/item/storage/box/seed_box(src)

// The actual Bridge Officer's locker of equipment
/obj/structure/closet/secure_closet/bridge_officer
	name = "\proper bridge officer's locker"
	req_access = list(ACCESS_BO)
	icon = 'talestation_modules/icons/obj/locker.dmi'
	icon_state = "bo"

/obj/structure/closet/secure_closet/bridge_officer/PopulateContents()
	new /obj/item/storage/bag/garment/bridge_officer(src)
	new /obj/item/radio/headset/heads/bridge_officer(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/storage/photo_album/bo(src)
	new /obj/item/storage/box/office_supplies(src)
	new /obj/item/taperecorder(src)
	new /obj/item/tape(src)
	new /obj/item/tape(src)
	new /obj/item/circuitboard/machine/fax_machine(src)
	new /obj/item/stack/sheet/mineral/silver(src, 3)
	new /obj/item/stamp/js/bo(src)

// The actual Asset Protection's locker of equipment
/obj/structure/closet/secure_closet/asset_protection
	name = "\proper asset protection's locker"
	req_access = list(ACCESS_AP)
	icon = 'talestation_modules/icons/obj/locker.dmi'
	icon_state = "ap"

/obj/structure/closet/secure_closet/asset_protection/PopulateContents()
	new /obj/item/storage/bag/garment/asset_protection(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/radio/headset/heads/asset_protection(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/storage/photo_album/ap(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/storage/box/dept_armbands(src)
	new /obj/item/gun/energy/e_gun(src)
	new /obj/item/stamp/js/ap(src)
