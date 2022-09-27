// -- Lizardperson species additions --

/datum/species/lizard
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE, HAIR)

/datum/species/lizard/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = sanitize_hexcolor(COLOR_DARK_LIME)

	var/obj/item/organ/external/frills/frills = human.getorgan(/obj/item/organ/external/frills)
	frills?.set_sprite("Short")

	var/obj/item/organ/external/horns/horns = human.getorgan(/obj/item/organ/external/horns)
	horns?.set_sprite("Simple")

	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)
