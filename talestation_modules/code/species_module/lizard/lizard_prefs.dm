/datum/species/lizard/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = sanitize_hexcolor(COLOR_DARK_LIME)

	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)
