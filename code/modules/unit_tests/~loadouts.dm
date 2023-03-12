/// Test to check and make sure we don't have dupe items in loadouts under different selections
/datum/unit_test/loadouts_lists

TEST_FOCUS(/datum/unit_test/loadouts_lists)

/datum/unit_test/loadouts_lists/Run()
	var/datum/loadout_item/items = initial(loadout_item.shoes)
	TEST_ASSERT(2+ 3, 4, "HELP I'M ON FIRE")
