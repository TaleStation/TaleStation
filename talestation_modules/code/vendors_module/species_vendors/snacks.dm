// Snacks and drinks for the 'snacks' tab of vendors

/obj/item/food/vendor_snacks
	name = "\improper God's Strongest Snacks"
	desc = "You best hope you aren't a sinner. (You should never see this item please report it)"
	icon = 'talestation_modules/icons/machines/vending_machines/imported_quick_foods.dmi'
	icon_state = "foodpack_generic"
	trash_type = /obj/item/trash/vendor_trash
	bite_consumption = 10
	food_reagents = list(/datum/reagent/consumable/nutriment = INFINITY)
	junkiness = 10
	custom_price = PAYCHECK_LOWER * INFINITY
	tastes = list("the unmatched power of the sun" = 10)
	foodtypes = JUNKFOOD | CLOTH | GORE | NUTS | FRIED | FRUIT //You don't want to know what's in the broken debug snacks
	w_class = WEIGHT_CLASS_SMALL

/obj/item/trash/vendor_trash
	name = "\improper God's Weakest Snacks"
	desc = "The leftovers of what was likely a great snack in a past time."
	icon = 'talestation_modules/icons/machines/vending_machines/imported_quick_foods.dmi'
	icon_state = "foodpack_generic_empty"
	custom_materials = list(/datum/material/plastic = 1000)

/*
*	"Yangyu" Snacks
*/

/obj/item/reagent_containers/cup/glass/dry_ramen/prepared
	name = "cup ramen"
	desc = "This one even comes with water, amazing!"
	list_reagents = list(/datum/reagent/consumable/hot_ramen = 15, /datum/reagent/consumable/salt = 3)

/obj/item/reagent_containers/cup/glass/dry_ramen/prepared/hell
	name = "spicy cup ramen"
	desc = "This one comes with water, AND a security checkpoint's worth of capsaicin!"
	list_reagents = list(/datum/reagent/consumable/hell_ramen = 15, /datum/reagent/consumable/salt = 3)

/obj/item/food/vendor_snacks/rice_crackers
	name = "rice crackers"
	desc = "Despite most of the package being clear, you will never truly know what flavor these are until you eat them."
	icon_state = "rice_cracka"
	trash_type = /obj/item/trash/vendor_trash/rice_crackers
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/rice = 2)
	tastes = list("incomprehensible flavoring" = 1, "rice cracker" = 2)
	foodtypes = JUNKFOOD | GRAIN
	custom_price = PAYCHECK_LOWER * 0.8

/obj/item/food/vendor_snacks/rice_crackers/make_leave_trash()
	AddElement(/datum/element/food_trash, trash_type, FOOD_TRASH_POPABLE)

/obj/item/trash/vendor_trash/rice_crackers
	name = "empty rice crackers bag"
	desc = "You never did find out what flavor that was supposed to be, did you?"
	icon_state = "rice_cracka_trash"

/obj/item/food/vendor_snacks/mochi_ice_cream
	name = "mochi ice cream balls - vanilla"
	desc = "A six pack of mochi ice cream, which is to say vanilla icecream surrounded by mochi. Comes with small plastic skewer for consumption."
	icon_state = "mochi_ice"
	trash_type = /obj/item/trash/vendor_trash/mochi_ice_cream
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/ice = 3)
	tastes = list("rice cake" = 2, "vanilla" = 2)
	foodtypes = JUNKFOOD | DAIRY | GRAIN
	custom_price = PAYCHECK_LOWER

/obj/item/food/vendor_snacks/mochi_ice_cream/matcha
	name = "mochi ice cream balls - matcha"
	desc = "A six pack of mochi ice cream - or, more specifically, matcha icecream surrounded by mochi. Comes with small plastic skewer for consumption."
	icon_state = "mochi_ice_green"
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/ice = 1, /datum/reagent/consumable/tea = 2)
	tastes = list("rice cake" = 1, "bitter matcha" = 2)
	custom_price = PAYCHECK_LOWER * 1.2

/obj/item/food/vendor_snacks/mochi_ice_cream/matcha/examine_more(mob/user)
	. = ..()
	. += span_notice("A small label on the container specifies that this icecream is made using only culinary grade matcha grown outside of the Sol system.")
	return .

/obj/item/trash/vendor_trash/mochi_ice_cream
	name = "empty mochi ice cream tray"
	desc = "Somehow, that tiny plastic skewer it came with has gone missing."
	icon_state = "mochi_ice_trash"

