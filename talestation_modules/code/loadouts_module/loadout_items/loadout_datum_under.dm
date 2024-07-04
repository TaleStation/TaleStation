// --- Loadout item datums for under suits ---

/// Underslot - Jumpsuit Items (Deletes overrided items)
/datum/loadout_category/undersuit
	category_name = "Jumpsuit"
	category_ui_icon = FA_ICON_SHIRT
	type_to_generate = /datum/loadout_item/under/jumpsuit
	tab_order = /datum/loadout_category/head::tab_order + 10

/datum/loadout_item/under
	abstract_type = /datum/loadout_item/under

/datum/loadout_item/under/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(isplasmaman(equipper))
		if(!visuals_only)
			to_chat(equipper, "Your loadout uniform was not equipped directly due to your envirosuit.")
			LAZYADD(outfit.backpack_contents, item_path)
	else
		outfit.uniform = item_path

// jumpsuit undersuits
/datum/loadout_item/under/jumpsuit
	abstract_type = /datum/loadout_item/under/jumpsuit

/datum/loadout_item/under/jumpsuit/greyscale
	name = "Greyscale Jumpsuit"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/under/color/greyscale

/datum/loadout_item/under/jumpsuit/greyscale_skirt
	name = "Greyscale Jumpskirt"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/under/color/jumpskirt/greyscale

/datum/loadout_item/under/jumpsuit/random
	name = "Random Jumpsuit"
	item_path = /obj/item/clothing/under/color/random

/datum/loadout_item/under/jumpsuit/random/on_equip_item(
	obj/item/clothing/accessory/equipped_item,
	datum/preferences/preference_source,
	list/preference_list,
	mob/living/carbon/human/equipper,
	visuals_only = FALSE
	)
	return

/datum/loadout_item/under/jumpsuit/random/skirt
	name = "Random Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/random

/datum/loadout_item/under/jumpsuit/black
	name = "Black Jumpsuit"
	item_path = /obj/item/clothing/under/color/black

/datum/loadout_item/under/jumpsuit/black_skirt
	name = "Black Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/black

/datum/loadout_item/under/jumpsuit/blue
	name = "Blue Jumpsuit"
	item_path = /obj/item/clothing/under/color/blue

/datum/loadout_item/under/jumpsuit/blue_skirt
	name = "Blue Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/blue

/datum/loadout_item/under/jumpsuit/brown
	name = "Brown Jumpsuit"
	item_path = /obj/item/clothing/under/color/brown

/datum/loadout_item/under/jumpsuit/brown_skirt
	name = "Brown Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/brown

/datum/loadout_item/under/jumpsuit/darkblue
	name = "Dark Blue Jumpsuit"
	item_path = /obj/item/clothing/under/color/darkblue

/datum/loadout_item/under/jumpsuit/darkblue_skirt
	name = "Dark Blue Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/darkblue

/datum/loadout_item/under/jumpsuit/darkgreen
	name = "Dark Green Jumpsuit"
	item_path = /obj/item/clothing/under/color/darkgreen

/datum/loadout_item/under/jumpsuit/darkgreen_skirt
	name = "Dark Green Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/darkgreen

/datum/loadout_item/under/jumpsuit/green
	name = "Green Jumpsuit"
	item_path = /obj/item/clothing/under/color/green

/datum/loadout_item/under/jumpsuit/green_skirt
	name = "Green Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/green

/datum/loadout_item/under/jumpsuit/grey
	name = "Grey Jumpsuit"
	item_path = /obj/item/clothing/under/color/grey

/datum/loadout_item/under/jumpsuit/grey_skirt
	name = "Grey Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/grey

/datum/loadout_item/under/jumpsuit/lightbrown
	name = "Light Brown Jumpsuit"
	item_path = /obj/item/clothing/under/color/lightbrown

/datum/loadout_item/under/jumpsuit/ightbrown_skirt
	name = "Light Brown Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/lightbrown

/datum/loadout_item/under/jumpsuit/lightpurple
	name = "Light Purple Jumpsuit"
	item_path = /obj/item/clothing/under/color/lightpurple

/datum/loadout_item/under/jumpsuit/lightpurple_skirt
	name = "Light Purple Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/lightpurple

/datum/loadout_item/under/jumpsuit/maroon
	name = "Maroon Jumpsuit"
	item_path = /obj/item/clothing/under/color/maroon

/datum/loadout_item/under/jumpsuit/maroon_skirt
	name = "Maroon Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/maroon

/datum/loadout_item/under/jumpsuit/irange
	name = "Orange Jumpsuit"
	item_path = /obj/item/clothing/under/color/orange

/datum/loadout_item/under/jumpsuit/orange_skirt
	name = "Orange Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/orange

/datum/loadout_item/under/jumpsuit/pin
	name = "Pink Jumpsuit"
	item_path = /obj/item/clothing/under/color/pink

/datum/loadout_item/under/jumpsuit/pink_skirt
	name = "Pink Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/pink

/datum/loadout_item/under/jumpsuit/rainbow
	name = "Rainbow Jumpsuit"
	item_path = /obj/item/clothing/under/color/rainbow

/datum/loadout_item/under/jumpsuit/rainbow_skirt
	name = "Rainbow Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/rainbow

/datum/loadout_item/under/jumpsuit/red
	name = "Red Jumpsuit"
	item_path = /obj/item/clothing/under/color/red

/datum/loadout_item/under/jumpsuit/red_skirt
	name = "Red Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/red

/datum/loadout_item/under/jumpsuit/teal
	name = "Teal Jumpsuit"
	item_path = /obj/item/clothing/under/color/teal

/datum/loadout_item/under/jumpsuit/teal_skirt
	name = "Teal Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/teal

/datum/loadout_item/under/jumpsuit/yellow
	name = "Yellow Jumpsuit"
	item_path = /obj/item/clothing/under/color/yellow

/datum/loadout_item/under/jumpsuit/yellow_skirt
	name = "Yellow Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/yellow

/datum/loadout_item/under/jumpsuit/white
	name = "White Jumpsuit"
	item_path = /obj/item/clothing/under/color/white

/datum/loadout_item/under/jumpsuit/white_skirt
	name = "White Jumpskirt"
	item_path = /obj/item/clothing/under/color/jumpskirt/white

