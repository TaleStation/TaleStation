// NuLizard stuff

// NuLizard modifers + organs
/datum/species/lizard
	mutantstomach = /obj/item/organ/internal/stomach/lizard
	mutantliver = /obj/item/organ/internal/liver/lizard
	mutantheart = /obj/item/organ/internal/heart/second_heart
	toxmod = 1.25
	blood_gain_multiplier = 0.5

// On-species gain surgery mod
/datum/species/lizard/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = .. ()
	RegisterSignal(C, COMSIG_CARBON_GAIN_ORGAN, .proc/on_gained_organ)
	RegisterSignal(C, COMSIG_CARBON_LOSE_ORGAN, .proc/on_removed_organ)
	C.mob_surgery_speed_mod -= 0.50

/datum/species/lizard/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = .. ()
	C.mob_surgery_speed_mod += 0.50
	C.remove_client_colour(/datum/client_colour/monochrome/lizard)
	return ..()

// Organs and functions
/obj/item/organ/internal/heart/second_heart
	name = "second heart"
	desc = "Wow, those lizards sure are full of heart."
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state = "second_heart"
	healing_factor = 1.5 * STANDARD_ORGAN_HEALING
	decay_factor = 1.5 * STANDARD_ORGAN_DECAY
	/// How much blood we regenerate
	var/regen_modifier = 0.5

/obj/item/organ/internal/liver/lizard
	name = "lizard liver"
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state = "liver-l"
	desc = "Due to a low number of natural poisons on Tizira, lizard livers have a lower tolerance for poisons when compared to human ones."
	toxTolerance = 2

/obj/item/organ/internal/stomach/lizard
	name = "lizard stomach"
	icon = 'talestation_modules/icons/obj/surgery.dmi'
	icon_state = "stomach-l"
	desc = "Lizards have evolved highly efficient stomachs, made to get nutrients out of what they eat as fast as possible."
	metabolism_efficiency = 0.07

// Organ functions
/obj/item/organ/internal/heart/second_heart/on_life(seconds_per_tick, times_fired)
	..()
	if(!owner.needs_heart() || owner.blood_volume >= BLOOD_VOLUME_NORMAL)
		return
	if(organ_flags & ORGAN_FAILING)
		var/bleed_amount = 0
		for(var/mob/living/carbon/part as anything in owner.bodyparts)
			bleed_amount += part.get_bleed_rate() * seconds_per_tick
		if(bleed_amount)
			owner.bleed(bleed_amount)
			owner.bleed_warn(bleed_amount)
	else
		owner.blood_volume = min(owner.blood_volume + (BLOOD_REGEN_FACTOR * regen_modifier * seconds_per_tick), BLOOD_VOLUME_NORMAL)

/obj/item/organ/internal/stomach/lizard/handle_hunger(mob/living/carbon/human/human, seconds_per_tick, times_fired)
	. = ..()
	if(human.nutrition > NUTRITION_LEVEL_WELL_FED && human.nutrition < NUTRITION_LEVEL_FULL)
		human.adjustBruteLoss(-0.5 * seconds_per_tick)

/obj/item/organ/internal/tongue/lizard
	taste_sensitivity = LIZARD_TASTE_SENSITIVITY // combined nose + tongue, extra sensitive

// Losing your tongue related procs
/datum/species/lizard/proc/on_gained_organ(mob/living/receiver, obj/item/organ/internal/tongue/tongue)
	SIGNAL_HANDLER

	if(!istype(tongue) || !(tongue.taste_sensitivity <= LIZARD_TASTE_SENSITIVITY))
		return
	receiver.remove_client_colour(/datum/client_colour/monochrome/lizard)

/datum/species/lizard/proc/on_removed_organ(mob/living/unceiver, obj/item/organ/internal/tongue/tongue)
	SIGNAL_HANDLER

	if(!istype(tongue) || tongue.taste_sensitivity > LIZARD_TASTE_SENSITIVITY)
		return
	unceiver.add_client_colour(/datum/client_colour/monochrome/lizard)

