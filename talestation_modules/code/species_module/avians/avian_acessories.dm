/datum/sprite_accessory/snout/avian_beak
	icon = 'talestation_modules/icons/species/avians/avian_beaks.dmi'
	color_src = 0

/datum/sprite_accessory/tail/avian_tail
	icon = 'talestation_modules/icons/species/avians/avian_tails.dmi'

/datum/sprite_accessory/snout/avian_beak/regular
	name = "Regular Beak"
	icon_state = "regular"

/datum/sprite_accessory/snout/avian_beak/finch
	name = "Finch Beak"
	icon_state = "finch"

/datum/sprite_accessory/snout/avian_beak/small
	name = "Small Beak"
	icon_state = "small"

/datum/sprite_accessory/snout/avian_beak/parrot
	name = "Parrot Beak"
	icon_state = "parrot"

/datum/sprite_accessory/snout/avian_beak/tiny
	name = "Tiny Beak"
	icon_state = "tiny"

/datum/sprite_accessory/snout/avian_beak/tropical
	name = "Tropical Beak"
	icon_state = "tropical"

/datum/sprite_accessory/snout/avian_beak/shoebill
	name = "Shoebill Bill"
	icon_state = "shoebill"

/datum/sprite_accessory/snout/avian_beak/duck
	name = "Duck Bill"
	icon_state = "duck"

/*
* Avian Tails
*/

/datum/sprite_accessory/tail/avian_tail/wide
	name = "Wide Tail"
	icon_state = "wide"

/datum/sprite_accessory/tail/avian_tail/short
	name = "Short Tail"
	icon_state = "short"

/datum/sprite_accessory/tail/avian_tail/owl
	name = "Owl Tail"
	icon_state = "owl"

/datum/sprite_accessory/tail/avian_tail/long
	name = "Long Tail"
	icon_state = "long"

/*
* Legs
* This is used to pass info into assoc lists
*/

/datum/sprite_accessory/avian_legs
	name = "Avian Legs"

/datum/sprite_accessory/avian_legs/talon_planti
	name = "Planti Talons"

/datum/sprite_accessory/avian_legs/talon_webbed
	name = "Planti Webbed Feet"

/datum/sprite_accessory/avian_legs/talon_digi
	name = "Digi Talons"

/datum/sprite_accessory/avian_legs/webbed_digi
	name = "Digi Webbed Feet"

/*
* Avian Hair
*/

/datum/sprite_accessory/avian_crest
	icon = 'talestation_modules/icons/species/avians/avian_crest.dmi'
	name = "Avian Hair"
	color_src = MUTANT_COLOR

/datum/sprite_accessory/avian_crest/kepori
	name = "Kepori"
	icon_state = "kepori"

/datum/sprite_accessory/avian_crest/ears
	name = "Ears"
	icon_state = "ears"

/datum/sprite_accessory/avian_crest/high
	name = "High"
	icon_state = "high"

/datum/sprite_accessory/avian_crest/spiked
	name = "Spiked"
	icon_state = "spiked"

/datum/sprite_accessory/avian_crest/slick
	name = "Slick"
	icon_state = "slick"

/datum/sprite_accessory/avian_crest/moptop
	name = "Moptop"
	icon_state = "moptop"

/datum/sprite_accessory/avian_crest/daft
	name = "Daft"
	icon_state = "daft"

/datum/sprite_accessory/avian_crest/no_hair
	name = "No Crest"
	icon_state = "crestless"

/*
* Sprite overlays for talons
* These get applied to the legs, funky business!
*/

/datum/bodypart_overlay/simple/avian_feet
	icon = 'talestation_modules/icons/species/avians/avian_talons.dmi'
	layers = EXTERNAL_ADJACENT
	draw_color = "#d09a4b"

// PLANTI //

// TALONS //

/datum/bodypart_overlay/simple/avian_feet/talon_l_planti
	icon_state = "avian_talon_l_planti"

/datum/bodypart_overlay/simple/avian_feet/talon_r_planti
	icon_state = "avian_talon_r_planti"

// WEBBED FEET //

/datum/bodypart_overlay/simple/avian_feet/web_l_planti
	icon_state = "avian_web_l_planti"

/datum/bodypart_overlay/simple/avian_feet/web_r_planti
	icon_state = "avian_web_r_planti"

// DIGI //

// TALONS //

/datum/bodypart_overlay/simple/avian_feet/talon_l_digi
	icon_state = "avian_talon_l_digi"

/datum/bodypart_overlay/simple/avian_feet/talon_r_digi
	icon_state = "avian_talon_r_digi"

// WEBBED FEET //

/datum/bodypart_overlay/simple/avian_feet/web_l_digi
	icon_state = "avian_web_l_digi"

/datum/bodypart_overlay/simple/avian_feet/web_r_digi
	icon_state = "avian_web_r_digi"
