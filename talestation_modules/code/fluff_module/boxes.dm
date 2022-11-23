// Modular boxes + contents

// Box of office supplies; goes in the BO locker
/obj/item/storage/box/office_supplies
	name = "box of office supplies"
	desc = "Sometimes you get the itch to go buy a new pen. Don't, your box has you covered."

/obj/item/storage/box/office_supplies/PopulateContents()
	new /obj/item/pen/red(src)
	new /obj/item/pen/blue(src)
	new /obj/item/pen/fountain(src)
	new /obj/item/stamp(src)
	new /obj/item/stamp/denied(src)

// Box of department arm bands; goes in the AP locker
/obj/item/storage/box/dept_armbands
	name = "box of department armbands"
	desc = "Show off which department you'll guard today! Or which head of staff you'll annoy the piss out of. Free of charge!"

/obj/item/storage/box/dept_armbands/PopulateContents()
	new /obj/item/clothing/accessory/armband/cargo(src)
	new /obj/item/clothing/accessory/armband/engine(src)
	new /obj/item/clothing/accessory/armband/science(src)
	new /obj/item/clothing/accessory/armband/medblue(src)
	new /obj/item/clothing/accessory/armband/service(src)

// Box of seeds for the XenoBotanist

/obj/item/storage/box/seed_box
	name = "box of assorted seeds"
	desc = "Get your scientific green thumb ready with this handy box of assorted seeds!"

/obj/item/storage/box/seed_box/PopulateContents()
	if(prob(50))
		new /obj/item/seeds/orange_3d(src)
	else
		new /obj/item/seeds/firelemon(src)
	if(prob(99))
		new /obj/item/seeds/cherry/bomb(src)
	else
		new /obj/item/seeds/gatfruit(src)
	if(prob(25))
		new /obj/item/seeds/tomato/killer(src)
	else
		new /obj/item/seeds/plump/walkingmushroom(src)
	new /obj/item/seeds/grass/carpet(src)
	new /obj/item/seeds/random(src)
	for(var/i in 1 to 3)
		new /obj/item/seeds/replicapod(src)
