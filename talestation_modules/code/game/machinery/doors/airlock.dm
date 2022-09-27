#define AIRLOCK_LIGHT_POWER 1
#define AIRLOCK_LIGHT_RANGE 2
#define AIRLOCK_POWERON_LIGHT_COLOR "#3aa7c2"
#define AIRLOCK_BOLTS_LIGHT_COLOR "#c23b23"
#define AIRLOCK_ACCESS_LIGHT_COLOR "#57e69c"
#define AIRLOCK_EMERGENCY_LIGHT_COLOR "#d1d11d"
#define AIRLOCK_DENY_LIGHT_COLOR "#c23b23"

#define AIRLOCK_CLOSED	1
#define AIRLOCK_CLOSING	2
#define AIRLOCK_OPEN	3
#define AIRLOCK_OPENING	4
#define AIRLOCK_DENY	5
#define AIRLOCK_EMAG	6

/obj/machinery/door/airlock
	var/obj/effect/overlay/vis_airlock/vis_overlay1
	var/obj/effect/overlay/vis_airlock/vis_overlay2
	doorOpen = 'talestation_modules/sound/machines/airlocks/open.ogg'
	doorClose = 'talestation_modules/sound/machines/airlocks/close.ogg'
	doorDeni = 'talestation_modules/sound/machines/airlocks/access_denied.ogg'
	boltUp = 'talestation_modules/sound/machines/airlocks/bolts_up.ogg'
	boltDown = 'talestation_modules/sound/machines/airlocks/bolts_down.ogg'
	//noPower = 'sound/machines/doorclick.ogg'
	var/forcedOpen = 'talestation_modules/sound/machines/airlocks/open_force.ogg' //Come on guys, why aren't all the sound files like this.
	var/forcedClosed = 'talestation_modules/sound/machines/airlocks/close_force.ogg'

	var/has_environment_lights = TRUE //Does this airlock emit a light?
	var/light_color_poweron = AIRLOCK_POWERON_LIGHT_COLOR
	var/light_color_bolts = AIRLOCK_BOLTS_LIGHT_COLOR
	var/light_color_access = AIRLOCK_ACCESS_LIGHT_COLOR
	var/light_color_emergency = AIRLOCK_EMERGENCY_LIGHT_COLOR
	var/light_color_deny = AIRLOCK_DENY_LIGHT_COLOR
	var/door_light_range = AIRLOCK_LIGHT_RANGE
	var/door_light_power = AIRLOCK_LIGHT_POWER
	///Is this door external? E.g. does it lead to space? Shuttle docking systems bolt doors with this flag.
	var/external = FALSE

/obj/machinery/door/airlock/external
	external = TRUE

/obj/machinery/door/airlock/shuttle
	external = TRUE

/obj/effect/overlay/vis_airlock
	layer = 0
	plane = 200
	vis_flags = VIS_INHERIT_ID

/obj/machinery/door/airlock/Destroy()
	. = ..()
	vis_contents -= vis_overlay1
	vis_contents -= vis_overlay2
	QDEL_NULL(vis_overlay1)
	QDEL_NULL(vis_overlay2)

/obj/machinery/door/airlock/power_change()
	..()
	update_icon()

