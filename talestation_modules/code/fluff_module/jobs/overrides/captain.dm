/*
* This file primarily changes the name of "captain" to "site director"
*/

// Changes spare id desc
/obj/item/paper/paperslip/corporate/fluff/spare_id_safe_code
	desc = "Proof that you have been approved for temporary leadership, with all its glory and all its horror."

// Changes emergency spare desc
/obj/item/paper/paperslip/corporate/fluff/emergency_spare_id_safe_code
	desc = "Proof that nobody has been approved for temporary leadership. A skeleton key for a skeleton shift."

// Changes captain ian stuff
/datum/dog_fashion/head/captain
	name = "Director REAL_NAME"
	desc = "Probably better than the last Director."

// Changes mission for ert
/datum/ert/centcom_official/New()
	mission = "Conduct a routine performance review of [station_name()] and its Director."

// Changes pda name
/datum/greyscale_config/tablet/captain
	name = "Site Director PDA"

// Changes trim info
/datum/id_trim/job/captain
	assignment = "Site Director"
	intern_alt_name = "Director-in-Training"

// Changes area define names
/area/station/command/heads_quarters/captain
	name = "\improper Site Director's Office"

/area/station/command/heads_quarters/captain/private
	name = "\improper Site Director's Quarters"

// Changes objective names
/datum/objective_item/steal/traitor/captain_modsuit
	name = "the site director's magnate MOD control unit"

/datum/objective_item/steal/traitor/captain_spare
	name = "the site director's spare ID"

/datum/objective_item/steal/caplaser
	name = "the site director's antique laser gun"

/datum/objective_item/steal/jetpack
	name = "the site director's jetpack"

/datum/objective_item/steal/capmedal
	name = "the medal of leadership"

// Changes poster name + desc
/obj/structure/sign/poster/quirk/crew/renault
	name = "Site Director's Pet"
	desc = "A poster depicting the Site Director's beloved Renault. He's ok. \
	When people read this poster they'll feel better!"

// Changes spare name + desc
/obj/item/card/id/advanced/gold/captains_spare
	name = "site director's spare ID"
	desc = "The spare ID of the Sir Asshole themself."
	registered_name = "Site Director"

// Changes charter desc
/obj/item/station_charter
	desc = "An official document entrusting the governance of the station \
		and surrounding space to the Site Director."

// Changes muutator desc
/obj/item/dnainjector/xraymut
	desc = "Finally you can see what the Site Director is doing."

// Changes toy name + desc
/obj/item/toy/captainsaid
	name = "\improper Shipmans's Aid"
	desc = "Every Shipmate's greatest ally when exploring the vast emptiness of space, now with a color display!"

/obj/item/toy/captainsaid/collector
	name = "\improper Collector's Edition Shipmans's Aid"
	desc = "A copy of the first run of the Shipmate's Aid ever released. Functionally the same as the later batches, just more expensive. For the truly aristocratic."

/obj/item/toy/figure/captain
	name = "\improper Site Director action figure"

// Changes encryption key + headset name
/obj/item/encryptionkey/heads/captain
	name = "\proper the site director's encryption key"

/obj/item/radio/headset/heads/captain
	name = "\proper the site director's headset"

/obj/item/radio/headset/heads/captain/alt
	name = "\proper the site director's bowman headset"

// Changes clusterbuster desc
/obj/item/grenade/clusterbuster
	desc = "Use of this weapon may constitute a war crime in your area, consult your local Site Director."

// Changes backpack names + desc
/obj/item/storage/backpack/captain
	name = "site director's backpack"
	desc = "It's a special backpack made exclusively for Nanotrasen Overseers."

/obj/item/storage/backpack/satchel/cap
	name = "site director's satchel"
	desc = "An exclusive satchel for Nanotrasen Overseers."

/obj/item/storage/backpack/duffelbag/captain
	name = "site director's duffel bag"
	desc = "A large duffel bag for holding that damn disk."

// Changes garment bag name + desc
/obj/item/storage/bag/garment/captain
	name = "site director's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the Site Director."

// Changes spare safe name + desc
/obj/item/storage/secure/safe/caps_spare
	name = "site director's spare ID safe"
	desc = "In case of emergency, do not break glass. All Site Director's and Acting Director's are provided with codes to access this safe. \
It is made out of the same material as the station's Black Box and is designed to resist all conventional weaponry. \
There appears to be a small amount of surface corrosion. It doesn't look like it could withstand much of an explosion.\
It remains quite flush against the wall, and there only seems to be enough room to fit something as slim as an ID card."

