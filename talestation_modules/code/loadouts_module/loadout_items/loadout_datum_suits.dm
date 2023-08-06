// --- Loadout item datums for exosuits / suits ---

/// Exosuit / Outersuit Slot Items (Deletes overrided items)
/datum/loadout_category/outer_suit
	category_name = "Suit"
	ui_title = "Outer Suit Slot Items"

/datum/loadout_category/outer_suit/get_items()
	var/static/list/loadout_outer_suits = generate_loadout_items(/datum/loadout_item/suit/formal)
	return loadout_outer_suits

/datum/loadout_item/suit
	category = LOADOUT_ITEM_SUIT

/datum/loadout_item/suit/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	outfit.suit = item_path
	if(outfit.suit_store)
		LAZYADD(outfit.backpack_contents, outfit.suit_store)
		outfit.suit_store = null

/datum/loadout_item/suit/formal/parade_jacket_greyscale
	name = "Greyscale Parade Jacket"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/suit/greyscale_parade
	additional_tooltip_contents = list(TOOLTIP_NO_ARMOR)

/datum/loadout_item/suit/formal/suspenders_greyscale
	name = "Greyscale Suspenders"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/suit/toggle/suspenders/greyscale

/datum/loadout_item/suit/formal/winter_coat_greyscale
	name = "Greyscale Winter Coat"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/suit/hooded/wintercoat/custom

/datum/loadout_item/suit/formal/winter_coat
	name = "Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat

/datum/loadout_item/suit/formal/apron
	name = "Apron"
	item_path = /obj/item/clothing/suit/apron

/datum/loadout_item/suit/formal/purple_apron
	name = "Purple Apron"
	item_path = /obj/item/clothing/suit/apron/purple_bartender

/datum/loadout_item/suit/formal/leather_coat
	name = "Biker Coat"
	item_path = /obj/item/clothing/suit/jacket/leather/biker

/datum/loadout_item/suit/formal/bomber_jacket
	name = "Bomber Jacket"
	item_path = /obj/item/clothing/suit/jacket/bomber

/datum/loadout_item/suit/formal/denim_overalls
	name = "Denim Overalls"
	item_path = /obj/item/clothing/suit/apron/overalls

/datum/loadout_item/suit/formal/white_dress
	name = "White Dress"
	item_path = /obj/item/clothing/suit/costume/whitedress

/datum/loadout_item/suit/formal/goliath_cloak
	name = "Heirloom Goliath Cloak"
	item_path = /obj/item/clothing/suit/hooded/cloak/goliath_heirloom
	additional_tooltip_contents = list(TOOLTIP_NO_ARMOR)

/datum/loadout_item/suit/formal/wawaiian_shirt
	name = "Hawaiian Shirt"
	item_path = /obj/item/clothing/suit/costume/hawaiian

/datum/loadout_item/suit/formal/imperium_monk
	name = "Imperium Monk Outfit"
	item_path = /obj/item/clothing/suit/costume/imperium_monk

/datum/loadout_item/suit/formal/labcoat
	name = "Labcoat"
	item_path = /obj/item/clothing/suit/toggle/labcoat

/datum/loadout_item/suit/formal/labcoat_green
	name = "Green Labcoat"
	item_path = /obj/item/clothing/suit/toggle/labcoat/mad

/datum/loadout_item/suit/formal/leather_jacket
	name = "Leather Jacket"
	item_path = /obj/item/clothing/suit/jacket/leather

/datum/loadout_item/suit/formal/blue_letterman
	name = "Blue Letterman"
	item_path = /obj/item/clothing/suit/jacket/letterman_nanotrasen

/datum/loadout_item/suit/formal/brown_letterman
	name = "Brown Letterman"
	item_path = /obj/item/clothing/suit/jacket/letterman

/datum/loadout_item/suit/formal/red_letterman
	name = "Red Letterman"
	item_path = /obj/item/clothing/suit/jacket/letterman_red

/datum/loadout_item/suit/formal/military_jacket
	name = "Military Jacket"
	item_path = /obj/item/clothing/suit/jacket/miljacket

/datum/loadout_item/suit/formal/poncho
	name = "Poncho"
	item_path = /obj/item/clothing/suit/costume/poncho

/datum/loadout_item/suit/formal/holiday_priest
	name = "Holiday Priest Outfit"
	item_path = /obj/item/clothing/suit/chaplainsuit/holidaypriest

/datum/loadout_item/suit/formal/puffer_jacket
	name = "Puffer Jacket"
	item_path = /obj/item/clothing/suit/jacket/puffer

/datum/loadout_item/suit/formal/puffer_vest
	name = "Puffer Vest"
	item_path = /obj/item/clothing/suit/jacket/puffer/vest

/datum/loadout_item/suit/formal/poncho_green
	name = "Green Poncho"
	item_path = /obj/item/clothing/suit/costume/poncho/green

/datum/loadout_item/suit/formal/poncho_red
	name = "Red Poncho"
	item_path = /obj/item/clothing/suit/costume/poncho/red

/datum/loadout_item/suit/formal/white_robes
	name = "White Robes"
	item_path = /obj/item/clothing/suit/chaplainsuit/whiterobe

/datum/loadout_item/suit/formal/black_suit_jacket
	name = "Black Suit Jacket"
	item_path = /obj/item/clothing/suit/toggle/lawyer/black

/datum/loadout_item/suit/formal/blue_suit_jacket
	name = "Blue Suit Jacket"
	item_path = /obj/item/clothing/suit/toggle/lawyer

/datum/loadout_item/suit/formal/purple_suit_jacket
	name = "Purple Suit Jacket"
	item_path = /obj/item/clothing/suit/toggle/lawyer/purple

/datum/loadout_item/suit/formal/suspenders_red
	name = "Red Suspenders"
	item_path = /obj/item/clothing/suit/toggle/suspenders
