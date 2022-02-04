//Modular sneeds and feeds

/obj/item/seeds
	//Determines if a seed if aline or not; Most of Hydro is treated this way
	//Var is only used for XenoBotany
	var/is_alien_seeds = FALSE

/obj/item/seeds/xeno
	is_alien_seeds = TRUE

/obj/item/seeds/xeno/xeno_example
	name = "xeno example"
	desc = "These seeds grow into aloe."
	icon_state = "seed-aloe"
	species = "test"
	plantname = "Test"
	product = /obj/item/food/grown/aloe
	lifespan = 60
	endurance = 25
	maturation = 4
	production = 4
	yield = 6
	growthstages = 5
	growing_icon = 'icons/obj/hydroponics/growing_vegetables.dmi'
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.05, /datum/reagent/consumable/nutriment = 0.05)
