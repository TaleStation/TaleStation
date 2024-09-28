/datum/storage/coat_rack
	max_total_storage = 30
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_slots = 4
	animated = FALSE

/datum/storage/coat_rack/New(
	atom/parent,
	max_slots,
	max_specific_storage,
	max_total_storage,
)
	. = ..()
	set_holdable(
		/obj/item/clothing/suit/hooded/wintercoat
	)
