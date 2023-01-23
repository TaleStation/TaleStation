/obj/item/bodypart/head/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	is_dimorphic = TRUE

/obj/item/bodypart/chest/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	is_dimorphic = TRUE

/obj/item/bodypart/arm/left/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = SPECIES_AVIAN

/obj/item/bodypart/leg/right/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = SPECIES_AVIAN

/obj/item/bodypart/leg/left/avian/digitigrade/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/left/avian/digitigrade/avian/update_limb(dropping_limb = FALSE, is_creating = FALSE)
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

/obj/item/bodypart/leg/right/avian/digitigrade/avian
	icon_greyscale = 'talestation_modules/icons/mob/species/avian/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/avian/digitigrade/avian/update_limb(dropping_limb = FALSE, is_creating = FALSE)
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

// Proc for digi leg handling; it applies the correct stuff to the species or whatever
// Fuck this stupid fucking proc
/datum/species/avian/replace_body(mob/living/carbon/target, datum/species/avian/new_species)
	new_species ||= target.dna.species

	if((new_species.digitigrade_customization == DIGITIGRADE_OPTIONAL && target.dna.features["legs"] == "Digitigrade Legs") || new_species.digitigrade_customization == DIGITIGRADE_FORCED)
		new_species.bodypart_overrides[BODY_ZONE_R_LEG] = /obj/item/bodypart/leg/right/avian/digitigrade/avian
		new_species.bodypart_overrides[BODY_ZONE_L_LEG] = /obj/item/bodypart/leg/left/avian/digitigrade/avian

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
