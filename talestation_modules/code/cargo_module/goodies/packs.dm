// -- Modular cargo packs --

#define GROUP_DRUGS "Prescriptions (Goodies)"

/datum/supply_pack/goody/oxycodone_syringe
	name = "Oxycodone Syringe"
	desc = "Contains three injections of Oxycodone, an extremely addictive but effective painkiller."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 4
	contains = list(
		/obj/item/reagent_containers/syringe/oxycodone
		)

/datum/supply_pack/goody/morphine_syringe
	name = "Morphine Syringe"
	desc = "Contains three injections of Morphine, an addictive painkiller used to treat moderate pain."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 3
	contains = list(
		/obj/item/reagent_containers/syringe/morphine
		)


/obj/item/storage/pill_bottle/prescription/aspirin_para_coffee
	pill_type = /obj/item/reagent_containers/pill/aspirin_para_coffee
	num_pills = 3

/datum/supply_pack/goody/aspirin_para_coffee
	name = "Aspirin/paracetamol/caffeine Prescription"
	desc = "Contains a pill bottle of aspirin/paracetamol/caffeine, a combination painkiller used to treat pain with few side effects."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 7.5
	contains = list(
		/obj/item/storage/pill_bottle/prescription/aspirin_para_coffee
		)

/obj/item/storage/pill_bottle/prescription/paracetamol
	pill_type = /obj/item/reagent_containers/pill/paracetamol
	num_pills = 3

/datum/supply_pack/goody/paracetamol
	name = "Paracetamol Prescription"
	desc = "Contains a pill bottle of Paracetamol."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 5
	contains = list(
		/obj/item/storage/pill_bottle/prescription/paracetamol
		)

/obj/item/storage/pill_bottle/prescription/aspirin
	pill_type = /obj/item/reagent_containers/pill/aspirin
	num_pills = 3

/datum/supply_pack/goody/aspirin
	name = "Aspirin Prescription"
	desc = "Contains a pill bottle of Aspirin."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 5
	contains = list(
		/obj/item/storage/pill_bottle/prescription/aspirin
		)

/obj/item/storage/pill_bottle/prescription/ibuprofen
	pill_type = /obj/item/reagent_containers/pill/ibuprofen
	num_pills = 3

/datum/supply_pack/goody/ibuprofen
	name = "Ibuprofen Prescription"
	desc = "Contains a pill bottle of Ibuprofen."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 5
	contains = list(
		/obj/item/storage/pill_bottle/prescription/ibuprofen
		)

/obj/item/storage/pill_bottle/prescription/happiness
	pill_type = /obj/item/reagent_containers/pill/happinesspsych
	num_pills = 5

/datum/supply_pack/goody/happiness
	name = "Mood Stabilizer Prescription"
	desc = "Contains a pill bottle of Mood Stabilizers. May contain Happiness."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 5
	contains = list(
		/obj/item/storage/pill_bottle/prescription/happiness
		)

/obj/item/storage/pill_bottle/prescription/psicodine
	pill_type = /obj/item/reagent_containers/pill/psicodine
	num_pills = 3

/datum/supply_pack/goody/happiness
	name = "Psicodine Prescription"
	desc = "Contains a pill bottle of Psicodine."
	group = GROUP_DRUGS
	cost = PAYCHECK_COMMAND * 5
	contains = list(
		/obj/item/storage/pill_bottle/prescription/psicodine
		)

/datum/supply_pack/medical/painkiller_syringes
	name = "Painkiller Syringe Shipment"
	desc = "Contains six syringes of general medicinal painkillers - Ibuprofen, Paracetamol, and Aspirin."
	cost = CARGO_CRATE_VALUE * 7.5
	crate_name = "syringe shipment"
	contains = list(
		/obj/item/reagent_containers/syringe/ibuprofen,
		/obj/item/reagent_containers/syringe/ibuprofen,
		/obj/item/reagent_containers/syringe/paracetamol,
		/obj/item/reagent_containers/syringe/paracetamol,
		/obj/item/reagent_containers/syringe/aspirin,
		/obj/item/reagent_containers/syringe/aspirin,
		)

/datum/supply_pack/medical/painkiller_pens
	name = "Painkiller Medipen Shipment"
	desc = "Contains three emergency painkiller medipens."
	cost = CARGO_CRATE_VALUE * 4
	crate_name = "medipen shipment"
	contains = list(
		/obj/item/reagent_containers/hypospray/medipen/emergency_painkiller,
		/obj/item/reagent_containers/hypospray/medipen/emergency_painkiller,
		/obj/item/reagent_containers/hypospray/medipen/emergency_painkiller,
	)
