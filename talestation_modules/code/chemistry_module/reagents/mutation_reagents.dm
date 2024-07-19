/datum/reagent/unstable_mutation
	name = "Unstable Mutation Toxin"
	description = "An unstable mutation toxin. Can be converted into other toxins."
	color = "#5EFF3B" //RGB: 94, 255, 59
	taste_description = "like not really knowing what you're doing"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/unstable_mutation/empowered
	name = "Empowered Mutation Toxin"
	description = "A stronger version of unstable mutation toxin. This could make some interesting species."

/datum/reagent/mutationtoxin/tajaran
	name = "Tajaran Mutation Toxin"
	description = "A curiously hairy-looking toxin. Do you really want to drink this?"
	color = "#b1ace2"
	race = /datum/species/tajaran
	taste_description = "hairball"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED|REAGENT_NO_RANDOM_RECIPE

