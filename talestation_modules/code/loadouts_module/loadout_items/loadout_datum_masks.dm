// --- Loadout item datums for masks ---

/// Mask Slot Items (Deletes overrided items)
/datum/loadout_category/mask
	category_name = "Mask"
	// category_ui_icon =
	type_to_generate = /datum/loadout_item/mask
	tab_order = /datum/loadout_category/head::tab_order + 3

/datum/loadout_item/mask
	abstract_type = /datum/loadout_item/mask

/datum/loadout_item/mask/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(isplasmaman(equipper))
		if(!visuals_only)
			to_chat(equipper, "Your loadout mask was not equipped directly due to your envirosuit mask.")
			LAZYADD(outfit.backpack_contents, item_path)
	else
		outfit.mask = item_path

/datum/loadout_item/mask/balaclava
	name = "Balaclava"
	item_path = /obj/item/clothing/mask/balaclava

/datum/loadout_item/mask/black_bandana
	name = "Black Bandana"
	item_path = /obj/item/clothing/mask/bandana/black

/datum/loadout_item/mask/blue_bandana
	name = "Blue Bandana"
	item_path = /obj/item/clothing/mask/bandana/blue

/datum/loadout_item/mask/gold_bandana
	name = "Gold Bandana"
	item_path = /obj/item/clothing/mask/bandana/gold

/datum/loadout_item/mask/green_bandana
	name = "Green Bandana"
	item_path = /obj/item/clothing/mask/bandana/green

/datum/loadout_item/mask/red_bandana
	name = "Red Bandana"
	item_path = /obj/item/clothing/mask/bandana/red

/datum/loadout_item/mask/skull_bandana
	name = "Skull Bandana"
	item_path = /obj/item/clothing/mask/bandana/skull/black

/datum/loadout_item/mask/bubblegum
	name = "Bubblegum"
	item_path = /obj/item/food/bubblegum

/datum/loadout_item/mask/bat_mask
	name = "Bat Mask"
	item_path = /obj/item/clothing/mask/animal/small/bat

/datum/loadout_item/mask/bee_mask
	name = "Bee Mask"
	item_path = /obj/item/clothing/mask/animal/small/bee

/datum/loadout_item/mask/bear_mask
	name = "Bear Mask"
	item_path = /obj/item/clothing/mask/animal/small/bear

/datum/loadout_item/mask/cow_mask
	name = "Cow Mask"
	item_path = /obj/item/clothing/mask/animal/cowmask

/datum/loadout_item/mask/cyborg_visor
	name = "Cyborg Visor"
	item_path = /obj/item/clothing/mask/gas/cyborg

/datum/loadout_item/mask/surgical_mask
	name = "Face Mask"
	item_path = /obj/item/clothing/mask/surgical

/datum/loadout_item/mask/fox_mask
	name = "Fox Mask"
	item_path = /obj/item/clothing/mask/animal/small/fox

/datum/loadout_item/mask/frog_mask
	name = "Frog Mask"
	item_path = /obj/item/clothing/mask/animal/frog

/datum/loadout_item/mask/gas_mask
	name = "Gas Mask"
	item_path = /obj/item/clothing/mask/gas

/datum/loadout_item/mask/prop_atmos_mask
	name = "Prop Atmospheric Gas Mask"
	item_path = /obj/item/clothing/mask/gas/atmosprop

/datum/loadout_item/mask/prop_gas_mask
	name = "Prop Gas Mask"
	item_path = /obj/item/clothing/mask/gas/prop

/datum/loadout_item/mask/griffin_mask
	name = "Griffin Mask"
	item_path = /obj/item/clothing/head/costume/griffin

/datum/loadout_item/mask/horse_mask
	name = "Horse Mask"
	item_path = /obj/item/clothing/mask/animal/horsehead

/datum/loadout_item/mask/jackal_mask
	name = "Jackal Mask"
	item_path = /obj/item/clothing/mask/animal/small/jackal

/datum/loadout_item/mask/joy
	name = "Joy Mask"
	item_path = /obj/item/clothing/mask/joy

/datum/loadout_item/mask/lollipop
	name = "Lollipop"
	item_path = /obj/item/food/lollipop

/datum/loadout_item/mask/corn_pipe
	name = "Corn Cob Pipe"
	item_path = /obj/item/clothing/mask/cigarette/pipe/cobpipe

/datum/loadout_item/mask/fake_mustache
	name = "Fake Moustache"
	item_path = /obj/item/clothing/mask/fakemoustache

/datum/loadout_item/mask/owl_mask
	name = "Owl Mask"
	item_path = /obj/item/clothing/mask/gas/owl_mask

/datum/loadout_item/mask/pig_mask
	name = "Pig Mask"
	item_path = /obj/item/clothing/mask/animal/pig

/datum/loadout_item/mask/pipe
	name = "Pipe"
	item_path = /obj/item/clothing/mask/cigarette/pipe

/datum/loadout_item/mask/plague_doctor
	name = "Plague Doctor Mask"
	item_path = /obj/item/clothing/mask/gas/plaguedoctor

/datum/loadout_item/mask/rat_mask
	name = "Rat Mask"
	item_path = /obj/item/clothing/mask/animal/small/rat

/datum/loadout_item/mask/raven_mask
	name = "Raven Mask"
	item_path = /obj/item/clothing/mask/animal/small/raven

/datum/loadout_item/mask/sexy_clown_mask
	name = "Sexy Clown Mask"
	item_path = /obj/item/clothing/mask/gas/sexyclown

/datum/loadout_item/mask/sexy_mime_mask
	name = "Sexy Mime Mask"
	item_path = /obj/item/clothing/mask/gas/sexymime

/datum/loadout_item/mask/tribal_mask
	name = "Tribal Mask"
	item_path = /obj/item/clothing/mask/animal/small/tribal

/datum/loadout_item/mask/whistle
	name = "Whistle"
	item_path = /obj/item/clothing/mask/whistle
