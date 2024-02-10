/* Command Fax Machines
* You can send to CC with these fax machines
* Regular ones you can't
*/
/datum/design/board/fax_machine/command
	name = "Command Fax Machine Board"
	desc = "The circuit board for a Command Fax Machine."
	id = "command_fax_machine"
	build_path = /obj/item/circuitboard/machine/fax_machine/command

/obj/item/circuitboard/machine/fax_machine/command
	name = "Command Fax Machine"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/fax_machine/command

/obj/machinery/fax_machine/command
	name = "command fax machine"
	desc = "A machine made to send faxes and process paperwork. This one can send faxes to Central Command!. \
		Please use discretion when sending messages to Central Command."
	req_access = list(ACCESS_COMMAND)
	ui_name = "_FaxMachineCommand"
	base_icon_state = "command_fax"
	icon_state = "command_fax"
	fax_type = "command_fax"
	can_receive_paperwork = TRUE
	circuit = /obj/item/circuitboard/machine/fax_machine/command
	locked = TRUE

/obj/machinery/fax_machine/command/full/Initialize(mapload)
	. = ..()
	for(var/i in 1 to max_paperwork)
		if(LAZYLEN(received_paperwork) >= max_paperwork)
			continue
		LAZYADD(received_paperwork, generate_paperwork(src))

/obj/machinery/fax_machine/command/ui_data(mob/user)
	var/list/data = list()

	var/emagged = obj_flags & EMAGGED
	var/list/all_received_paperwork = list()
	var/iterator = 1
	for(var/obj/item/paper/processed/paper as anything in received_paperwork)
		var/list/found_paper_data = list()
		found_paper_data["title"] = paper.name
		found_paper_data["contents"] = TextPreview(remove_all_tags(paper.get_raw_text()), MAX_DISPLAYED_PAPER_CHARS)
		found_paper_data["required_answer"] = paper.required_question
		found_paper_data["ref"] = REF(paper)
		found_paper_data["num"] = iterator++
		all_received_paperwork += list(found_paper_data)
	if(all_received_paperwork.len)
		data["received_paperwork"] = all_received_paperwork

	if(stored_paper)
		var/list/stored_paper_data = list()
		stored_paper_data["title"] = stored_paper.name
		stored_paper_data["contents"] = TextPreview(remove_all_tags(stored_paper.get_raw_text()), MAX_DISPLAYED_PAPER_CHARS)
		stored_paper_data["ref"] = REF(stored_paper_data)
		data["stored_paper"] = stored_paper_data

	if(received_paper)
		var/list/received_paper_data = list()
		received_paper_data["title"] = received_paper.name
		received_paper_data["contents"] = TextPreview(remove_all_tags(received_paper.get_raw_text()), MAX_DISPLAYED_PAPER_CHARS)
		received_paper_data["source"] = received_paper.was_faxed_from
		received_paper_data["ref"] = REF(received_paper)
		data["received_paper"] = received_paper_data

	if(emagged)
		var/emagged_text = ""
		for(var/i in 1 to rand(4, 7))
			emagged_text += pick("!","@","#","$","%","^","&")
		data["display_name"] = emagged_text
	else if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		var/obj/item/card/id/our_id = human_user.wear_id?.GetID()
		data["display_name"] = our_id?.registered_name || "\[REDACTED\]"
	else if(issilicon(user))
		data["display_name"] = user.real_name
	else
		data["display_name"] = "\[REDACTED\]"

	data["can_send_cc_messages"] = (allowed(user) || emagged) && COOLDOWN_FINISHED(src, fax_cooldown)
	data["can_receive"] = can_receive_paperwork
	data["emagged"] = emagged
	data["unread_message"] = unread_message

	var/admin_destination = (emagged ? SYNDICATE_FAX_MACHINE : CENTCOM_FAX_MACHINE)
	var/list/possible_destinations = list()
	possible_destinations += admin_destination
	for(var/obj/machinery/fax_machine/command/machine as anything in GLOB.fax_machines)
		if(machine == src)
			continue
		if(!machine.room_tag)
			continue
		if(machine.room_tag in possible_destinations)
			continue
		possible_destinations += machine.room_tag
	data["destination_options"] = possible_destinations
	data["default_destination"] = admin_destination

	return data

/// Sends messages to the syndicate when emagged.
/obj/machinery/fax_machine/command/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return

	balloon_alert(user, "routing address overridden")
	playsound(src, 'sound/machines/terminal_alert.ogg', 25, FALSE)
	obj_flags |= EMAGGED

/// Wires for the fax machine
/datum/wires/fax_machine/command
	holder_type = /obj/machinery/fax_machine/command
	proper_name = "Command Fax Machine"

/datum/wires/fax_machine/command/New(atom/holder)
	wires = list(
		WIRE_SEND_FAXES,
		WIRE_RECEIVE_FAXES,
		WIRE_PAPERWORK,
	)
	add_duds(1)
	return ..()
