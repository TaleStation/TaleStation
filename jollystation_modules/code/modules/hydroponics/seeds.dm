// Modular seeds

// Adds this var to the primary seeds parent typepath
/obj/item/seeds
	var/is_alien_seeds = FALSE

// Alien seeds used for XenoBotany
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
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
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
