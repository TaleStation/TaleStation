// Adds back stamina to bodyparts
/obj/item/bodypart
	///Multiplier of the limb's stamina damage that gets applied to the mob. Why is this 0.75 by default? Good question!
	var/stam_damage_coeff = 0.75
	///The current amount of stamina damage the limb has
	var/stamina_dam = 0
	///The maximum stamina damage a bodypart can take
	var/max_stamina_damage = 0

// Bodypart max stamnia damage and stuff
/obj/item/bodypart/head
	stam_damage_coeff = 1
	max_stamina_damage = 100

/obj/item/bodypart/chest
	stam_damage_coeff = 1
	max_stamina_damage = 120

/obj/item/bodypart/arm
	max_stamina_damage = 50

/obj/item/bodypart/leg
	max_stamina_damage = 50
