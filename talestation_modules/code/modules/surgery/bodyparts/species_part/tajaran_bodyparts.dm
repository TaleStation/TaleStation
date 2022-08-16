// Tajarans body parts - Fluffy to hug!

/obj/item/bodypart/head/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	limb_id = SPECIES_TAJARAN
	uses_mutcolor = TRUE
	is_dimorphic = TRUE

/obj/item/bodypart/chest/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN
	is_dimorphic = TRUE

/obj/item/bodypart/l_arm/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN

/obj/item/bodypart/r_arm/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN

/obj/item/bodypart/l_leg/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN

/obj/item/bodypart/r_leg/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN

/obj/item/bodypart/l_leg/tajaran/digitigrade/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = BODYPART_TYPE_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/l_leg/tajaran/digitigrade/tajaran/update_limb(dropping_limb = FALSE, is_creating = FALSE)
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
			limb_id = BODYPART_TYPE_DIGITIGRADE

		else
			limb_id = SPECIES_TAJARAN

/obj/item/bodypart/r_leg/tajaran/digitigrade/tajaran
	icon_greyscale = 'talestation_modules/icons/mob/species/tajaran/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = BODYPART_TYPE_DIGITIGRADE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/r_leg/tajaran/digitigrade/tajaran/update_limb(dropping_limb = FALSE, is_creating = FALSE)
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
			limb_id = BODYPART_TYPE_DIGITIGRADE

		else
			limb_id = SPECIES_TAJARAN

// Proc for digi leg handling; it applies the correct stuff to the species or whatever
// Fuck this stupid fucking proc
/datum/species/tajaran/replace_body(mob/living/carbon/target, datum/species/tajaran/new_species)
	new_species ||= target.dna.species

	if((new_species.digitigrade_customization == DIGITIGRADE_OPTIONAL && target.dna.features["legs"] == "Digitigrade Legs") || new_species.digitigrade_customization == DIGITIGRADE_FORCED)
		new_species.bodypart_overrides[BODY_ZONE_R_LEG] = /obj/item/bodypart/r_leg/tajaran/digitigrade/tajaran
		new_species.bodypart_overrides[BODY_ZONE_L_LEG] = /obj/item/bodypart/l_leg/tajaran/digitigrade/tajaran

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