/obj/machinery/door/airlock/update_overlays()
	. = ..()
	var/pre_light_range = 0
	var/pre_light_power = 0
	var/pre_light_color = ""
	var/lights_overlay = ""

	var/frame_state
	var/light_state
	switch(airlock_state)
		if(AIRLOCK_CLOSED)
			frame_state = AIRLOCK_FRAME_CLOSED
			if(locked)
				light_state = AIRLOCK_LIGHT_BOLTS
				lights_overlay = "lights_bolts"
				pre_light_color = light_color_bolts
			else if(emergency)
				light_state = AIRLOCK_LIGHT_EMERGENCY
				lights_overlay = "lights_emergency"
				pre_light_color = light_color_emergency
			else
				lights_overlay = "lights_poweron"
				pre_light_color = light_color_poweron
		if(AIRLOCK_DENY)
			frame_state = AIRLOCK_FRAME_CLOSED
			light_state = AIRLOCK_LIGHT_DENIED
			lights_overlay = "lights_denied"
			pre_light_color = light_color_deny
		if(AIRLOCK_EMAG)
			frame_state = AIRLOCK_FRAME_CLOSED
		if(AIRLOCK_CLOSING)
			frame_state = AIRLOCK_FRAME_CLOSING
			light_state = AIRLOCK_LIGHT_CLOSING
			lights_overlay = "lights_closing"
			pre_light_color = light_color_access
		if(AIRLOCK_OPEN)
			frame_state = AIRLOCK_FRAME_OPEN
			if(locked)
				lights_overlay = "lights_bolts_open"
				pre_light_color = light_color_bolts
			else if(emergency)
				lights_overlay = "lights_emergency_open"
				pre_light_color = light_color_emergency
			else
				lights_overlay = "lights_poweron_open"
				pre_light_color = light_color_poweron
		if(AIRLOCK_OPENING)
			frame_state = AIRLOCK_FRAME_OPENING
			light_state = AIRLOCK_LIGHT_OPENING
			lights_overlay = "lights_opening"
			pre_light_color = light_color_access

	. += get_airlock_overlay(frame_state, icon, em_block = TRUE)
	if(airlock_material)
		. += get_airlock_overlay("[airlock_material]_[frame_state]", overlays_file, em_block = TRUE)
	else
		. += get_airlock_overlay("fill_[frame_state]", icon, em_block = TRUE)

	if(lights && hasPower())
		. += get_airlock_overlay("lights_[light_state]", overlays_file, em_block = FALSE)
		pre_light_range = door_light_range
		pre_light_power = door_light_power
		if(has_environment_lights)
			set_light(pre_light_range, pre_light_power, pre_light_color, TRUE)
	else
		lights_overlay = ""

	update_vis_overlays(lights_overlay)

	if(panel_open)
		. += get_airlock_overlay("panel_[frame_state][security_level ? "_protected" : null]", overlays_file, em_block = TRUE)
	if(frame_state == AIRLOCK_FRAME_CLOSED && welded)
		. += get_airlock_overlay("welded", overlays_file, em_block = TRUE)

	if(airlock_state == AIRLOCK_EMAG)
		. += get_airlock_overlay("sparks", overlays_file, em_block = FALSE)

	if(hasPower())
		if(frame_state == AIRLOCK_FRAME_CLOSED)
			if(atom_integrity < integrity_failure * max_integrity)
				. += get_airlock_overlay("sparks_broken", overlays_file, em_block = FALSE)
			else if(atom_integrity < (0.75 * max_integrity))
				. += get_airlock_overlay("sparks_damaged", overlays_file, em_block = FALSE)
		else if(frame_state == AIRLOCK_FRAME_OPEN)
			if(atom_integrity < (0.75 * max_integrity))
				. += get_airlock_overlay("sparks_open", overlays_file, em_block = FALSE)

	if(note)
		. += get_airlock_overlay(get_note_state(frame_state), note_overlay_file, em_block = TRUE)

	if(frame_state == AIRLOCK_FRAME_CLOSED && seal)
		. += get_airlock_overlay("sealed", overlays_file, src, em_block = TRUE)

	if(hasPower() && unres_sides)
		if(unres_sides & NORTH)
			var/image/I = image(icon='icons/obj/doors/airlocks/station/overlays.dmi', icon_state="unres_n")
			I.pixel_y = 32
			. += I
		if(unres_sides & SOUTH)
			var/image/I = image(icon='icons/obj/doors/airlocks/station/overlays.dmi', icon_state="unres_s")
			I.pixel_y = -32
			. += I
		if(unres_sides & EAST)
			var/image/I = image(icon='icons/obj/doors/airlocks/station/overlays.dmi', icon_state="unres_e")
			I.pixel_x = 32
			. += I
		if(unres_sides & WEST)
			var/image/I = image(icon='icons/obj/doors/airlocks/station/overlays.dmi', icon_state="unres_w")
			I.pixel_x = -32
			. += I

