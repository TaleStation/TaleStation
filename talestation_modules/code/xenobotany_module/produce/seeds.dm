// Modular seeds

// Adds this var to the primary seeds parent typepath
/obj/item/seeds
	/// Are we an alien seed?
	var/is_alien_seeds = FALSE

// Modular override to add the alien var
/obj/item/food/grown
	/// Are we an alien food item?
	var/is_alien_produce = FALSE

// what the fuck is going on here
/obj/item/grown
	/// Are we an alien non-food item?
	var/is_alien_produce = FALSE

// Alien seeds used for XenoBotany
// Kinda just a shitty slot in for later cause I'm lazy
/obj/item/seeds/xeno
	is_alien_seeds = TRUE
	name = "pack of extradimensional orange seeds"
	desc = "Polygonal seeds."
	icon_state = "seed-orange"
	species = "orange"
	plantname = "Extradimensional Orange Tree"
	product = /obj/item/food/grown/citrus/orange_3d
	lifespan = 60
	endurance = 50
	yield = 5
	potency = 20
	instability = 64
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "lime-grow"
	icon_dead = "lime-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)

// Converts main seeds to alien
/obj/item/seeds/orange_3d
	is_alien_seeds = TRUE

/obj/item/seeds/grass/carpet
	is_alien_seeds = TRUE

/obj/item/seeds/cherry/bomb
	is_alien_seeds = TRUE

/obj/item/seeds/firelemon
	is_alien_seeds = TRUE

/obj/item/seeds/gatfruit
	is_alien_seeds = TRUE

/obj/item/seeds/tomato/killer
	is_alien_seeds = TRUE

/obj/item/seeds/replicapod
	is_alien_seeds = TRUE

// This is in random.dm, not seeds.dm
/obj/item/seeds/random
	is_alien_seeds = TRUE

// This is in mushrooms.dm, not seeds.dm
/obj/item/seeds/plump/walkingmushroom
	is_alien_seeds = TRUE

// Mutate list overrides
/obj/item/seeds/orange
	mutatelist = list(/obj/item/seeds/lime)

/obj/item/seeds/grass
	mutatelist = list(/obj/item/seeds/grass/fairy)

/obj/item/seeds/lemon
	mutatelist = list()

/obj/item/seeds/tomato
	mutatelist = list(/obj/item/seeds/tomato/blue, /obj/item/seeds/tomato/blood)

/obj/item/seeds/cabbage
	mutatelist = list()

/obj/item/seeds/plump
	mutatelist = list()

// Alien produce list
/obj/item/food/grown/citrus/orange_3d
	is_alien_produce = TRUE

/obj/item/food/grown/grass/carpet
	is_alien_produce = TRUE

/obj/item/food/grown/cherry_bomb
	is_alien_produce = TRUE

/obj/item/food/grown/firelemon
	is_alien_produce = TRUE

/obj/item/food/grown/shell/gatfruit
	is_alien_produce = TRUE

/obj/item/food/grown/tomato/killer
	is_alien_produce = TRUE

/obj/item/food/grown/random
	is_alien_produce = TRUE

/obj/item/food/grown/mushroom/plumphelmet
	is_alien_produce = TRUE
