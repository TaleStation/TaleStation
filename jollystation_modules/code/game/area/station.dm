/// -- Modular areas, for ruins/modular maps/etc --


// Drone Bay Area
/area/station/engineering/atmos/control_center
	name = "Atmospherics Control Center"

/area/station/engineering/atmos/experiment_room
	name = "Atmospherics Experimentation Room"

//BO Office
/area/station/security/detectives_office/bridge_officer_office //This should inherient det offices ambient?
	name = "Bridge Officer's Office"
	icon = 'jollystation_modules/icons/turf/areas.dmi'
	icon_state = "bo_office"

//AP Office, possibly going unused? We're adding it anyway, fuck you
/area/station/command/ap_office
	name = "Asset Protection's Office"
	icon = 'jollystation_modules/icons/turf/areas.dmi'
	icon_state = "ap_office"

/area/station/service/hydroponics/park
	name = "Park"

/area/station/service/bar/lower
	name = "Lower Bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/barber
	name = "Salon"
	icon_state = "cafeteria" // yeah ok

/area/station/science/robotics/abandoned
	name = "\improper Abandoned Robotics"
	icon_state = "abandoned_sci"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/service/kitchen/abandoned
	name = "\improper Abandoned Kitchen"
	icon_state = "kitchen"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/maintenance/starboard/lower
	name = "Lower Starboard Maintenance"
	icon_state = "smaint"

/area/station/maintenance/port/lower
	name = "Lower Port Maintenance"
	icon_state = "pmaint"

/area/station/commons/cryopods
	name = "\improper Cryopod Room"
	icon_state = "green"
