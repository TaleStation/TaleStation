/*
* This file primarily changes the name of "head of personnel" to "asset clerk"
*/

// Changes name for job datum
/datum/job/head_of_personnel
	title = JOB_ASSET_CLERK

// Changes trim name
/datum/id_trim/job/head_of_personnel
	assignment = "Asset Clerk"
	intern_alt_name = "A-T Trainee"

// Changes area name
/area/station/command/heads_quarters/hop
	name = "\improper Asset Clerk's Office"

// Changes toy name
/obj/item/toy/figure/hop
	name = "\improper Asset Clerk action figure"
	toysay = "Papers please."

// Changes encryption key name
/obj/item/encryptionkey/heads/hop
	name = "\proper the asset clerk's encryption key"

// Changes headset name
/obj/item/radio/headset/heads/hop
	name = "\proper the asset clerk's headset"

// Changes garment bag name
/obj/item/storage/bag/garment/hop
	name = "asset clerk's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the asset clerk."

// Changes medal box name
/obj/item/storage/lockbox/medal/hop
	name = "Asset Clerk medal box"

// Changes bedsheet name
/obj/item/bedsheet/hop
	name = "asset clerk's bedsheet"

// Changes notice board name
/obj/structure/noticeboard/hop
	name = "Asset Clerk's Notice Board"
	desc = "Important notices from the Asset Clerk."

// Changes locker name
/obj/structure/closet/secure_closet/hop
	name = "\proper asset clerk's locker"

// Changes statue name
/obj/structure/statue/gold/hop
	name = "statue of the asset clerk"

// Changes plasmaman gloves name
/obj/item/clothing/gloves/color/plasmaman/head_of_personnel
	name = "asset clerk's envirogloves"

// Changes hop hat name
/obj/item/clothing/head/hats/hopcap
	name = "asset clerk's cap"

// Changes plasmaman outfit name
/datum/outfit/plasmaman/head_of_personnel
	name = "Asset Clerk Plasmaman"

// Changes plasmaman envirosuit name
/obj/item/clothing/head/helmet/space/plasmaman/head_of_personnel
	name = "asset clerk's envirosuit helmet"
	desc = "A special containment helmet designed for the Asset Clerk. Embarrassingly enough, it looks way too much like the captain's design save for the red stripes."

// Changes hop armor name
/obj/item/clothing/suit/armor/vest/hop
	name = "asset clerk's coat"
	desc = "A stylish coat given to an Asset Clerk."

// Changes cloak name
/obj/item/clothing/neck/cloak/hop
	name = "asset clerk's cloak"
	desc = "Worn by the Asset Clerk. It smells faintly of bureaucracy."

// Changes wintercoat name
/obj/item/clothing/suit/hooded/wintercoat/hop
	name = "asset clerk's winter coat"

// Changes award name
/obj/item/clothing/accessory/medal/silver/excellence
	name = "\proper the asset clerk award for outstanding achievement in the field of excellence"

// Changes name for suit/jumpsuit/skirt
/obj/item/clothing/under/rank/civilian/head_of_personnel
	name = "asset clerk's uniform"
	desc = "A slick uniform worn by those to earn the position of \"Asset Clerk\"."

/obj/item/clothing/under/rank/civilian/head_of_personnel/skirt
	name = "asset clerk's skirt"
	desc = "A slick uniform and skirt combo worn by those to earn the position of \"Asset Clerk\"."

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit
	name = "asset clerk's suit"

/obj/item/clothing/under/plasmaman/head_of_personnel
	name = "asset clerk's plasma envirosuit"
	desc = "It's an envirosuit worn by someone who works in the position of \"Asset Clerk\"."

// Changes outfit datum name
/datum/outfit/job/hop
	name = "Asset Clerk"

// Changes psych supervisors
/datum/job/psychologist
	department_head =list(JOB_ASSET_CLERK)
	supervisors = "the Asset Clerk and the Medical Director"

// Changes pda name
/obj/item/modular_computer/pda/heads/hop
	name = "asset clerk PDA"

// Changes computer disk name
/obj/item/computer_disk/command/hop
	name = "asset clerk data disk"
	desc = "Removable disk used to download essential AC tablet apps."

// Change stamp name
// TODO: New stamp icon
/obj/item/stamp/hop
	name = "asset clerk's rubber stamp"

// Changes ticket machine desc
/obj/item/ticket_machine_ticket
	desc = "A ticket which shows your place in the Asset Clerk's line.\
	 Made from Nanotrasen patented NanoPaper®. Though solid, its form seems to shimmer slightly. Feels (and burns) just like the real thing."

// Change album name
/obj/item/storage/photo_album/hop
	name = "photo album (Asset Clerk)"

// Change desc
// Captain is changed here too
/obj/machinery/vending/games
	desc = "Vends things that the Site Director and Asset Clerk are probably not going to appreciate you fiddling with instead of your job..."
