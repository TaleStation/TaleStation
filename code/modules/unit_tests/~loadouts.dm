/// Test to check and make sure we don't have dupe items in loadouts under different selections
/datum/unit_test/loadouts_lists

TEST_FOCUS(/datum/unit_test/loadouts_lists)

/datum/unit_test/loadouts_lists/Run()
	var/list/item_paths = list()
	for(var/datum/loadout_item/type in subtypesof(/datum/loadout_item))
		var/item_path = initial(type.item_path)
		if(item_path in item_paths)
			TEST_FAIL("Duplicate path [item_path] used by [type]!")
		item_paths += item_path
