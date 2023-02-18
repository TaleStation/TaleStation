// -- Modular toungue stuff, mostly language --
/obj/item/organ/internal/tongue
	var/static/list/languages_possible_modular = typecacheof(list(
	//	/datum/language/ratvarian
	))

/obj/item/organ/internal/tongue/get_possible_languages()
	. = ..() + languages_possible_modular

/obj/item/organ/internal/tongue/lizard
	languages_native = list(/datum/language/draconic, /datum/language/impdraconic)
