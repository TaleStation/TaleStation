/obj/item/organ/external/tail/cat/fox
	name = "fox tail"
	desc = "A severed fox tail. Geckers."
	icon = 'jollystation_modules/icons/obj/surgery.dmi'
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
	icon = 'jollystation_modules/icons/obj/surgery.dmi'
	icon_state= "severedmonkeytail"

/obj/item/organ/external/tail/cat
	icon = 'jollystation_modules/icons/obj/surgery.dmi'
	icon_state = "severedtailcat"

/obj/item/organ/external/tail/lizard
	icon = 'jollystation_modules/icons/obj/surgery.dmi'
	icon_state = "severedtailliz"