/obj/machinery/door/airlock/proc/update_vis_overlays(overlay_state)
	if(QDELETED(src))
		return
	vis_overlay1.icon_state = overlay_state
	vis_overlay2.icon_state = overlay_state

//STATION AIRLOCKS
/obj/machinery/door/airlock
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/public.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/command
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/command.dmi'

/obj/machinery/door/airlock/security
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/security.dmi'

/obj/machinery/door/airlock/security/old
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/security2.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec/old

/obj/machinery/door/airlock/security/old/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/engineering
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/engineering.dmi'

/obj/machinery/door/airlock/medical
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/medical.dmi'

/obj/machinery/door/airlock/maintenance
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/maintenance.dmi'

/obj/machinery/door/airlock/maintenance/external
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/maintenanceexternal.dmi'

/obj/machinery/door/airlock/mining
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/mining.dmi'

/obj/machinery/door/airlock/atmos
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/atmos.dmi'

/obj/machinery/door/airlock/research
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/research.dmi'

/obj/machinery/door/airlock/freezer
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/freezer.dmi'

/obj/machinery/door/airlock/science
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/science.dmi'

/obj/machinery/door/airlock/virology
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/virology.dmi'

//STATION CUSTOM ARILOCKS
/obj/machinery/door/airlock/corporate
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/corporate.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_corporate
	normal_integrity = 450

/obj/machinery/door/airlock/corporate/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/service
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/service.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_service

/obj/machinery/door/airlock/service/glass
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/captain
	icon = 'talestation_modules/icons/obj/doors/airlocks/cap.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_captain

/obj/machinery/door/airlock/captain/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/hop
	icon = 'talestation_modules/icons/obj/doors/airlocks/hop.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_hop

/obj/machinery/door/airlock/hop/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/hos
	icon = 'talestation_modules/icons/obj/doors/airlocks/hos.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_hos

/obj/machinery/door/airlock/hos/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/ce
	icon = 'talestation_modules/icons/obj/doors/airlocks/ce.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_ce

/obj/machinery/door/airlock/ce/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/rd
	icon = 'talestation_modules/icons/obj/doors/airlocks/rd.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_rd

/obj/machinery/door/airlock/rd/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/qm
	icon = 'talestation_modules/icons/obj/doors/airlocks/qm.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_qm

/obj/machinery/door/airlock/qm/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/cmo
	icon = 'talestation_modules/icons/obj/doors/airlocks/cmo.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_cmo

/obj/machinery/door/airlock/cmo/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/psych
	icon = 'talestation_modules/icons/obj/doors/airlocks/psych.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_psych

/obj/machinery/door/airlock/asylum
	icon = 'talestation_modules/icons/obj/doors/airlocks/asylum.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_asylum

/obj/machinery/door/airlock/bathroom
	icon = 'talestation_modules/icons/obj/doors/airlocks/bathroom.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_bathroom

//STATION MINERAL AIRLOCKS
/obj/machinery/door/airlock/gold
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/gold.dmi'

/obj/machinery/door/airlock/silver
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/silver.dmi'

/obj/machinery/door/airlock/diamond
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/diamond.dmi'

/obj/machinery/door/airlock/uranium
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/uranium.dmi'

/obj/machinery/door/airlock/plasma
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/plasma.dmi'

/obj/machinery/door/airlock/bananium
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/bananium.dmi'

/obj/machinery/door/airlock/sandstone
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/sandstone.dmi'

/obj/machinery/door/airlock/wood
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/wood.dmi'

//STATION 2 AIRLOCKS

/obj/machinery/door/airlock/public
	icon = 'talestation_modules/icons/obj/doors/airlocks/station2/glass.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/station2/overlays.dmi'