// Changes jetpack name
/obj/item/tank/jetpack/oxygen/captain
	name = "site director's jetpack"

// Changes bedsheet name + desc
/obj/item/bedsheet/captain
	name = "site director's bedsheet"
	desc = "It has a Nanotrasen symbol on it, and was woven with a\
		 revolutionary new kind of thread guaranteed to have 0.01% permeability\
		  for most non-chemical substances, popular among most modern Site Directors."
	dream_messages = list("authority", "a golden ID", "sunglasses", "a green disc", "an antique gun", "the site director")

// Changes notice board name + desc
/obj/structure/noticeboard/captain
	name = "Site Director's Notice Board"
	desc = "Important notices from the Site Director."

// Changes locker name
/obj/structure/closet/secure_closet/captains
	name = "\proper site director's locker"

// Changes plaque name
/obj/structure/plaque/static_plaque/golden/captain
	name = "The Most Confident Site Director Award for 'Putting Up With the Crews Shit'."

// Changes beer nuke desc
/obj/machinery/nuclearbomb/beer
	desc = "One of the more successful achievements of the Nanotrasen Corporate Warfare Division,\
	 their nuclear fission explosives are renowned for being cheap to produce and devastatingly effective.\
	  Signs explain that though this particular device has been decommissioned, every Nanotrasen station is equipped with an equivalent one,\
	   just in case. All Site Directors carefully guard the disk needed to detonate them - at least, the sign says they do. There seems to be a tap on the back."

// Changes grand finale wiz stuff
/datum/grand_finale/usurp
	desc = "The ultimate use of your gathered power! Rewrite time such that you have been the Site Director of this station the whole time."

/datum/outfit/job/wizard_captain
	name = "Site Director (Wizard Transformation)"

// Changes statue name
/obj/structure/statue/diamond/captain
	name = "statue of THE Site Director."

// Changes science hud desc
/obj/item/clothing/glasses/hud/health/night/science
	desc = "An clandestine medical science heads-up display that allows operatives to find \
		dying Site Directors and the perfect poison to finish them off in complete darkness."

// Changes plasmaman gloves desc
/obj/item/clothing/gloves/color/plasmaman/head_of_personnel
	desc = "Covers up those scandalous, bony hands. Appears to be an attempt at making a replica of the Site Director's gloves."

// Changes gloves names
/obj/item/clothing/gloves/captain
	name = "site director's gloves"

// Changes collectable hat name
/obj/item/clothing/head/collectable/captain
	name = "collectable site director's hat"

// Changes attire name
/obj/item/clothing/head/hats/caphat
	name = "site director's hat"

/obj/item/clothing/head/hats/caphat/parade
	name = "site director's parade cap"
	desc = "Worn only by Site Directors with an abundance of class."

/obj/item/clothing/head/caphat/beret
	name = "site director's beret"
	desc = "For the Site Directors known for their questionable sense of fashion."

// Changes gasmask name
/obj/item/clothing/mask/gas/atmos/captain
	name = "site director's gas mask"

// Changes plasmaman datum name
/datum/outfit/plasmaman/captain
	name = "Site Director Plasmaman"

// Changes plasmaman stuff
/obj/item/clothing/head/helmet/space/plasmaman/captain
	name = "site director's plasma envirosuit helmet"
	desc = "A special containment helmet designed for the Site Director. \
	Embarrassingly enough, it looks way too much like the Asset Clerk's design save for the gold stripes. I mean, come on. Gold stripes can fix anything."

// Changes armor names
/obj/item/clothing/suit/armor/vest/capcarapace
	name = "site director's carapace"

/obj/item/clothing/suit/armor/vest/capcarapace/captains_formal
	name = "site director's parade coat"

// Changes cloak name
/obj/item/clothing/neck/cloak/cap
	name = "site director's cloak"

// Changes parade jacket name
/obj/item/clothing/suit/jacket/capjacket
	name = "site director's parade jacket"
	desc = "Worn by a Site Director to show their class."

// Changes winter coat name
/obj/item/clothing/suit/hooded/wintercoat/captain
	name = "site director's winter coat"

// Changes medal desc
/obj/item/clothing/accessory/medal/conduct
	desc = "A bronze medal awarded for distinguished conduct. Whilst a great honor, this is the most basic award given by Nanotrasen. \
	It is often awarded by a Site Director to a member of his crew."

/obj/item/clothing/accessory/medal/gold/captain
	name = "medal of leadership"
	desc = "A golden medal awarded exclusively to those promoted to the rank of Site Director. \
	It signifies the codified responsibilities of a Site Director to Nanotrasen, and their undisputable authority over their crew."

