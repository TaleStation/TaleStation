// Modular sci equipment

/obj/structure/closet/secure_closet/xeno_botany
	name = "xeno botany equipment locker"
	icon_state = "science"
	req_access = list(ACCESS_RESEARCH)

/obj/structure/closet/secure_closet/xeno_botany/PopulateContents()
	. = ..()
	new /obj/item/xeno_analyzer(src)
	new /obj/item/circuitboard/machine/hydroponics_xeno(src)
	new /obj/item/storage/bag/plants(src)
	new /obj/item/storage/box/seed_box(src)
