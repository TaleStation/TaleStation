/*
* Loadout items that are primarily costumes in nature
*/
/datum/loadout_category/costumes
	category_name = "Costumes"
	category_ui_icon = FA_ICON_THEATER_MASKS
	type_to_generate = /datum/loadout_item/costume
	tab_order = /datum/loadout_category/head::tab_order + 8

/datum/loadout_item/costume
	abstract_type = /datum/loadout_item/costume

/datum/loadout_item/costume/changshan_red
	name = "Red Changshan"
	item_path = /obj/item/clothing/suit/costume/changshan_red

/datum/loadout_item/costume/changshan_blue
	name = "Blue Changshan"
	item_path = /obj/item/clothing/suit/costume/changshan_blue

/datum/loadout_item/costume/cheongsam_red
	name = "Red Cheongsam"
	item_path = /obj/item/clothing/suit/costume/cheongsam_red

/datum/loadout_item/costume/cheongsam_blue
	name = "Blue Cheongsam"
	item_path = /obj/item/clothing/suit/costume/cheongsam_blue

/datum/loadout_item/costume/bee
	name = "Bee Costume"
	item_path = /obj/item/clothing/suit/hooded/bee_costume

/datum/loadout_item/costume/carp_costume
	name = "Carp Costume"
	item_path = /obj/item/clothing/suit/hooded/carp_costume

/datum/loadout_item/costume/checkien_suit
	name = "Chicken Costume"
	item_path = /obj/item/clothing/suit/costume/chickensuit

/datum/loadout_item/costume/comedian_coat
	name = "Comedian Coat"
	item_path = /obj/item/clothing/suit/costume/joker

/datum/loadout_item/costume/corgi_costume
	name = "Corgi Costume"
	item_path = /obj/item/clothing/suit/hooded/ian_costume

/datum/loadout_item/costume/grass_skirt
	name = "Grass Skirt"
	item_path = /obj/item/clothing/suit/grasskirt

/datum/loadout_item/costume/griffin_wings
	name = "Griffin Wings"
	item_path = /obj/item/clothing/suit/toggle/owlwings/griffinwings

/datum/loadout_item/costume/owl_wings
	name = "Owl Wings"
	item_path = /obj/item/clothing/suit/toggle/owlwings

/datum/loadout_item/costume/plague_doctor
	name = "Plague Doctor Suit"
	item_path = /obj/item/clothing/suit/bio_suit/plaguedoctorsuit

/datum/loadout_item/costume/pirate_suit
	name = "Pirate Coat"
	item_path = /obj/item/clothing/suit/costume/pirate

/datum/loadout_item/costume/maiden_outfit
	name = "Shrine Maiden Outfit"
	item_path = /obj/item/clothing/suit/costume/shrine_maiden

/datum/loadout_item/costume/snowman_costume
	name = "Snowman Costume"
	item_path = /obj/item/clothing/suit/costume/snowman

/datum/loadout_item/costume/witch_robes
	name = "Witch Robes"
	item_path = /obj/item/clothing/suit/wizrobe/marisa/fake

/datum/loadout_item/costume/wizard_robes
	name = "Wizard Robes"
	item_path = /obj/item/clothing/suit/wizrobe/fake
