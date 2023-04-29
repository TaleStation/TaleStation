/datum/species/lizard/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	var/obj/item/organ/external/frills/frills = human_for_preview.get_organ_by_type(/obj/item/organ/external/frills)
	var/obj/item/organ/external/horns/horns = human_for_preview.get_organ_by_type(/obj/item/organ/external/horns)

	human_for_preview.dna.features["mcolor"] = sanitize_hexcolor(COLOR_DARK_LIME)
	frills.simple_change_sprite(/datum/sprite_accessory/frills/short)
	horns.simple_change_sprite(/datum/sprite_accessory/horns/short)

	human_for_preview.update_body()
	human_for_preview.update_body_parts(update_limb_data = TRUE)