/obj/item/reagent_containers/cup/glass/waterbottle/tea
	name = "bottle of tea"
	desc = "A bottle of tea brought to you in a convenient plastic bottle."
	icon = 'talestation_modules/icons/machines/vending_machines/imported_quick_foods.dmi'
	icon_state = "tea_bottle"
	inhand_icon_state = "bottle"
	list_reagents = list(/datum/reagent/consumable/tea = 40)
	cap_icon_state = "bottle_cap_tea"
	flip_chance = 5 //I fucking dare you
	custom_price = PAYCHECK_LOWER * 1.2
	fill_icon_state = null

/obj/item/reagent_containers/cup/glass/waterbottle/tea/astra
	name = "bottle of tea astra"
	desc = "A bottle of tea astra, known for the rather unusual tastes the leaf is known to give when brewed."
	icon_state = "tea_bottle_blue"
	list_reagents = list(
		/datum/reagent/consumable/tea = 25,
		/datum/reagent/medicine/salglu_solution = 10, // I know this looks strange but this is what tea astra grinds into, tea in the year 25whatever baby
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	custom_price = PAYCHECK_LOWER * 2

/datum/reagent/consumable/pinktea //Tiny Tim song
	name = "Strawberry Tea"
	description = "A timeless classic!"
	color = "#f76aeb"//rgb(247, 106, 235)
	quality = DRINK_VERYGOOD
	taste_description = "sweet tea with a hint of strawberry"

/datum/glass_style/drinking_glass/pinktea
	required_drink_type = /datum/reagent/consumable/pinktea
	icon = 'talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "pinktea"
	name = "mug of strawberry tea"
	desc = "Delicious traditional tea flavored with strawberries."

/datum/reagent/consumable/pinktea/on_mob_life(mob/living/carbon/M)
	if(prob(10))
		to_chat(M, span_notice("[pick("Diamond skies where white deer fly.","Sipping strawberry tea.","Silver raindrops drift through timeless, Neverending June.","Crystal ... pearls free, with love!","Beaming love into me.")]"))
	..()
	. = TRUE

/datum/reagent/consumable/catnip_tea
	name = "Catnip Tea"
	description = "A sleepy and tasty catnip tea!"
	color = "#101000" // rgb: 16, 16, 0
	taste_description = "sugar and catnip"

/datum/glass_style/drinking_glass/catnip_tea
	required_drink_type = /datum/reagent/consumable/catnip_tea
	icon = 'talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "catnip_tea"
	name = "glass of catnip tea"
	desc = "A purrfect drink for a cat."

/datum/reagent/consumable/catnip_tea/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(min(50 - M.getStaminaLoss(), 3))
	to_chat(M, span_notice("[pick("I feel oddly calm.", "I feel relaxed.", "Mew?")]"))
	..()

/datum/reagent/consumable/pinkmilk
	name = "Strawberry Milk"
	description = "A drink of a bygone era of milk and artificial sweetener back on a rock."
	color = "#f76aeb"//rgb(247, 106, 235)
	quality = DRINK_VERYGOOD
	taste_description = "sweet strawberry and milk cream"

/datum/glass_style/drinking_glass/pinkmilk
	required_drink_type = /datum/reagent/consumable/pinkmilk
	icon = 'talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "pinkmilk"
	name = "tall glass of strawberry milk"
	desc = "Delicious flavored strawberry syrup mixed with milk."

/datum/reagent/consumable/pinkmilk/on_mob_life(mob/living/carbon/M)
	if(prob(15))
		to_chat(M, span_notice("[pick("You cant help to smile.","You feel nostalgia all of sudden.","You remember to relax.")]"))
	..()
	. = 1

/obj/item/reagent_containers/cup/glass/waterbottle/tea/strawberry
	name = "bottle of strawberry tea"
	desc = "A bottle of strawberry flavored tea; does not contain any actual strawberries."
	icon_state = "tea_bottle_pink"
	list_reagents = list(/datum/reagent/consumable/pinktea = 40)
	custom_price = PAYCHECK_LOWER * 2

/obj/item/reagent_containers/cup/glass/waterbottle/tea/nip
	name = "bottle of catnip tea"
	desc = "A bottle of catnip tea, required to be at or under a 50% concentration by the SFDA for safety purposes."
	icon_state = "tea_bottle_pink"
	list_reagents = list(
		/datum/reagent/consumable/catnip_tea = 20,
		/datum/reagent/consumable/pinkmilk = 20, // I can't believe they would cut my catnip
	)
	custom_price = PAYCHECK_LOWER * 2.5

/*
*	Mothic Snacks
*/

/obj/item/food/vendor_snacks/mothmallow
	name = "mothmallow"
	desc = "A vacuum sealed bag containing a pretty crushed looking mothmallow, someone save him!"
	icon_state = "mothmallow"
	trash_type = /obj/item/trash/vendor_trash/mothmallow
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 4)
	tastes = list("vanilla" = 1, "cotton" = 1, "chocolate" = 1)
	foodtypes = VEGETABLES | SUGAR
	custom_price = PAYCHECK_LOWER

