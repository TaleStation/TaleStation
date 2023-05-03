/// -- Modular areas, for ruins/modular maps/etc --

// Drone Bay Area
/area/station/engineering/atmos/control_center
	name = "Atmospherics Control Center"

/area/station/engineering/atmos/experiment_room
	name = "Atmospherics Experimentation Room"

//BO Office
/area/station/command/bridge_officer_office //This should inherient det offices ambient?
	name = "Bridge Officer's Office"
	icon = 'talestation_modules/icons/mapping/areas/areas_station.dmi'
	icon_state = "bo_office"
	ambientsounds = list('sound/ambience/ambidet1.ogg','sound/ambience/ambidet2.ogg')
	sound_environment = SOUND_AREA_WOODFLOOR

//AP Office, possibly going unused? We're adding it anyway, fuck you
/area/station/command/ap_office
	name = "Asset Protection's Office"
	icon = 'talestation_modules/icons/mapping/areas/areas_station.dmi'
	icon_state = "ap_office"

/area/station/service/hydroponics/park
	name = "Park"

/area/station/service/bar/lower
	name = "Lower Bar"
	sound_environment = SOUND_AREA_WOODFLOOR

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
	icon_state = "starboardmaint" // This and port need their own icons

/area/station/maintenance/port/lower
	name = "Lower Port Maintenance"
	icon_state = "portmaint"

/area/station/commons/cryopods
	name = "\improper Cryopod Room"
	icon = 'talestation_modules/icons/mapping/areas/areas_station.dmi'
	icon_state = "cryopods"
