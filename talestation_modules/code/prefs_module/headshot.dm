// Headshot for flavor text, ported from SkyRat

#define LENGTH_LONGEST_LINK 29 //set to the length to the char length of the longest link
#define LENGTH_LONGEST_EXTENSION 4 //set to the length of the longest file extension

/* Headshots disabled until further notice
// Pref option for headshots
// May need to be regulated sooner than later
/datum/preference/text/headshot
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "headshot"
	/// Assoc list of ckeys and their link, used to cut down on chat spam
	var/list/stored_link = list()
	var/static/link_regex = regex("^https://i.gyazo.com|https://media.discordapp.net|https://cdn.discordapp.com|https://media.discordapp.net$") //Do not touch the damn duplicates.
	var/static/end_regex = regex("^.jpg|.jpg|.png|.jpeg|.jpeg$") //Regex is terrible, don't touch the duplicate extensions


// Apply the headshot to people
/datum/preference/text/headshot/apply_to_human(mob/living/carbon/human/target, value)
	target?.dna.features["headshot"] = value

// Probably sanity checks for headshots, this code was ported idfk, it wasn't fucking documented
// So why am I doing it? Because I want to, fuck you
/datum/preference/text/headshot/is_valid(value)
	if(!length(value)) // Just to get blank ones out of the way
		usr?.client?.prefs?.headshot = null
		return TRUE
	if(!findtext(value, "https://", 1, 9))
		to_chat(usr, span_warning("You need \"https://\" in the link!"))
		return
	if(!findtext(value, end_regex, abs(LENGTH_LONGEST_EXTENSION - length(value)), length(value)))
		to_chat(usr, span_warning("You need either \".png\", \".jpg\", or \".jpeg\" in the link!"))
		return
	if(!findtext(value, link_regex, 1, LENGTH_LONGEST_LINK))
		to_chat(usr, span_warning("The link needs to be an unshortened Gyazo or Discordapp link!"))
		return
	if(!stored_link[usr?.ckey])
		stored_link[usr?.ckey] = null
	if(stored_link[usr?.ckey] != value)
		to_chat(usr, span_notice("Please use a relatively SFW image of the head and shoulder area to maintain immersion level. Think of it as a headshot for your ID. Lastly, [span_bold("do not use a real life photo or use any image that is less than serious.")]"))
		to_chat(usr, span_notice("If the photo doesn't show up properly in-game, ensure that it's a direct image link that opens properly in a browser."))
		to_chat(usr, span_notice("Keep in mind that the photo will be downsized to 250x250 pixels, so the more square the photo, the better it will look."))
		log_game("[usr] has set their Headshot image to '[value]'.")
	stored_link[usr?.ckey] = value
	usr?.client?.prefs.headshot = value
	return TRUE

/datum/preference/text/headshot/is_accessible(datum/preferences/preferences)
	if(isnull(usr)) // Joining at roundstart
		return ..()
	return ..()

#undef LENGTH_LONGEST_LINK
#undef LENGTH_LONGEST_EXTENSION
*/
