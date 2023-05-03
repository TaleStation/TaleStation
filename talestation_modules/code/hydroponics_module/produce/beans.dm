// -- Modular grown food --
// you wanted leema beens, you're getting leema beens.
/obj/item/seeds/lima_beans
	name = "pack of lima bean seeds"
	desc = "These seeds grow into something called leema beans?"
	icon = 'talestation_modules/icons/food/hydroponics/seeds.dmi'
	icon_state = "seed-lima"
	species = "lima"
	plantname = "Lima Bean Seeds"
	product = /obj/item/food/grown/lima_beans
	maturation = 4
	production = 4
	potency = 15
	growthstages = 5
	growing_icon = 'talestation_modules/icons/food/hydroponics/growing_vegetables.dmi'
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.05)

/obj/item/food/grown/lima_beans
	seed = /obj/item/seeds/lima_beans
	name = "lima beans"
	desc = "What exactly are these supposed to be, anyway?"
	gender = PLURAL
	icon = 'talestation_modules/icons/food/hydroponics/harvest.dmi'
	icon_state = "lima"
	bite_consumption_mod = 2
	foodtypes = VEGETABLES
	tastes = list("mapper frustration" = 1) // leave this here
	wine_power = 20

// Added to vending machines
/obj/machinery/vending/hydroseeds/Initialize()
	for (var/list/category as anything in product_categories)
		if(category["name"] != "Vegetables")
			continue

		category["products"][/obj/item/seeds/lima_beans] = 3
		break

	return ..()
