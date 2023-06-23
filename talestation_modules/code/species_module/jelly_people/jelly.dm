/datum/species/jelly
	// Changes the default jellyperson to look like slimepeople instead of stargazers
	// (Because slimepeople are more customizable / less ugly)
	hair_color = "mutcolor"
	hair_alpha = 150
	examine_limb_id = SPECIES_JELLYPERSON

/obj/item/bodypart/head/jelly
	head_flags = HEAD_ALL_FEATURES

/datum/species/jelly/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.dna.features["mcolor"] = sanitize_hexcolor(COLOR_PINK)
	human_for_preview.hairstyle = "Bob Hair 2"
	human_for_preview.hair_color = "mutcolor"

	human_for_preview.update_hair()
	human_for_preview.update_body()
	human_for_preview.update_body_parts(update_limb_data = TRUE)
