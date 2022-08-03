// Modular human defines

// Felinid on human stuff, originally coded by the late TheBonded
// Curiosity killed the human's wagging tail.
/datum/species/human/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(!pref_load)
			H.dna.features["tail_cat"] = "None"
			if(H.dna.features["ears"] == "None")
				H.dna.features["ears"] = "None"
		if(H.dna.features["ears"] == "Cat")
			var/obj/item/organ/internal/ears/cat/ears = new
			ears.Insert(H, drop_if_replaced = FALSE)
		else
			mutantears = /obj/item/organ/internal/ears
	return ..()