/obj/item/food/vendor_snacks/mothmallow/make_leave_trash()
	AddElement(/datum/element/food_trash, trash_type, FOOD_TRASH_POPABLE)

/obj/item/trash/vendor_trash/mothmallow
	name = "empty mothmallow bag"
	desc = "Finally he is free."
	icon_state = "mothmallow_trash"

/obj/item/food/vendor_snacks/moth_bag
	name = "engine fodder"
	desc = "A vacuum sealed bag containing a small portion of colorful engine fodder."
	icon_state = "fodder"
	trash_type = /obj/item/trash/vendor_trash/moth_bag
	food_reagents = list(/datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/salt = 2)
	tastes = list("seeds" = 1, "nuts" = 1, "chocolate" = 1, "salt" = 1, "popcorn" = 1, "potato" = 1)
	foodtypes = GRAIN | NUTS | VEGETABLES | SUGAR
	custom_price = PAYCHECK_LOWER * 1.2

/obj/item/food/vendor_snacks/moth_bag/fuel_jack
	name = "fueljack's snack"
	desc = "A vacuum sealed bag containing a smaller than usual brick of fueljack's lunch, ultimately downgrading it to a fueljack's snack."
	icon_state = "fuel_jack_snack"
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 1)
	tastes = list("cabbage" = 1, "potato" = 1, "onion" = 1, "chili" = 1, "cheese" = 1)
	foodtypes = DAIRY | VEGETABLES
	custom_price = PAYCHECK_LOWER * 1.2

/obj/item/food/vendor_snacks/moth_bag/cheesecake
	name = "chocolate cheesecake cube"
	desc = "A vacuum sealed bag containing a small cube of a mothic style cheesecake, this one is covered in chocolate."
	icon_state = "choco_cheese_cake"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/sugar = 4)
	tastes = list("cheesecake" = 1, "chocolate" = 1)
	foodtypes = SUGAR | FRIED | DAIRY | GRAIN
	custom_price = PAYCHECK_LOWER * 1.4

/obj/item/food/vendor_snacks/moth_bag/cheesecake/honey
	name = "honey cheesecake cube"
	desc = "A vacuum sealed bag containing a small cube of a mothic style cheesecake, this one is covered in honey."
	icon_state = "honey_cheese_cake"
	tastes = list("cheesecake" = 1, "honey" = 1)
	foodtypes = SUGAR | FRIED | DAIRY | GRAIN

/obj/item/trash/vendor_trash/moth_bag
	name = "empty mothic snack bag"
	desc = "The clear plastic reveals that this no longer holds tasty treats for your winged friends."
	icon_state = "moth_bag_trash"

/obj/item/reagent_containers/cup/soda_cans/lemonade
	name = "\improper Gyárhajó 1023: Lemonade"
	desc = "A can of lemonade, for those who are into that kind of thing, or just have no choice."
	icon ='talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "lemonade"
	list_reagents = list(/datum/reagent/consumable/lemonade = 30)
	drink_type = FRUIT

/obj/item/reagent_containers/cup/soda_cans/lemonade/examine_more(mob/user)
	. = ..()
	. += span_notice("Markings on the can indicate this one was made on <i>factory ship 1023</i> of the Grand Nomad Fleet.")
	return .

/obj/item/reagent_containers/cup/soda_cans/navy_rum
	name = "\improper Gyárhajó 1506: Navy Rum"
	desc = "A can of navy rum brewed up and imported from a detachment of the nomad fleet, or so the can says."
	icon ='talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "navy_rum"
	list_reagents = list(/datum/reagent/consumable/ethanol/navy_rum = 30)
	drink_type = ALCOHOL

/obj/item/reagent_containers/cup/soda_cans/navy_rum/examine_more(mob/user)
	. = ..()
	. += span_notice("Markings on the can indicate this one was made on <i>factory ship 1506</i> of the Grand Nomad Fleet.")
	return .

