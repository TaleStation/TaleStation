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

// Tajaran tail
/obj/item/organ/external/tail/tajaran_tail
	slot = ORGAN_SLOT_EXTERNAL_TAIL
	dna_block = DNA_TAJARAN_TAIL_BLOCK
	name = "tajaran tail"
	desc = "A severed tajaran tail. What poor bastard would do such a thing?"
	feature_key = "tajaran_tail"
	preference = "feature_tajaran_tail"
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state = "severedtailtaj"
	wag_flags = WAG_ABLE

/obj/item/organ/external/tail/tajaran_tail/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(human.wear_suit && (human.wear_suit.flags_inv & HIDEJUMPSUIT))
		return FALSE
	return TRUE

/obj/item/organ/external/tail/tajaran_tail/get_global_feature_list()
	return GLOB.tajaran_tail_list

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
