//adds fox tail option
/datum/species/human/felinid/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = ..()
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(H.dna.features["tail_human"] == "Fox")
			var/obj/item/organ/external/tail/cat/fox/tail = new
			tail.Insert(H, special = TRUE, drop_if_replaced = FALSE)
			mutant_organs += /obj/item/organ/external/tail/cat/fox

/obj/item/organ/external/tail/cat/fox
	name = "fox tail"
	desc = "A severed fox tail. Geckers."
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state = "severedfoxtail"

/obj/item/organ/external/tail/cat/fox/Insert(mob/living/carbon/reciever, special, drop_if_replaced)
	..()
	if(istype(reciever))
		var/default_part = reciever.dna.species.mutant_bodyparts["tail_cat"]
		if(!default_part || default_part == "None")
			if(original_owner)
				reciever.dna.features["tail_cat"] = reciever.dna.species.mutant_bodyparts["tail_cat"] = original_owner
				reciever.dna.update_uf_block(DNA_TAIL_BLOCK)
			else
				reciever.dna.species.mutant_bodyparts["tail_cat"] = reciever.dna.features["tail_cat"]
			reciever.update_body()

/obj/item/organ/external/tail/cat/fox/Remove(mob/living/carbon/reciever, special, moving)
	..()
	if(istype(reciever))
		reciever.dna.species.mutant_bodyparts -= "tail_cat"
		reciever.update_body()

// Tail icon overrides
/obj/item/organ/external/tail/monkey
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state= "severedmonkeytail"

/obj/item/organ/external/tail/cat
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state = "severedtailcat"

/obj/item/organ/external/tail/lizard
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state = "severedtailliz"
