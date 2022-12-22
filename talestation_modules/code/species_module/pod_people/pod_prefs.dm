/datum/species/pod/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.dna.features["mcolor"] = "#886600" // this is literally smells the roses moment

	human_for_preview.update_body()
	human_for_preview.update_body_parts(update_limb_data = TRUE)
