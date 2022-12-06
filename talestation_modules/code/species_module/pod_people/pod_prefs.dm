/datum/species/pod/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = "#886600" // this is literally smells the roses moment

	human.update_body()
	human.update_body_parts(update_limb_data = TRUE)
