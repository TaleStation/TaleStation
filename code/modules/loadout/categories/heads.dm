/// Head Slot Items (Deletes overrided items)
/datum/loadout_category/head
	category_name = "Head"
	category_ui_icon = FA_ICON_HAT_COWBOY
	type_to_generate = /datum/loadout_item/head
	tab_order = 1

/datum/loadout_item/head
	abstract_type = /datum/loadout_item/head

/datum/loadout_item/head/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(equipper.dna?.species?.outfit_important_for_life)
		if(!visuals_only)
			to_chat(equipper, "Your loadout helmet was not equipped directly due to your species outfit.")
			LAZYADD(outfit.backpack_contents, item_path)
	else
		outfit.head = item_path

/datum/loadout_item/head/beanie
	name = "Beanie (Colorable)"
	item_path = /obj/item/clothing/head/beanie

/datum/loadout_item/head/fancy_cap
	name = "Fancy Hat (Colorable)"
	item_path = /obj/item/clothing/head/costume/fancy

/datum/loadout_item/head/red_beret
	name = "Red Beret (Colorable)"
	item_path = /obj/item/clothing/head/beret

/datum/loadout_item/head/delinquent_cap
	name = "Cap (Delinquent)"
	item_path = /obj/item/clothing/head/costume/delinquent

/datum/loadout_item/head/black_cap
	name = "Cap (Black)"
	item_path = /obj/item/clothing/head/soft/black

/datum/loadout_item/head/blue_cap
	name = "Cap (Blue)"
	item_path = /obj/item/clothing/head/soft/blue

/datum/loadout_item/head/green_cap
	name = "Cap (Green)"
	item_path = /obj/item/clothing/head/soft/green

/datum/loadout_item/head/grey_cap
	name = "Cap (Grey)"
	item_path = /obj/item/clothing/head/soft/grey

/datum/loadout_item/head/orange_cap
	name = "Cap (Orange)"
	item_path = /obj/item/clothing/head/soft/orange

/datum/loadout_item/head/purple_cap
	name = "Cap (Purple)"
	item_path = /obj/item/clothing/head/soft/purple

/datum/loadout_item/head/rainbow_cap
	name = "Cap (Rainbow)"
	item_path = /obj/item/clothing/head/soft/rainbow

/datum/loadout_item/head/red_cap
	name = "Cap (Red)"
	item_path = /obj/item/clothing/head/soft/red

/datum/loadout_item/head/white_cap
	name = "Cap (White)"
	item_path = /obj/item/clothing/head/soft

/datum/loadout_item/head/yellow_cap
	name = "Cap (Yellow)"
	item_path = /obj/item/clothing/head/soft/yellow

/datum/loadout_item/head/flatcap
	name = "Cap (Flat)"
	item_path = /obj/item/clothing/head/flatcap

/datum/loadout_item/head/beige_fedora
	name = "Fedora (Beige)"
	item_path = /obj/item/clothing/head/fedora/beige

/datum/loadout_item/head/black_fedora
	name = "Fedora (Black)"
	item_path = /obj/item/clothing/head/fedora

/datum/loadout_item/head/white_fedora
	name = "Fedora (White)"
	item_path = /obj/item/clothing/head/fedora/white

/datum/loadout_item/head/mail_cap
	name = "Cap (Mail)"
	item_path = /obj/item/clothing/head/costume/mailman

/datum/loadout_item/head/kitty_ears
	name = "Kitty Ears"
	item_path = /obj/item/clothing/head/costume/kitty

/datum/loadout_item/head/rabbit_ears
	name = "Rabbit Ears"
	item_path = /obj/item/clothing/head/costume/rabbitears

/datum/loadout_item/head/bandana
	name = "Bandana Thin"
	item_path = /obj/item/clothing/head/costume/tmc

/datum/loadout_item/head/rastafarian
	name = "Cap (Rastafarian)"
	item_path = /obj/item/clothing/head/rasta

/datum/loadout_item/head/top_hat
	name = "Top Hat"
	item_path = /obj/item/clothing/head/hats/tophat

/datum/loadout_item/head/bowler_hat
	name = "Bowler Hat"
	item_path = /obj/item/clothing/head/hats/bowler

/datum/loadout_item/head/bear_pelt
	name = "Bear Pelt"
	item_path = /obj/item/clothing/head/costume/bearpelt

/datum/loadout_item/head/ushanka
	name ="Ushanka"
	item_path = /obj/item/clothing/head/costume/ushanka

/datum/loadout_item/head/plague_doctor
	name = "Cap (Plague Doctor)"
	item_path = /obj/item/clothing/head/bio_hood/plague

/datum/loadout_item/head/rose
	name = "Rose"
	item_path = /obj/item/food/grown/rose

