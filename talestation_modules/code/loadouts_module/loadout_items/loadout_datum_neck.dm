// --- Loadout item datums for neck items ---

/// Neck Slot Items (Deletes overrided items)
/datum/loadout_category/neck
	category_name = "Neck"
	ui_title = "Neck Slot Items"

/datum/loadout_category/neck/get_items()
	var/static/list/loadout_neck = generate_loadout_items(/datum/loadout_item/neck)
	return loadout_neck

/datum/loadout_item/neck
	category = LOADOUT_ITEM_NECK

/datum/loadout_item/neck/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	outfit.neck = item_path

/datum/loadout_item/neck/necktie_tied
	name = "Tied Greyscale Necktie"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/neck/tie/tied
	additional_tooltip_contents = list("This tie is TIED and GREYSCALED.")

/datum/loadout_item/neck/necktie_untied
	name = "Untied Greyscale Necktie"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/neck/tie
	additional_tooltip_contents = list("This tie is UNITED and GREYSCALED.")

/datum/loadout_item/neck/scraf_colorable
	name = "Greyscale Scarf"
	item_path = /obj/item/clothing/neck/scarf
	can_be_greyscale = TRUE
	additional_tooltip_contents = list(TOOLTIP_GREYSCALE)

/datum/loadout_item/neck/necktie_black_tied
	name = "Tied Black Necktie"
	item_path = /obj/item/clothing/neck/tie/black/tied
	additional_tooltip_contents = list(TOOLTIP_TIED)

/datum/loadout_item/neck/necktie_blue_tied
	name = "Tied Blue Necktie"
	item_path = /obj/item/clothing/neck/tie/blue/tied
	additional_tooltip_contents = list(TOOLTIP_TIED)

/datum/loadout_item/neck/necktie_red_tied
	name = "Tied Red Necktie"
	item_path = /obj/item/clothing/neck/tie/red/tied
	additional_tooltip_contents = list(TOOLTIP_TIED)

/datum/loadout_item/neck/necktie_black_united
	name = "Untied Black Necktie"
	item_path = /obj/item/clothing/neck/tie/black
	additional_tooltip_contents = list(TOOLTIP_UNTIED)

/datum/loadout_item/neck/necktie_blue_united
	name = "Untied Blue Necktie"
	item_path = /obj/item/clothing/neck/tie/blue
	additional_tooltip_contents = list(TOOLTIP_UNTIED)

/datum/loadout_item/neck/necktie_red_united
	name = "Untied Red Necktie"
	item_path = /obj/item/clothing/neck/tie/red
	additional_tooltip_contents = list(TOOLTIP_UNTIED)

/datum/loadout_item/neck/necktie_det
	name = "Detective Necktie"
	item_path = /obj/item/clothing/neck/tie/detective

/datum/loadout_item/neck/necktie_disco
	name = "Horrific Necktie"
	item_path = /obj/item/clothing/neck/tie/horrible

/datum/loadout_item/neck/maid_neck_cover
	name = "Maid Neck Cover"
	item_path = /obj/item/clothing/neck/maid

/datum/loadout_item/neck/scarf_black
	name = "Black Scarf"
	item_path = /obj/item/clothing/neck/scarf/black

/datum/loadout_item/neck/scarf_cyan
	name = "Cyan Scarf"
	item_path = /obj/item/clothing/neck/scarf/cyan

/datum/loadout_item/neck/scarf_dark_blue
	name = "Darkblue Scarf"
	item_path = /obj/item/clothing/neck/scarf/darkblue

/datum/loadout_item/neck/scarf_green
	name = "Green Scarf"
	item_path = /obj/item/clothing/neck/scarf/green

/datum/loadout_item/neck/scarf_orange
	name = "Orange Scarf"
	item_path = /obj/item/clothing/neck/scarf/orange

/datum/loadout_item/neck/scarf_pink
	name = "Pink Scarf"
	item_path = /obj/item/clothing/neck/scarf/pink

/datum/loadout_item/neck/scarf_purple
	name = "Purple Scarf"
	item_path = /obj/item/clothing/neck/scarf/purple

/datum/loadout_item/neck/scarf_red
	name = "Red Scarf"
	item_path = /obj/item/clothing/neck/scarf/red

/datum/loadout_item/neck/scarf_yellow
	name = "Yellow Scarf"
	item_path = /obj/item/clothing/neck/scarf/yellow

/datum/loadout_item/neck/scarf_christmas
	name = "Christmas Scarf"
	item_path = /obj/item/clothing/neck/scarf/christmas

/datum/loadout_item/neck/scarf_zebra
	name = "Zebra Scarf"
	item_path = /obj/item/clothing/neck/scarf/zebra

/datum/loadout_item/neck/scarf_blue_striped
	name = "Striped Blue Scarf"
	item_path = /obj/item/clothing/neck/large_scarf/blue

/datum/loadout_item/neck/scarf_green_striped
	name = "Striped Green Scarf"
	item_path = /obj/item/clothing/neck/large_scarf/green

/datum/loadout_item/neck/scarf_red_striped
	name = "Striped Red Scarf"
	item_path = /obj/item/clothing/neck/large_scarf/red

/datum/loadout_item/neck/stethoscope
	name = "Stethoscope"
	item_path = /obj/item/clothing/neck/stethoscope
