// Modular sci equipment

/obj/structure/closet/secure_closet/xeno_botany
	name = "xeno botany equipment locker"
	icon_state = "science"
	req_access = list(ACCESS_XENOBOTANY, ACCESS_XENOBIOLOGY)

/obj/structure/closet/secure_closet/xeno_botany/PopulateContents()
	. = ..()
	new /obj/item/xeno_analyzer(src)
	new /obj/item/circuitboard/machine/hydroponics/xeno(src)
	new /obj/item/circuitboard/machine/seed_extractor/xeno(src)
	new /obj/item/storage/bag/plants/xenobotany(src)
	new /obj/item/storage/box/seed_box(src)
