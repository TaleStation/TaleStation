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
	doorOpen = 'jollystation_modules/sound/machines/airlocks/open.ogg'
	doorClose = 'jollystation_modules/sound/machines/airlocks/close.ogg'
	doorDeni = 'jollystation_modules/sound/machines/airlocks/access_denied.ogg'
	boltUp = 'jollystation_modules/sound/machines/airlocks/bolts_up.ogg'
	boltDown = 'jollystation_modules/sound/machines/airlocks/bolts_down.ogg'
	//noPower = 'sound/machines/doorclick.ogg'
	var/forcedOpen = 'jollystation_modules/sound/machines/airlocks/open_force.ogg' //Come on guys, why aren't all the sound files like this.
	var/forcedClosed = 'jollystation_modules/sound/machines/airlocks/close_force.ogg'

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

/obj/machinery/door/airlock/proc/update_vis_overlays(overlay_state)
	if(QDELETED(src))
		return
	vis_overlay1.icon_state = overlay_state
	vis_overlay2.icon_state = overlay_state

//STATION AIRLOCKS
/obj/machinery/door/airlock
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/public.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/station/overlays.dmi'

/obj/machinery/door/airlock/command
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/command.dmi'

/obj/machinery/door/airlock/security
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/security.dmi'

/obj/machinery/door/airlock/security/old
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/security2.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec/old

/obj/machinery/door/airlock/security/old/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/engineering
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/engineering.dmi'

/obj/machinery/door/airlock/medical
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/medical.dmi'

/obj/machinery/door/airlock/maintenance
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/maintenance.dmi'

/obj/machinery/door/airlock/maintenance/external
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/maintenanceexternal.dmi'

/obj/machinery/door/airlock/mining
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/mining.dmi'

/obj/machinery/door/airlock/atmos
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/atmos.dmi'

/obj/machinery/door/airlock/research
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/research.dmi'

/obj/machinery/door/airlock/freezer
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/freezer.dmi'

/obj/machinery/door/airlock/science
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/science.dmi'

/obj/machinery/door/airlock/virology
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/virology.dmi'

//STATION CUSTOM ARILOCKS
/obj/machinery/door/airlock/corporate
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/corporate.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_corporate
	normal_integrity = 450

/obj/machinery/door/airlock/corporate/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/service
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/service.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_service

/obj/machinery/door/airlock/service/glass
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/captain
	icon = 'jollystation_modules/icons/obj/doors/airlocks/cap.dmi'

/obj/machinery/door/airlock/hop
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hop.dmi'

/obj/machinery/door/airlock/hos
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hos.dmi'

/obj/machinery/door/airlock/hos/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/ce
	icon = 'jollystation_modules/icons/obj/doors/airlocks/ce.dmi'

/obj/machinery/door/airlock/ce/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/rd
	icon = 'jollystation_modules/icons/obj/doors/airlocks/rd.dmi'

/obj/machinery/door/airlock/rd/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/qm
	icon = 'jollystation_modules/icons/obj/doors/airlocks/qm.dmi'

/obj/machinery/door/airlock/qm/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/cmo
	icon = 'jollystation_modules/icons/obj/doors/airlocks/cmo.dmi'

/obj/machinery/door/airlock/cmo/glass
	opacity = FALSE
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/psych
	icon = 'jollystation_modules/icons/obj/doors/airlocks/psych.dmi'

/obj/machinery/door/airlock/asylum
	icon = 'jollystation_modules/icons/obj/doors/airlocks/asylum.dmi'

/obj/machinery/door/airlock/bathroom
	icon = 'jollystation_modules/icons/obj/doors/airlocks/bathroom.dmi'

//STATION MINERAL AIRLOCKS
/obj/machinery/door/airlock/gold
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/gold.dmi'

/obj/machinery/door/airlock/silver
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/silver.dmi'

/obj/machinery/door/airlock/diamond
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/diamond.dmi'

/obj/machinery/door/airlock/uranium
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/uranium.dmi'

/obj/machinery/door/airlock/plasma
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/plasma.dmi'

/obj/machinery/door/airlock/bananium
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/bananium.dmi'

/obj/machinery/door/airlock/sandstone
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/sandstone.dmi'

/obj/machinery/door/airlock/wood
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/wood.dmi'

//STATION 2 AIRLOCKS

/obj/machinery/door/airlock/public
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station2/glass.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/station2/overlays.dmi'

//EXTERNAL AIRLOCKS
/obj/machinery/door/airlock/external
	icon = 'jollystation_modules/icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/external/overlays.dmi'

//CENTCOMM
/obj/machinery/door/airlock/centcom
	icon = 'jollystation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

/obj/machinery/door/airlock/grunge
	icon = 'jollystation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

//VAULT
/obj/machinery/door/airlock/vault
	icon = 'jollystation_modules/icons/obj/doors/airlocks/vault/vault.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/vault/overlays.dmi'

//HATCH
/obj/machinery/door/airlock/hatch
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hatch/centcom.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

/obj/machinery/door/airlock/maintenance_hatch
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hatch/maintenance.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

//HIGH SEC
/obj/machinery/door/airlock/highsecurity
	icon = 'jollystation_modules/icons/obj/doors/airlocks/highsec/highsec.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/highsec/overlays.dmi'

//GLASS
/obj/machinery/door/airlock/glass_large
	icon = 'jollystation_modules/icons/obj/doors/airlocks/multi_tile/multi_tile.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/multi_tile/overlays.dmi'

//ASSEMBLYS
/obj/structure/door_assembly/door_assembly_public
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station2/glass.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/station2/overlays.dmi'