//EXTERNAL AIRLOCKS
/obj/machinery/door/airlock/external
	icon = 'talestation_modules/icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/external/overlays.dmi'

//CENTCOMM
/obj/machinery/door/airlock/centcom
	icon = 'talestation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

/obj/machinery/door/airlock/grunge
	icon = 'talestation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

//VAULT
/obj/machinery/door/airlock/vault
	icon = 'talestation_modules/icons/obj/doors/airlocks/vault/vault.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/vault/overlays.dmi'

//HATCH
/obj/machinery/door/airlock/hatch
	icon = 'talestation_modules/icons/obj/doors/airlocks/hatch/centcom.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

/obj/machinery/door/airlock/maintenance_hatch
	icon = 'talestation_modules/icons/obj/doors/airlocks/hatch/maintenance.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

//HIGH SEC
/obj/machinery/door/airlock/highsecurity
	icon = 'talestation_modules/icons/obj/doors/airlocks/highsec/highsec.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/highsec/overlays.dmi'

//GLASS
/obj/machinery/door/airlock/glass_large
	icon = 'talestation_modules/icons/obj/doors/airlocks/multi_tile/multi_tile.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/multi_tile/overlays.dmi'

//ASSEMBLYS

/obj/structure/door_assembly/
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/public.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/station/overlays.dmi'


/obj/structure/door_assembly/door_assembly_public
	icon = 'talestation_modules/icons/obj/doors/airlocks/station2/glass.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/station2/overlays.dmi'

/obj/structure/door_assembly/door_assembly_com
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/command.dmi'

/obj/structure/door_assembly/door_assembly_sec
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/security.dmi'

/obj/structure/door_assembly/door_assembly_sec/old
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/security2.dmi'

/obj/structure/door_assembly/door_assembly_eng
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/engineering.dmi'

/obj/structure/door_assembly/door_assembly_min
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/mining.dmi'

/obj/structure/door_assembly/door_assembly_atmo
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/atmos.dmi'

/obj/structure/door_assembly/door_assembly_research
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/research.dmi'

/obj/structure/door_assembly/door_assembly_science
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/science.dmi'

/obj/structure/door_assembly/door_assembly_viro
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/virology.dmi'

/obj/structure/door_assembly/door_assembly_med
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/medical.dmi'

/obj/structure/door_assembly/door_assembly_mai
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/maintenance.dmi'

/obj/structure/door_assembly/door_assembly_extmai
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/maintenanceexternal.dmi'

/obj/structure/door_assembly/door_assembly_ext
	icon = 'talestation_modules/icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/external/overlays.dmi'

/obj/structure/door_assembly/door_assembly_fre
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/freezer.dmi'

/obj/structure/door_assembly/door_assembly_hatch
	icon = 'talestation_modules/icons/obj/doors/airlocks/hatch/centcom.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

/obj/structure/door_assembly/door_assembly_mhatch
	icon = 'talestation_modules/icons/obj/doors/airlocks/hatch/maintenance.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

/obj/structure/door_assembly/door_assembly_highsecurity
	icon = 'talestation_modules/icons/obj/doors/airlocks/highsec/highsec.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/highsec/overlays.dmi'

/obj/structure/door_assembly/door_assembly_vault
	icon = 'talestation_modules/icons/obj/doors/airlocks/vault/vault.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/vault/overlays.dmi'

/obj/structure/door_assembly/door_assembly_centcom
	icon = 'talestation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

/obj/structure/door_assembly/door_assembly_grunge
	icon = 'talestation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'talestation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

/obj/structure/door_assembly/door_assembly_gold
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/gold.dmi'

/obj/structure/door_assembly/door_assembly_silver
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/silver.dmi'

/obj/structure/door_assembly/door_assembly_diamond
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/diamond.dmi'

/obj/structure/door_assembly/door_assembly_uranium
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/uranium.dmi'

