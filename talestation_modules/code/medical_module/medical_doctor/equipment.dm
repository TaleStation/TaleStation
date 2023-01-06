// Equipment additions to the MD job
// Not in the jobs module since its adding medical content

// Fluff paper that was added to the outfit
/obj/item/paper/fluff/doctors_pain
	name = "DOCTORS NOTICE: I'm in immense pain!"
	default_raw_text = "<b>Pain and YOU!</b><br><br> A comprehensive piece of paper to how to treat and deal with pain! \
						<br><br>Pain can affect anyone on the station, even the Captain who stubbed his toe! So, how can you treat pain? \
						Simple!<br><br>The most common way is to use pain killers. Don't know how to make them? They're easy!<br><br> \
						<b>Recipies</B><br><br> Aspirin - 1u Salyclic Acid, Acetone and Oxygen. Don't forget your catalyst of Sulfuric Acid! (1u). \
						<br><br>Paracetamol - 1u Phenol, Acetone, Hydrogen, Oxygen and Nitric Acid.<br><br>Ibuprofen - 1u Propionic Acid, Phenol, Oyxgen and Hydrogen. \
						<br><br>To make Propinoic Acid you will need 1u Carbon, Oxygen and Hydrogen and your catalyst of Sulfuric Acid. \
						You'll need to heat this up to about 225 K. \
						This is a key component don't forget it!<br><br> \
						<b>Other Notes</b><br><br>Miners may be a concern, but they're fortunate enough to have a skillchip to mitigate pain on them! \
						When they're not on the station, of course.<br><br>If you have any further questions, don't hesitate to contact the head of your ward."

// Adds pain paper to medicals outfits
/datum/outfit/job/cmo
	backpack_contents = list(
		/obj/item/paper/fluff/doctors_pain = 1,
		/obj/item/melee/baton/telescopic = 1,
	)

/datum/outfit/job/doctor
	backpack_contents = list(
		/obj/item/paper/fluff/doctors_pain = 1,
	)

/datum/outfit/job/paramedic
	backpack_contents = list(
		/obj/item/paper/fluff/doctors_pain = 1,
	)

/datum/outfit/job/chemist
	backpack_contents = list(
		/obj/item/paper/fluff/doctors_pain = 1,
	)
