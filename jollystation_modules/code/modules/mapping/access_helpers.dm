// Modular access helpers for our jobs
// Where applicable

// Any

// Asset Protection
/obj/effect/mapping_helpers/airlock/access/any/command/ap/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_AP
	return access_list

// Bridge Officer
/obj/effect/mapping_helpers/airlock/access/any/command/bo/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_BO
	return access_list

// All

// Asset Protection
/obj/effect/mapping_helpers/airlock/access/all/command/ap/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_AP
	return access_list

// Bridge Officer
/obj/effect/mapping_helpers/airlock/access/all/command/bo/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_BO
	return access_list
