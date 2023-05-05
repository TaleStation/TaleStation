// Paperwork related icon overrides

/obj/item/stamp/head
	/// Var for required_map_items unit test
	var/is_unit_testable = TRUE

// Asset Protection stamper
/obj/item/stamp/head/ap
	name = "the asset protection's rubber stamp"
	icon = 'talestation_modules/icons/objects/bureaucracy.dmi'
	icon_state = "stamp-ap"
	is_unit_testable = FALSE

// Bridge Officer stamper
/obj/item/stamp/head/bo
	name = "the bridge officer's rubber stamp"
	icon = 'talestation_modules/icons/objects/bureaucracy.dmi'
	icon_state = "stamp-bo"
	is_unit_testable = FALSE