/obj/structure/door_assembly/door_assembly_com
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/command.dmi'

/obj/structure/door_assembly/door_assembly_sec
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/security.dmi'

/obj/structure/door_assembly/door_assembly_sec/old
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/security2.dmi'

/obj/structure/door_assembly/door_assembly_eng
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/engineering.dmi'

/obj/structure/door_assembly/door_assembly_min
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/mining.dmi'

/obj/structure/door_assembly/door_assembly_atmo
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/atmos.dmi'

/obj/structure/door_assembly/door_assembly_research
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/research.dmi'

/obj/structure/door_assembly/door_assembly_science
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/science.dmi'

/obj/structure/door_assembly/door_assembly_viro
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/virology.dmi'

/obj/structure/door_assembly/door_assembly_med
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/medical.dmi'

/obj/structure/door_assembly/door_assembly_mai
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/maintenance.dmi'

/obj/structure/door_assembly/door_assembly_extmai
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/maintenanceexternal.dmi'

/obj/structure/door_assembly/door_assembly_ext
	icon = 'jollystation_modules/icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/external/overlays.dmi'

/obj/structure/door_assembly/door_assembly_fre
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/freezer.dmi'

/obj/structure/door_assembly/door_assembly_hatch
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hatch/centcom.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

/obj/structure/door_assembly/door_assembly_mhatch
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hatch/maintenance.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/hatch/overlays.dmi'

/obj/structure/door_assembly/door_assembly_highsecurity
	icon = 'jollystation_modules/icons/obj/doors/airlocks/highsec/highsec.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/highsec/overlays.dmi'

/obj/structure/door_assembly/door_assembly_vault
	icon = 'jollystation_modules/icons/obj/doors/airlocks/vault/vault.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/vault/overlays.dmi'


/obj/structure/door_assembly/door_assembly_centcom
	icon = 'jollystation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

/obj/structure/door_assembly/door_assembly_grunge
	icon = 'jollystation_modules/icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'jollystation_modules/icons/obj/doors/airlocks/centcom/overlays.dmi'

/obj/structure/door_assembly/door_assembly_gold
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/gold.dmi'

/obj/structure/door_assembly/door_assembly_silver
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/silver.dmi'

/obj/structure/door_assembly/door_assembly_diamond
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/diamond.dmi'

/obj/structure/door_assembly/door_assembly_uranium
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/uranium.dmi'

/obj/structure/door_assembly/door_assembly_plasma
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/plasma.dmi'

/obj/structure/door_assembly/door_assembly_bananium
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/bananium.dmi'

/obj/structure/door_assembly/door_assembly_sandstone
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/sandstone.dmi'

/obj/structure/door_assembly/door_assembly_wood
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/wood.dmi'

/obj/structure/door_assembly/door_assembly_corporate
	name = "corporate airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/corporate.dmi'
	glass_type = /obj/machinery/door/airlock/corporate/glass
	airlock_type = /obj/machinery/door/airlock/corporate

/obj/structure/door_assembly/door_assembly_service
	name = "service airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/service.dmi'
	base_name = "service airlock"
	glass_type = /obj/machinery/door/airlock/service/glass
	airlock_type = /obj/machinery/door/airlock/service

/obj/structure/door_assembly/door_assembly_captain
	name = "captain airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/cap.dmi'
	glass_type = /obj/machinery/door/airlock/command/glass
	airlock_type = /obj/machinery/door/airlock/captain

/obj/structure/door_assembly/door_assembly_hop
	name = "head of personnel airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hop.dmi'
	glass_type = /obj/machinery/door/airlock/command/glass
	airlock_type = /obj/machinery/door/airlock/hop

/obj/structure/door_assembly/hos
	name = "head of security airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/hos.dmi'
	glass_type = /obj/machinery/door/airlock/hos/glass
	airlock_type = /obj/machinery/door/airlock/hos

/obj/structure/door_assembly/door_assembly_cmo
	name = "chief medical officer airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/cmo.dmi'
	glass_type = /obj/machinery/door/airlock/cmo/glass
	airlock_type = /obj/machinery/door/airlock/cmo

/obj/structure/door_assembly/door_assembly_ce
	name = "chief engineer airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/ce.dmi'
	glass_type = /obj/machinery/door/airlock/ce/glass
	airlock_type = /obj/machinery/door/airlock/ce

/obj/structure/door_assembly/door_assembly_rd
	name = "research director airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/rd.dmi'
	glass_type = /obj/machinery/door/airlock/rd/glass
	airlock_type = /obj/machinery/door/airlock/rd

/obj/structure/door_assembly/door_assembly_qm
	name = "quartermaster airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/qm.dmi'
	glass_type = /obj/machinery/door/airlock/qm/glass
	airlock_type = /obj/machinery/door/airlock/qm

/obj/structure/door_assembly/door_assembly_psych
	name = "psychologist airlock assembly"
	icon = 'jollystation_modules/icons/obj/doors/airlocks/psych.dmi'
	glass_type = /obj/machinery/door/airlock/medical/glass
	airlock_type = /obj/machinery/door/airlock/psych

/obj/structure/door_assembly/door_assembly_asylum
	icon = 'jollystation_modules/icons/obj/doors/airlocks/asylum.dmi'

/obj/structure/door_assembly/door_assembly_bathroom
	icon = 'jollystation_modules/icons/obj/doors/airlocks/bathroom.dmi'

/obj/machinery/door/airlock/hydroponics
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/botany.dmi'

/obj/structure/door_assembly/door_assembly_hydro
	icon = 'jollystation_modules/icons/obj/doors/airlocks/station/botany.dmi'

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
