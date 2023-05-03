// Canned food stuff

// Canned lima beans!
/obj/item/food/canned/lima_beans
	name = "tin of lima beans"
	desc = "Delicious beans that'll fill the bellies of any mapper! What, you wanted MORE than two servings? Tough luck."
	icon = 'talestation_modules/icons/food/food/canned_food.dmi'
	icon_state = "lima"
	trash_type = /obj/item/trash/can/food/lima_beans
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		)

	tastes = list(
		"lima beans" = 1,
		)

	foodtypes = VEGETABLES

/datum/crafting_recipe/food/beans
	name = "Lima Beans"
	time = 40
	reqs = list(
		/obj/item/food/grown/lima_beans = 2,
	)

	result = /obj/item/food/canned/lima_beans
	category = CAT_MISCFOOD

// Trash item
/obj/item/trash/can/food/lima_beans
	name = "tin of lima beans"
	icon = 'talestation_modules/icons/food/food/canned_food.dmi'
	icon_state = "lima_empty"
