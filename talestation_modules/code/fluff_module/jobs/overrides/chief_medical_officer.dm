/*
* This file primarily changes the name of "chief medical officer" to "medical director"
*/

// Changes job title + alt
/datum/id_trim/job/chief_medical_officer
	assignment = "Medical Director"
	intern_alt_name = "Medical Director-in-Training"

// Changes office name
/area/station/command/heads_quarters/cmo
	name = "\improper Medical Director's Office"

// Changes telescreen name
/obj/machinery/computer/security/telescreen/cmo
	name = "\improper Medical Director's telescreen"

// Changes toy name
/obj/item/toy/figure/cmo
	name = "\improper Medical Director action figure"

// Changes encryption key name
/obj/item/encryptionkey/heads/cmo
	name = "\proper the medical director's encryption key"

// Changes headset name
/obj/item/radio/headset/heads/cmo
	name = "\proper the medical director's headset"

// Changes garment bag info
/obj/item/storage/bag/garment/chief_medical
	name = "medical director's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the medical director."

// Changes bed sheet info
/obj/item/bedsheet/cmo
	name = "medical director's bedsheet"
	dream_messages = list("authority", "a silvery ID", "healing", "life", "surgery", "a cat", "the medical director")

// Changes notice board name
/obj/structure/noticeboard/cmo
	name = "Medical Director's Notice Board"
	desc = "Important notices from the Medical Director."

// Changes locker name
/obj/structure/closet/secure_closet/chief_medical
	name = "\proper medical director's locker"

// Changes statue name
/obj/structure/statue/gold/cmo
	name = "statue of the medical director"

// Changes supply pack info
/datum/supply_pack/medical/cmoturtlenecks
	name = "Medical Director Turtlenecks"
	desc = "Contains the CMO's turtleneck and turtleneck skirt."

// Changes berte name
/obj/item/clothing/head/beret/medical/cmo
	name = "medical director beret"

// Changes outfit datum name
/datum/outfit/plasmaman/chief_medical_officer
	name = "Medical Director Plasmaman"

// Changes plasmaman outfit name
/obj/item/clothing/head/helmet/space/plasmaman/chief_medical_officer
	name = "medical director's plasma envirosuit helmet"
	desc = "A special containment helmet designed for the Medical Director. A gold stripe applied to differentiate them from other medical staff."

// Changes cloak name
/obj/item/clothing/neck/cloak/cmo
	name = "medical director's cloak"

// Changes labcoat name
/obj/item/clothing/suit/toggle/labcoat/cmo
	name = "medical director's labcoat"

// Changes wintercoat name
/obj/item/clothing/suit/hooded/wintercoat/medical/cmo
	name = "medical director's winter coat"

// Changes clothing info
/obj/item/clothing/under/rank/medical/chief_medical_officer
	desc = "It's a jumpsuit worn by those with the experience to be \"Medical Director\". It provides minor biological protection."

/obj/item/clothing/under/rank/medical/chief_medical_officer/skirt
	name = "medical director's jumpskirt"
	desc = "It's a jumpskirt worn by those with the experience to be \"Medical Director\". It provides minor biological protection."

/obj/item/clothing/under/rank/medical/chief_medical_officer/scrubs
	name = "medical director's scrubs"
	desc = "A distinctive set of white and turquoise scrubs given to medical directors who desire a clinical look."

/obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck
	name = "medical director's turtleneck"
	desc = "A light blue turtleneck and tan khakis, for a medical director with a superior sense of style."

/obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck/skirt
	name = "medical director's turtleneck skirt"
	desc = "A light blue turtleneck and tan khaki skirt, for a medical director with a superior sense of style."

/obj/item/clothing/under/plasmaman/chief_medical_officer
	name = "medical director's plasma envirosuit"
	desc = "It's an envirosuit worn by those with the experience to be \"Medical Director\"."

// Changes outfit datum names
/datum/outfit/job/cmo
	name = "Medical Director"

/datum/outfit/job/cmo/mod
	name = "Medical Director (MODsuit)"

// Changes PDA name
/obj/item/modular_computer/pda/heads/cmo
	name = "medical director PDA"

// Changes computer disk name
/obj/item/computer_disk/command/cmo
	name = "medical director data disk"

// Changes album name
/obj/item/storage/photo_album/cmo
	name = "photo album (Medical Director)"
