// -- Extra human level procc etensions. --
/mob/living/carbon/human/Topic(href, href_list)
	. = ..()
	if(href_list["flavor_text"])
		if(client)
			var/datum/browser/popup = new(usr, "[name]'s flavor text", "[name]'s Flavor Text (expanded)", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s flavor text (expanded)", replacetext(client.prefs.flavor_text, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["general_records"])
		if(client)
			var/datum/browser/popup = new(usr, "[name]'s gen rec", "[name]'s General Record", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s general records", replacetext(client.prefs.general_records, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["security_records"])
		if(client)
			var/datum/browser/popup = new(usr, "[name]'s sec rec", "[name]'s Security Record", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s security records", replacetext(client.prefs.security_records, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["medical_records"])
		if(client)
			var/datum/browser/popup = new(usr, "[name]'s med rec", "[name]'s Medical Record", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s medical records", replacetext(client.prefs.medical_records, "\n", "<BR>")))
			popup.open()
			return

	if(href_list["exploitable_info"])
		if(client)
			var/datum/browser/popup = new(usr, "[name]'s exp info", "[name]'s Exploitable Info", 500, 200)
			popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s exploitable information", replacetext(client.prefs.exploitable_info, "\n", "<BR>")))
			popup.open()
			return
