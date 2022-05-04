/// -- Modular areas, for ruins/modular maps/etc --


// Drone Bay Area
/area/engineering/atmos/control_center
	name = "Atmospherics Control Center"

/area/engineering/atmos/experiment_room
	name = "Atmospherics Experimentation Room"

//BO Office
/area/security/detectives_office/bridge_officer_office //This should inherient det offices ambient?
	name = "Bridge Officer's Office"
	icon = 'jollystation_modules/icons/turf/areas.dmi'
	icon_state = "bo_office"

//AP Office, possibly going unused? We're adding it anyway, fuck you
/area/command/ap_office
	name = "Asset Protection's Office"
	icon = 'jollystation_modules/icons/turf/areas.dmi'
	icon_state = "ap_office"

/area/service/hydroponics/park
	name = "Park"

/area/service/bar/lower
	name = "Lower Bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/service/barber
	name = "Salon"
	icon_state = "cafeteria" // yeah ok

/area/science/robotics/abandoned
	name = "\improper Abandoned Robotics"
	icon_state = "abandoned_sci"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/service/kitchen/abandoned
	name = "\improper Abandoned Kitchen"
	icon_state = "kitchen"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/maintenance/starboard/lower
	name = "Lower Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/port/lower
	name = "Lower Port Maintenance"
	icon_state = "pmaint"


//Berry Physics Space Ruin
/area/ruin/space/has_grav/powered/berry_physics
	name = "Berry Physics"
	icon_state = "red"

//NERVA Station
/area/ruin/space/has_grav/nerva
	name = "NERVA Beacon"
	icon_state = "green"

/area/solars/nerva
	name = "NERVA Beacon Solar Array"
	icon_state = "panelsP"

/area/commons/cryopods
	name = "\improper Cryopod Room"
	icon_state = "green"
