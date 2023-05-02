//New drink reagents for talestation.
/datum/reagent/consumable/green_tea //seperate from regular tea because its different in almost every way
	name = "Green Tea"
	description = "Some nice green tea. A very traditional drink in Space Japanese culture."
	color = "#9E8400" // rgb: 158, 132, 0
	quality = DRINK_GOOD
	taste_description = "tart green tea"
	glass_price = DRINK_PRICE_MEDIUM
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/green_tea/on_mob_life(mob/living/carbon/M, seconds_per_tick, times_fired)
	M.adjust_timed_status_effect(-4 SECONDS * REM * seconds_per_tick, /datum/status_effect/dizziness)
	M.adjust_timed_status_effect(-2 SECONDS * REM * seconds_per_tick, /datum/status_effect/drowsiness)
	M.adjust_timed_status_effect(-6 SECONDS * REM * seconds_per_tick, /datum/status_effect/jitter)
	M.AdjustSleeping(-20 * REM * seconds_per_tick)
	M.adjustToxLoss(-0.5, 0) //the major difference between base tea and green tea, this one's a great anti-tox.
	M.adjust_bodytemperature(20 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * seconds_per_tick, 0, M.get_body_temp_normal())
	..()
	. = TRUE

/datum/glass_style/drinking_glass/green_tea
	required_drink_type = /datum/reagent/consumable/green_tea
	icon_state = "green_teaglass"
	icon = 'talestation_modules/icons/food/drinks/drinks.dmi'
	name = "glass of green tea"
	desc = "It just doesn't feel right to drink this without a cup..."


/datum/reagent/consumable/ice_greentea
	name = "Iced Green Tea"
	description = "A delicious beverage, a classic when mixed with honey." //doesnt actually do anything special with honey
	color = "#AD8500" // rgb: 173, 133, 0
	nutriment_factor = 0
	quality = DRINK_VERYGOOD
	taste_description = "tart cold green tea" //iced green tea has a weird but amazing taste IRL, hard to describe it
	glass_price = DRINK_PRICE_MEDIUM
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/glass_style/drinking_glass/ice_greentea
	required_drink_type = /datum/reagent/consumable/ice_greentea
	icon_state = "iced_green_teaglass"
	icon = 'talestation_modules/icons/food/drinks/drinks.dmi'
	name = "iced green tea"
	desc = "A delicious beverage for any time of the year. Much better with a lot of sugar." //Now THIS is actually a hint, as sugar rush turns it into Green Hill Tea.

/datum/reagent/consumable/icetea/on_mob_life(mob/living/carbon/M, seconds_per_tick, times_fired)
	M.adjust_timed_status_effect(-4 SECONDS * REM * seconds_per_tick, /datum/status_effect/dizziness)
	M.adjust_timed_status_effect(-2 SECONDS * REM * seconds_per_tick, /datum/status_effect/drowsiness)
	M.AdjustSleeping(-40 * REM * seconds_per_tick)
	M.adjustToxLoss(-0.5, 0)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * seconds_per_tick, M.get_body_temp_normal())
	..()
	. = TRUE

/datum/reagent/consumable/green_hill_tea
	name = "Green Hill Tea"
	description = "A beverage that is a strong stimulant, makes people run at sonic speed."
	color = "#1FB800" // rgb: 31, 184, 0
	nutriment_factor = 0
	overdose_threshold = 55
	quality = DRINK_FANTASTIC
	glass_price = DRINK_PRICE_HIGH
	taste_description = "flowers and being able to do anything"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/glass_style/drinking_glass/green_hill_tea
	required_drink_type = /datum/reagent/consumable/green_hill_tea
	icon_state = "green_hill_tea"
	icon = 'talestation_modules/icons/food/drinks/drinks.dmi'
	name = "Green Hill Tea"
	desc = "A strong stimulant, though for some it doesnt matter, as the taste opens your heart."

/datum/reagent/consumable/green_hill_tea/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/green_hill_tea)

/datum/reagent/consumable/green_hill_tea/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/green_hill_tea)
	..()

/datum/reagent/consumable/green_hill_tea/on_mob_life(mob/living/carbon/M, seconds_per_tick, times_fired)
	M.AdjustSleeping(-40 * REM * seconds_per_tick)
	M.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * seconds_per_tick, M.get_body_temp_normal())
	..()
	. = TRUE

/datum/reagent/consumable/green_hill_tea/overdose_process(mob/living/M, seconds_per_tick, times_fired)
	if(!ishuman(M))
		return

	var/mob/living/carbon/human/overdosed_human = M
	overdosed_human.hair_color = "15F" //blue hair, oh no
	overdosed_human.facial_hair_color = "15F"
	overdosed_human.update_hair()
	..()

/obj/item/reagent_containers/cup/glass/mug/green_tea //admin-only because there's no way to obtain a cup version of green tea
	name = "Bonzai Zen tea"
	desc = "A cup of traditional Space Japanese green tea. It is said that it soothes the soul, if drank properly."
	icon_state = "green_tea_cup" //actually unused because of how mugs work... ...for now.
	icon = 'talestation_modules/icons/food/drinks/drinks.dmi'
	list_reagents = list(/datum/reagent/consumable/green_tea = 30)
