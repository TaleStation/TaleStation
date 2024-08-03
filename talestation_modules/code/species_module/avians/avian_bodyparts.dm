/obj/item/bodypart/head/avian
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	head_flags = HEAD_ALL_FEATURES_NO_HAIR_OR_FACIAL_HAIR
	is_dimorphic = FALSE
	bodytype = BODYTYPE_SNOUTED
	eyeless_icon = 'talestation_modules/icons/species/avians/avian_eyes.dmi'

/obj/item/bodypart/chest/avian
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	is_dimorphic = TRUE
	wing_types = NONE

/obj/item/bodypart/arm/left/avian
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/avian
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/avian
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	/// What bodypart overlay do we pass?
	var/left_talon_overlay = /datum/bodypart_overlay/simple/avian_feet/talon_l_planti

/obj/item/bodypart/leg/left/avian/Initialize()
	. = ..()

	add_bodypart_overlay(new left_talon_overlay())

/obj/item/bodypart/leg/right/avian
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	/// What bodypart overlay do we pass?
	var/right_talon_overlay = /datum/bodypart_overlay/simple/avian_feet/talon_r_planti

/obj/item/bodypart/leg/right/avian/Initialize()
	. = ..()

	add_bodypart_overlay(new right_talon_overlay())

/obj/item/bodypart/leg/left/avian/digitigrade/talon
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE
	left_talon_overlay = /datum/bodypart_overlay/simple/avian_feet/talon_l_digi

/obj/item/bodypart/leg/left/avian/digitigrade/talon/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE

		if((uniform_compatible && suit_compatible) || (suit_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = BODYPART_ID_DIGITIGRADE

		else
			limb_id = SPECIES_AVIAN

/obj/item/bodypart/leg/right/avian/digitigrade/talon
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE
	right_talon_overlay = /datum/bodypart_overlay/simple/avian_feet/talon_r_digi

/obj/item/bodypart/leg/right/avian/digitigrade/talon/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE

		if((uniform_compatible && suit_compatible) || (suit_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = BODYPART_ID_DIGITIGRADE

		else
			limb_id = SPECIES_AVIAN

/datum/species/avian/replace_body(mob/living/carbon/target, datum/species/avian/new_species)
	new_species ||= target.dna.species

	if(new_species.digitigrade_customization == DIGITIGRADE_FORCED)
		new_species.bodypart_overrides[BODY_ZONE_R_LEG] = /obj/item/bodypart/leg/right/avian/digitigrade/talon
		new_species.bodypart_overrides[BODY_ZONE_L_LEG] = /obj/item/bodypart/leg/left/avian/digitigrade/talon

	else if(new_species.digitigrade_customization == DIGITIGRADE_OPTIONAL)
		switch(target.dna.features["avian_legs"])
			if("Talon Legs")
				new_species.bodypart_overrides[BODY_ZONE_R_LEG] = /obj/item/bodypart/leg/right/avian/digitigrade/talon
				new_species.bodypart_overrides[BODY_ZONE_L_LEG] = /obj/item/bodypart/leg/left/avian/digitigrade/talon
			if("Webbed Legs")
				new_species.bodypart_overrides[BODY_ZONE_R_LEG] = /obj/item/bodypart/leg/right/avian/digitigrade/webbed
				new_species.bodypart_overrides[BODY_ZONE_L_LEG] = /obj/item/bodypart/leg/left/avian/digitigrade/webbed

	for(var/obj/item/bodypart/old_part as anything in target.bodyparts)
		if(old_part.change_exempt_flags & BP_BLOCK_CHANGE_SPECIES)
			continue

		var/path = new_species.bodypart_overrides?[old_part.body_zone]
		var/obj/item/bodypart/new_part
		if(path)
			new_part = new path()
			new_part.replace_limb(target, TRUE)
			new_part.update_limb(is_creating = TRUE)
			qdel(old_part)

/obj/item/bodypart/leg/left/avian/digitigrade/webbed
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	//icon_state = "digitigrade_l_leg_web"
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE
	left_talon_overlay = /datum/bodypart_overlay/simple/avian_feet/web_l_digi

/obj/item/bodypart/leg/left/avian/digitigrade/webbed/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE

		if((uniform_compatible && suit_compatible) || (suit_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = BODYPART_ID_DIGITIGRADE

		else
			limb_id = SPECIES_AVIAN

/obj/item/bodypart/leg/right/avian/digitigrade/webbed
	icon_greyscale = 'talestation_modules/icons/species/avians/bodyparts.dmi'
	//icon_state = "digitigrade_r_leg_web"
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE
	right_talon_overlay = /datum/bodypart_overlay/simple/avian_feet/web_r_digi

/obj/item/bodypart/leg/right/avian/digitigrade/webbed/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE

		if((uniform_compatible && suit_compatible) || (suit_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = BODYPART_ID_DIGITIGRADE

		else
			limb_id = SPECIES_AVIAN