/obj/item/reagent_containers/cup/soda_cans/soda_water_moth
	name = "\improper Gyárhajó 1023: Soda Water"
	desc = "A can of soda water. Why not make a rum and soda? Now that you think of it, maybe not."
	icon ='talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "soda_water"
	list_reagents = list(/datum/reagent/consumable/sodawater = 30)
	drink_type = SUGAR

/obj/item/reagent_containers/cup/soda_cans/soda_water_moth/examine_more(mob/user)
	. = ..()
	. += span_notice("Markings on the can indicate this one was made on <i>factory ship 1023</i> of the Grand Nomad Fleet.")
	return .

/obj/item/reagent_containers/cup/soda_cans/ginger_beer
	name = "\improper Gyárhajó 1023: Ginger Beer"
	desc = "A can of ginger beer, don't let the beer part mislead you, this is entirely non-alcoholic."
	icon ='talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "gingie_beer"
	list_reagents = list(/datum/reagent/consumable/sol_dry = 30)
	drink_type = SUGAR

/obj/item/reagent_containers/cup/soda_cans/ginger_beer/examine_more(mob/user)
	. = ..()
	. += span_notice("Markings on the can indicate this one was made on <i>factory ship 1023</i> of the Grand Nomad Fleet.")
	return .

/*
*	Lizard Snacks
*/

/obj/item/food/vendor_snacks/lizard_bag
	name = "candied mushroom"
	desc = "An odd treat of the lizard empire, a mushroom dipped in caramel; unfortunately, it seems to have been bagged before the caramel fully hardened."
	icon_state = "candied_shroom"
	trash_type = /obj/item/trash/vendor_trash/lizard_bag
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/caramel = 2)
	tastes = list("savouriness" = 1, "sweetness" = 1)
	foodtypes = SUGAR | VEGETABLES
	custom_price = PAYCHECK_LOWER * 1.4 //Tizirian imports are a bit more expensive overall

/obj/item/food/vendor_snacks/lizard_bag/make_leave_trash()
	AddElement(/datum/element/food_trash, trash_type, FOOD_TRASH_POPABLE)

/obj/item/food/vendor_snacks/lizard_bag/moon_jerky
	name = "moonfish jerky"
	desc = "A fish jerky, made from what you can only hope is moonfish. It also seems to taste subtly of barbecue"
	icon_state = "moon_jerky"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/bbqsauce = 2)
	tastes = list("fish" = 1, "smokey sauce" = 1)
	foodtypes = MEAT
	custom_price = PAYCHECK_LOWER * 1.6

/obj/item/trash/vendor_trash/lizard_bag
	name = "empty tizirian snack bag"
	desc = "All that money importing tizirian snacks just to end at this?"
	icon_state = "tiziria_bag_trash"

/obj/item/food/vendor_snacks/lizard_box
	name = "tizirian dumplings"
	desc = "A three pack of tizirian style dumplings, not actually stuffed with anything."
	icon_state = "dumpling"
	trash_type = /obj/item/trash/vendor_trash/lizard_box
	food_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("potato" = 1, "earthy heat" = 1)
	foodtypes = VEGETABLES | NUTS
	custom_price = PAYCHECK_LOWER * 1.6

/obj/item/food/vendor_snacks/lizard_box/sweet_roll
	name = "honey roll"
	desc = "Definitely don't let the guards find out that someone stole your last one."
	icon_state = "sweet_roll"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/honey = 2)
	tastes = list("bread" = 1, "honey" = 1, "fruit" = 1)
	foodtypes = VEGETABLES | NUTS | FRUIT
	custom_price = PAYCHECK_LOWER * 1.8

/obj/item/trash/vendor_trash/lizard_box
	name = "empty tizirian snack box"
	desc = "Tiziria, contributing to the space plastic crisis since 2530."
	icon_state = "tiziria_box_trash"

/obj/item/reagent_containers/cup/glass/waterbottle/tea/mushroom
	name = "bottle of mushroom tea"
	desc = "A bottle of somewhat bitter mushroom tea, a favorite of the Tizirian empire."
	icon_state = "tea_bottle_grey"
	list_reagents = list(/datum/reagent/consumable/mushroom_tea = 40)
	custom_price = PAYCHECK_LOWER * 2

/obj/item/reagent_containers/cup/soda_cans/kortara
	name = "kortara"
	desc = "A can of kortara, alcohol brewed from korta seeds, which gives it a unique peppery spice flavor."
	icon ='talestation_modules/icons/food/drinks/drinks.dmi'
	icon_state = "kortara"
	list_reagents = list(/datum/reagent/consumable/ethanol/kortara = 30)
	drink_type = ALCOHOL
