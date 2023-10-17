/*
* Asset Protection's Headsets
*/
/obj/item/radio/headset/heads/asset_protection
	name = "\proper the asset protection officer's headset"
	desc = "The headset of the man or woman in charge of assisting and protecting the heads of staff."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/asset_protection

// Bowmans alt
/obj/item/radio/headset/heads/asset_protection/alt
	name = "\proper the asset protection officer's bowman headset"
	desc = "The headset of the man or woman in charge of assisting and protecting the heads of staff. Protects ears from flashbangs."
	icon_state = "com_headset_alt"

/obj/item/radio/headset/heads/asset_protection/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/*
* Bridge Officer's Headset
*/
/obj/item/radio/headset/heads/bridge_officer
	name = "\proper the bridge officer's headset"
	desc = "The headset of the man or woman in charge of filing paperwork for the heads of staff."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/hop/bridge_officer
