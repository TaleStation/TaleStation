/*
* This file primarily changes the name of "chief engineer" to "site foreman"
*/

// Changes job type
/obj/effect/landmark/start/chief_engineer
	name = "Site Foreman"

// Changes assingment name + alt title
/datum/id_trim/job/chief_engineer
	assignment = "Site Foreman"
	intern_alt_name = "Junior Foreman"

// Changes office name
/area/station/command/heads_quarters/ce
	name = "\improper Site Foreman's Office"

// Changes obj names
/datum/objective_item/steal/traitor/chief_engineer_belt
	name = "the site foreman's belt"

/datum/objective_item/steal/magboots
	name = "the site foreman's advanced magnetic boots"

// Changes telescreen names
/obj/machinery/computer/security/telescreen/ce
	name = "\improper Site Foreman's telescreen"

/obj/item/wallframe/telescreen/ce
	name = "\improper Site Foreman's telescreen frame"

/obj/item/wallframe/telescreen/cmo
	name = "\improper Site Foreman'stelescreen frame"

// Changes toy name
/obj/item/toy/figure/ce
	name = "\improper Site Foreman action figure"

// Changes encryption key name
/obj/item/encryptionkey/heads/ce
	name = "\proper the chief engineer's encryption key"

// Changes headset name
/obj/item/radio/headset/heads/ce
	name = "\proper the chief engineer's headset"

// Changes belt name
/obj/item/storage/belt/utility/chief
	name = "\improper Site Foreman's toolbelt"

// Changes garment bag name + desc
/obj/item/storage/bag/garment/engineering_chief
	name = "site foreman's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the site foreman."

// Changes bed sheet info
/obj/item/bedsheet/ce
	name = "site foreman's bedsheet"
	dream_messages = list("authority", "a silvery ID", "the engine", "power tools", "an APC", "a parrot", "the site foreman")

// Changes notice board info
/obj/structure/noticeboard/ce
	name = "Site Foreman's Notice Board"
	desc = "Important notices from the Site Foreman."

// Changes locker name
/obj/structure/closet/secure_closet/engineering_chief
	name = "\proper chief engineer's locker"

// Changes statue name
/obj/structure/statue/gold/ce
	name = "statue of the chief engineer"

// Changes envirogloves names
/obj/item/clothing/gloves/color/plasmaman/chief_engineer
	name = "chief engineer's envirogloves"

// Changes outfit datum name
/datum/outfit/plasmaman/chief_engineer
	name = "Site Foreman Plasmaman"

// Changes plasmaman outfit name
/obj/item/clothing/head/helmet/space/plasmaman/chief_engineer
	name = "chief engineer's plasma envirosuit helmet"
	desc = "A special containment helmet designed for the Site Foreman, the usual purple stripes being replaced by the chief's green. Has improved thermal shielding."

// Changes cloak name
/obj/item/clothing/neck/cloak/ce
	name = "chief engineer's cloak"

// Changes wintercoat name
/obj/item/clothing/suit/hooded/wintercoat/engineering/ce
	name = "chief engineer's winter coat"
	desc = "A white winter coat with reflective green and yellow stripes. \
	Stuffed with asbestos, treated with fire retardant PBDE, lined with a micro thin sheet of lead foil and snugly fitted to your body's measurements. \
	This baby's ready to save you from anything except the thyroid cancer and systemic fibrosis you'll get from wearing it. The zipper tab is a tiny golden wrench."

// Changes plasmaman suit name
/obj/item/clothing/under/plasmaman/chief_engineer
	name = "chief engineer's plasma envirosuit"
	desc = "An air-tight suit designed to be used by plasmamen insane enough to achieve the rank of \"Site Foreman\"."

// Changes outfit datum names
/datum/outfit/job/ce
	name = "Site Foreman"

/datum/outfit/job/ce/mod
	name = "Site Foreman (MODsuit)"

// Changes pdas name
/obj/item/modular_computer/pda/heads/ce
	name = "site foreman PDA"

// Changes data disk name
/obj/item/computer_disk/command/ce
	name = "site foreman data disk"

// Changes stamp name
/obj/item/stamp/ce
	name = "site foreman's rubber stamp"

// Changes album name
/obj/item/storage/photo_album/ce
	name = "photo album (Site Foreman)"
