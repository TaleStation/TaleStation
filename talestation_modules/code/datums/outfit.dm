// Modular outfit datum stuff

/**
 * Copies the outfit from a human to itself.
 **/
/datum/outfit/proc/copy_outfit_from_target(mob/living/carbon/human/H)
	if(!istype(H))
		return
	if(H.back)
		back = H.back.type
	if(H.wear_id)
		id = H.wear_id.type
	if(H.w_uniform)
		uniform = H.w_uniform.type
	if(H.wear_suit)
		suit = H.wear_suit.type
	if(H.wear_mask)
		mask = H.wear_mask.type
	if(H.wear_neck)
		neck = H.wear_neck.type
	if(H.head)
		head = H.head.type
	if(H.shoes)
		shoes = H.shoes.type
	if(H.gloves)
		gloves = H.gloves.type
	if(H.ears)
		ears = H.ears.type
	if(H.glasses)
		glasses = H.glasses.type
	if(H.belt)
		belt = H.belt.type
	return TRUE