// Changes outfits names
/obj/item/clothing/under/rank/captain
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Site Director\"."
	name = "site director's jumpsuit"

/obj/item/clothing/under/rank/captain/skirt
	name = "site director's jumpskirt"
	desc = "It's a blue jumpskirt with some gold markings denoting the rank of \"Site Director\"."

/obj/item/clothing/under/rank/captain/suit
	name = "site director's suit"

/obj/item/clothing/under/rank/captain/parade
	name = "site director's parade uniform"
	desc = "A Site Director's luxury-wear, for special occasions."

/obj/item/clothing/under/plasmaman/captain
	name = "site director's plasma envirosuit"
	desc = "It's a blue envirosuit with some gold markings denoting the rank of \"Site Director\"."

// Changes datum
/datum/outfit/job/captain
	name = "Site Director"

/datum/outfit/job/captain/mod
	name = "Site Director (MODsuit)"

// Changes acting captain announcements
/datum/job/captain/get_captaincy_announcement(mob/living/captain)
	return "Site Director [captain.real_name] on deck!"

/datum/job/chief_engineer/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Site Director [captain.real_name] on deck!"

/datum/job/chief_medical_officer/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Site Director [captain.real_name] on deck!"

/datum/job/head_of_personnel/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Site Director [captain.real_name] on deck!"

/datum/job/head_of_security/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Site Director [captain.real_name] on deck!"

/datum/job/quartermaster/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Site Director [captain.real_name] on deck!"

/datum/job/research_director/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Site Director [captain.real_name] on deck!"

// Changes renault desc
/mob/living/simple_animal/pet/fox/renault
	desc = "Renault, the Site Director's trustworthy fox."

// Changes mod theme desc
/datum/mod_theme/magnate
	desc = "A fancy, very protective suit for Nanotrasen's Site Directors. Shock, fire and acid-proof while also having a large capacity and high speed."
	extended_desc = "They say it costs four hundred thousand credits to run this MODsuit... for twelve seconds. \
		The Magnate suit is designed for protection, comfort, and luxury for Nanotrasen Site Directors. \
		The onboard air filters have been preprogrammed with an additional five hundred different fragrances that can \
		be pumped into the helmet, all of highly-endangered flowers. A bespoke Tralex mechanical clock has been placed \
		in the wrist, and the Magnate package comes with carbon-fibre cufflinks to wear underneath. \
		My God, it even has a granite trim. The double-classified paint that's been painstakingly applied to the hull \
		provides protection against shock, fire, and the strongest acids. Onboard systems employ meta-positronic learning \
		and bluespace processing to allow for a wide array of onboard modules to be supported, and only the best actuators \
		have been employed for speed. The resemblance to a Gorlex Marauder helmet is purely coincidental."

/obj/item/mod/module/hat_stabilizer
	desc = "A simple set of deployable stands, directly atop one's head; \
		these will deploy under a select few hats to keep them from falling off, allowing them to be worn atop the sealed helmet. \
		You still need to take the hat off your head while the helmet deploys, though. \
		This is a must-have for Nanotrasen Site Directors, enabling them to show off their authoritative hat even while in their MODsuit."

// Changes PDA
/obj/item/modular_computer/pda/heads/captain
	name = "site director PDA"

// Changes data disk
/obj/item/computer_disk/command/captain
	name = "site director data disk"
	desc = "Removable disk used to download essential Site Director tablet apps."

// Changes pen name
/obj/item/pen/fountain/captain
	name = "site director's fountain pen"

// Changes stamp namee
/obj/item/stamp/captain
	name = "site director's rubber stamp"

// Changes album name
/obj/item/storage/photo_album/captain
	name = "photo album (Site Director)"

// Changes flask name + desc
/obj/item/reagent_containers/cup/glass/flask/gold
	name = "site director's flask"
	desc = "A gold flask belonging to the Site Director."

// Changes fluff text
/datum/scientific_partner/baron
	flufftext = "A nearby research station ran by a very wealthy Site Director seems to be struggling with their scientific output. \
	They might reward us handsomely if we ghostwrite for them."

// Changes uplink stuff
/datum/uplink_item/badass/costumes/centcom_official
	desc = "Ask the crew to \"inspect\" their nuclear disk and weapons system, and then when they decline, pull out a fully automatic rifle and gun down the Site Director. \
			Radio headset does not include encryption key. No gun included."

/datum/uplink_item/device_tools/fakenucleardisk
	desc = "It's just a normal disk. Visually it's identical to the real deal, but it won't hold up under closer scrutiny by the Site Director. \
		Don't try to give this to us to complete your objective, we know better!"
