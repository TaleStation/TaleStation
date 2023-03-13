// --- Loadout item datums for heads ---

/// Head Slot Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_helmets, generate_loadout_items(/datum/loadout_item/head))

/datum/loadout_item/head
	category = LOADOUT_ITEM_HEAD

/datum/loadout_item/head/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(isplasmaman(equipper))
		if(!visuals_only)
			to_chat(equipper, "Your loadout helmet was not equipped directly due to your envirosuit helmet.")
			LAZYADD(outfit.backpack_contents, item_path)
	else
		outfit.head = item_path

/datum/loadout_item/head/greyscale_beret
	name = "Greyscale Beret"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/head/beret/greyscale

/datum/loadout_item/head/greyscale_beret2
	name = "Greyscale Beret2"
	can_be_greyscale = TRUE
	item_path = /obj/item/clothing/head/beret/greyscale

/datum/loadout_item/head/greyscale_beret/badge
	name = "Greyscale Beret (with badge)"
	item_path = /obj/item/clothing/head/beret/greyscale_badge

/datum/loadout_item/head/bear_pelt
	name = "Bear Pelt"
	item_path = /obj/item/clothing/head/costume/bearpelt

/datum/loadout_item/head/bowler_hat
	name = "Bowler Hat"
	item_path = /obj/item/clothing/head/hats/bowler

/datum/loadout_item/head/black_beanie
	name = "Black Beanie"
	item_path = /obj/item/clothing/head/beanie/black

/datum/loadout_item/head/dark_blue_beanie
	name = "Dark Blue Beanie"
	item_path = /obj/item/clothing/head/beanie/darkblue

/datum/loadout_item/head/orange_beanie
	name = "Orange Beanie"
	item_path = /obj/item/clothing/head/beanie/orange

/datum/loadout_item/head/red_beanie
	name = "Red Beanie"
	item_path = /obj/item/clothing/head/beanie/red

/datum/loadout_item/head/white_beanie
	name = "White Beanie"
	item_path = /obj/item/clothing/head/beanie

/datum/loadout_item/head/yellow_beanie
	name = "Yellow Beanie"
	item_path = /obj/item/clothing/head/beanie/yellow

/datum/loadout_item/head/christmas_beanie
	name = "Christmas Beanie"
	item_path = /obj/item/clothing/head/beanie/christmas

/datum/loadout_item/head/black_beret
	name = "Black Beret"
	item_path = /obj/item/clothing/head/beret/black

/datum/loadout_item/head/red_beret
	name = "Red Beret"
	item_path = /obj/item/clothing/head/beret

/datum/loadout_item/head/black_cap
	name = "Black Cap"
	item_path = /obj/item/clothing/head/soft/black

/datum/loadout_item/head/blue_cap
	name = "Blue Cap"
	item_path = /obj/item/clothing/head/soft/blue

/datum/loadout_item/head/green_cap
	name = "Green Cap"
	item_path = /obj/item/clothing/head/soft/green

/datum/loadout_item/head/grey_cap
	name = "Grey Cap"
	item_path = /obj/item/clothing/head/soft/grey

/datum/loadout_item/head/orange_cap
	name = "Orange Cap"
	item_path = /obj/item/clothing/head/soft/orange

/datum/loadout_item/head/purple_cap
	name = "Purple Cap"
	item_path = /obj/item/clothing/head/soft/purple

/datum/loadout_item/head/red_cap
	name = "Red Cap"
	item_path = /obj/item/clothing/head/soft/red

/datum/loadout_item/head/white_cap
	name = "White Cap"
	item_path = /obj/item/clothing/head/soft

/datum/loadout_item/head/yellow_cap
	name = "Yellow Cap"
	item_path = /obj/item/clothing/head/soft/yellow

/datum/loadout_item/head/rainbow_cap
	name = "Rainbow Cap"
	item_path = /obj/item/clothing/head/soft/rainbow

/datum/loadout_item/head/delinquent_cap
	name = "Delinquent Cap"
	item_path = /obj/item/clothing/head/costume/delinquent

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

/datum/loadout_item/head/flatcap
	name = "Flat Cap"
	item_path = /obj/item/clothing/head/flatcap

/datum/loadout_item/head/jackbros_hat
	name = "Frosty Hat"
	item_path = /obj/item/clothing/head/costume/jackbros

/datum/loadout_item/head/beige_fedora
	name = "Beige Fedora"
	item_path = /obj/item/clothing/head/fedora/beige

/datum/loadout_item/head/black_fedora
	name = "Black Fedora"
	item_path = /obj/item/clothing/head/fedora

/datum/loadout_item/head/white_fedora
	name = "White Fedora"
	item_path = /obj/item/clothing/head/fedora/white

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

/datum/loadout_item/head/kitty_ears
	name = "Kitty Ears"
	item_path = /obj/item/clothing/head/costume/kitty

/datum/loadout_item/head/lily
	name = "Lily"
	item_path = /obj/item/food/grown/poppy/lily

/datum/loadout_item/head/mail_cap
	name = "Mail Cap"
	item_path = /obj/item/clothing/head/costume/mailman

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

/datum/loadout_item/head/plague_doctor
	name = "Plague Doctor Hood"
	item_path = /obj/item/clothing/head/bio_hood/plague

/datum/loadout_item/head/rabbit_ears
	name = "Rabbit Ears"
	item_path = /obj/item/clothing/head/costume/rabbitears

/datum/loadout_item/head/rastafarian
	name = "Rastafarian Cap"
	item_path = /obj/item/clothing/head/rasta

/datum/loadout_item/head/rose
	name = "Rose"
	item_path = /obj/item/food/grown/rose

/datum/loadout_item/head/rainbow_bunch
	name = "Rainbow Bunch"
	item_path = /obj/item/food/grown/rainbow_flower
	additional_tooltip_contents = list(TOOLTIP_RANDOM_COLOR)

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

/datum/loadout_item/head/top_hat
	name = "Top Hat"
	item_path = /obj/item/clothing/head/hats/tophat

/datum/loadout_item/head/ushanka
	name ="Ushanka"
	item_path = /obj/item/clothing/head/costume/ushanka

/datum/loadout_item/head/wedding_veil
	name = "Wedding Veil"
	item_path = /obj/item/clothing/head/costume/weddingveil

/datum/loadout_item/head/wig
	name = "Wig"
	item_path = /obj/item/clothing/head/wig/random
	additional_tooltip_contents = list("This wig is randomized when you get it. Stylize it to your hearts content!")

/datum/loadout_item/head/marisa_hat
	name = "Witch Hat"
	item_path = /obj/item/clothing/head/wizard/marisa/fake

/datum/loadout_item/head/witch_hat_wig
	name = "Witch Hat with Wig"
	item_path = /obj/item/clothing/head/costume/witchwig

/datum/loadout_item/head/wizard_hat
	name = "Wizard Hat"
	item_path = /obj/item/clothing/head/wizard/fake