/obj/structure/door_assembly/door_assembly_plasma
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/plasma.dmi'

/obj/structure/door_assembly/door_assembly_bananium
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/bananium.dmi'

/obj/structure/door_assembly/door_assembly_sandstone
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/sandstone.dmi'

/obj/structure/door_assembly/door_assembly_wood
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/wood.dmi'

/obj/structure/door_assembly/door_assembly_corporate
	name = "corporate airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/corporate.dmi'
	glass_type = /obj/machinery/door/airlock/corporate/glass
	airlock_type = /obj/machinery/door/airlock/corporate

/obj/structure/door_assembly/door_assembly_service
	name = "service airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/service.dmi'
	base_name = "service airlock"
	glass_type = /obj/machinery/door/airlock/service/glass
	airlock_type = /obj/machinery/door/airlock/service

/obj/structure/door_assembly/door_assembly_captain
	name = "captain airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/cap.dmi'
	glass_type = /obj/machinery/door/airlock/command/glass
	airlock_type = /obj/machinery/door/airlock/captain

/obj/structure/door_assembly/door_assembly_hop
	name = "head of personnel airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/hop.dmi'
	glass_type = /obj/machinery/door/airlock/command/glass
	airlock_type = /obj/machinery/door/airlock/hop

/obj/structure/door_assembly/door_assembly_hos
	name = "head of security airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/hos.dmi'
	glass_type = /obj/machinery/door/airlock/hos/glass
	airlock_type = /obj/machinery/door/airlock/hos

/obj/structure/door_assembly/door_assembly_cmo
	name = "chief medical officer airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/cmo.dmi'
	glass_type = /obj/machinery/door/airlock/cmo/glass
	airlock_type = /obj/machinery/door/airlock/cmo

/obj/structure/door_assembly/door_assembly_ce
	name = "chief engineer airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/ce.dmi'
	glass_type = /obj/machinery/door/airlock/ce/glass
	airlock_type = /obj/machinery/door/airlock/ce

/obj/structure/door_assembly/door_assembly_rd
	name = "research director airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/rd.dmi'
	glass_type = /obj/machinery/door/airlock/rd/glass
	airlock_type = /obj/machinery/door/airlock/rd

/obj/structure/door_assembly/door_assembly_qm
	name = "quartermaster airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/qm.dmi'
	glass_type = /obj/machinery/door/airlock/qm/glass
	airlock_type = /obj/machinery/door/airlock/qm

/obj/structure/door_assembly/door_assembly_psych
	name = "psychologist airlock assembly"
	icon = 'talestation_modules/icons/obj/doors/airlocks/psych.dmi'
	glass_type = /obj/machinery/door/airlock/medical/glass
	airlock_type = /obj/machinery/door/airlock/psych

/obj/structure/door_assembly/door_assembly_asylum
	icon = 'talestation_modules/icons/obj/doors/airlocks/asylum.dmi'

/obj/structure/door_assembly/door_assembly_bathroom
	icon = 'talestation_modules/icons/obj/doors/airlocks/bathroom.dmi'

/obj/machinery/door/airlock/hydroponics
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/botany.dmi'

/obj/structure/door_assembly/door_assembly_hydro
	icon = 'talestation_modules/icons/obj/doors/airlocks/station/botany.dmi'

#undef AIRLOCK_LIGHT_POWER
#undef AIRLOCK_LIGHT_RANGE

#undef AIRLOCK_POWERON_LIGHT_COLOR
#undef AIRLOCK_BOLTS_LIGHT_COLOR
#undef AIRLOCK_ACCESS_LIGHT_COLOR
#undef AIRLOCK_EMERGENCY_LIGHT_COLOR
#undef AIRLOCK_DENY_LIGHT_COLOR

#undef AIRLOCK_CLOSED
#undef AIRLOCK_CLOSING
#undef AIRLOCK_OPEN
#undef AIRLOCK_OPENING
#undef AIRLOCK_DENY
#undef AIRLOCK_EMAG