/datum/loadout_item/head/wig
	name = "Wig"
	item_path = /obj/item/clothing/head/wig/natural
	additional_displayed_text = list("Hair Color")

/datum/loadout_item/head/greyscale_beret
	name = "Greyscale Beret"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/head/beret/greyscale

/datum/loadout_item/head/greyscale_beret/badge
	name = "Greyscale Beret (with badge)"
	item_path = /obj/item/clothing/head/beret/greyscale_badge

/datum/loadout_item/head/chicken_suit_head
	name = "Chicken Suit Head"
	item_path = /obj/item/clothing/head/costume/chicken

/datum/loadout_item/head/cueball_hat
	name = "Cueball Hat"
	item_path = /obj/item/clothing/head/costume/cueball

/datum/loadout_item/head/deputy_hat
	name = "Deputy Hat"
	item_path = /obj/item/clothing/head/cowboy/red

/datum/loadout_item/head/desperado_hat
	name = "Desperado Hat"
	item_path = /obj/item/clothing/head/cowboy/black

/datum/loadout_item/head/jackbros_hat
	name = "Frosty Hat"
	item_path = /obj/item/clothing/head/costume/jackbros

/datum/loadout_item/head/geranium
	name = "Geranium"
	item_path = /obj/item/food/grown/poppy/geranium

/datum/loadout_item/head/dark_blue_hardhat
	name = "Dark Blue Hardhat"
	item_path = /obj/item/clothing/head/utility/hardhat/dblue

/datum/loadout_item/head/orange_hardhat
	name = "Orange Hardhat"
	item_path = /obj/item/clothing/head/utility/hardhat/orange

/datum/loadout_item/head/red_hardhat
	name = "Red Hardhat"
	item_path = /obj/item/clothing/head/utility/hardhat/red

/datum/loadout_item/head/white_hardhat
	name = "White Hardhat"
	item_path = /obj/item/clothing/head/utility/hardhat/white

/datum/loadout_item/head/yellow_hardhat
	name = "Yellow Hardhat"
	item_path = /obj/item/clothing/head/utility/hardhat

/datum/loadout_item/head/gladiator_helmet
	name = "Gladiator Helmet"
	item_path = /obj/item/clothing/head/helmet/gladiator/loadout

/datum/loadout_item/head/harebell
	name = "Harebell"
	item_path = /obj/item/food/grown/harebell

/datum/loadout_item/head/jester_hat
	name = "Jester Hat"
	item_path = /obj/item/clothing/head/costume/jester

/datum/loadout_item/head/lily
	name = "Lily"
	item_path = /obj/item/food/grown/poppy/lily

/datum/loadout_item/head/nurse_hat
	name = "Nurse Hat"
	item_path = /obj/item/clothing/head/costume/nursehat

/datum/loadout_item/head/maid_headband
	name = "Maid Headband"
	item_path = /obj/item/clothing/head/costume/maidheadband

/datum/loadout_item/head/bandana
	name = "Pirate Bandana"
	item_path = /obj/item/clothing/head/costume/pirate/bandana

/datum/loadout_item/head/pirate_hat
	name = "Pirate Hat"
	item_path = /obj/item/clothing/head/costume/pirate

/datum/loadout_item/head/poppy
	name = "Poppy"
	item_path = /obj/item/food/grown/poppy

/datum/loadout_item/head/rainbow_bunch
	name = "Rainbow Bunch"
	item_path = /obj/item/food/grown/rainbow_flower

/datum/loadout_item/head/sherrif_hat
	name = "Sheriff Hat"
	item_path = /obj/item/clothing/head/cowboy/brown

/datum/loadout_item/head/maiden_wig
	name = "Shrine Madien Wig"
	item_path = /obj/item/clothing/head/costume/shrine_wig

/datum/loadout_item/head/sombrero_green
	name = "Sombrero"
	item_path = /obj/item/clothing/head/costume/sombrero/green

/datum/loadout_item/head/snowman_hat
	name = "Snowman Head Piece"
	item_path = /obj/item/clothing/head/costume/snowman

/datum/loadout_item/head/sunflower
	name = "Sunflower"
	item_path = /obj/item/food/grown/sunflower

/datum/loadout_item/head/wedding_veil
	name = "Wedding Veil"
	item_path = /obj/item/clothing/head/costume/weddingveil

/datum/loadout_item/head/wig
	name = "Wig"
	item_path = /obj/item/clothing/head/wig/random

/datum/loadout_item/head/marisa_hat
	name = "Witch Hat"
	item_path = /obj/item/clothing/head/wizard/marisa/fake

/datum/loadout_item/head/witch_hat_wig
	name = "Witch Hat with Wig"
	item_path = /obj/item/clothing/head/costume/witchwig

/datum/loadout_item/head/wizard_hat
	name = "Wizard Hat"
	item_path = /obj/item/clothing/head/wizard/fake
