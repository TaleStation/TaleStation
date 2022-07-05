// Modular var override for exp reqs for jobs
// DO NOT ADD TO THIS FILE UNLESS ITS TO TWEAK THE VAR FOR PLAYTIMES

/datum/job/ai
	exp_requirements = 2400

/datum/job/atmospheric_technician
	exp_requirements = 180
	exp_required_type = EXP_TYPE_ENGINEERING
	exp_granted_type = EXP_TYPE_ENGINEERING

/datum/job/bartender
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/botanist
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/captain
	exp_requirements = 2400
	exp_required_type = EXP_TYPE_COMMAND
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_COMMAND

/datum/job/cargo_technician
	exp_granted_type = EXP_TYPE_SUPPLY

/datum/job/chaplain
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/chemist
	exp_requirements = 0
	exp_granted_type = EXP_TYPE_MEDICAL

/datum/job/chief_engineer
	exp_requirements = 2400
	exp_required_type = EXP_TYPE_ENGINEERING
	exp_required_type_department = EXP_TYPE_ENGINEERING
	exp_granted_type = EXP_TYPE_COMMAND

/datum/job/chief_medical_officer
	exp_requirements = 2400
	exp_required_type = EXP_TYPE_MEDICAL
	exp_required_type_department = EXP_TYPE_MEDICAL
	exp_granted_type = EXP_TYPE_COMMAND

/datum/job/clown
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/cook
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/curator
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/cyborg
	exp_requirements = 1200
	exp_required_type = EXP_TYPE_SILICON
	exp_granted_type = EXP_TYPE_SILICON

/datum/job/detective
	exp_requirements = 600
	exp_required_type = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_SECURITY

/datum/job/geneticist
	exp_requirements = 0
	exp_required_type = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_SCIENCE

/datum/job/head_of_personnel
	exp_requirements = 2400
	exp_required_type = EXP_TYPE_SERVICE
	exp_required_type_department = EXP_TYPE_SERVICE
	exp_granted_type = EXP_TYPE_COMMAND

/datum/job/head_of_security
	exp_requirements = 2400
	exp_required_type = EXP_TYPE_SECURITY
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_COMMAND

/datum/job/janitor
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/lawyer
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/doctor
	exp_granted_type = EXP_TYPE_MEDICAL

/datum/job/mime
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/paramedic
	exp_granted_type = EXP_TYPE_MEDICAL

/datum/job/psychologist
	exp_granted_type = EXP_TYPE_SERVICE

/datum/job/quartermaster
	exp_requirements = 2400
	exp_required_type_department = EXP_TYPE_SUPPLY
	exp_granted_type = EXP_TYPE_COMMAND

/datum/job/research_director
	exp_requirements = 2400
	exp_required_type_department = EXP_TYPE_SCIENCE
	exp_required_type = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_COMMAND

/datum/job/roboticist
	exp_requirements = 180
	exp_required_type = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_SCIENCE

/datum/job/scientist
	exp_requirements = 0
	exp_required_type = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_SCIENCE

/datum/job/security_officer
	exp_requirements = 0
	exp_required_type = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_SECURITY

/datum/job/shaft_miner
	exp_granted_type = EXP_TYPE_SUPPLY

/datum/job/station_engineer
	exp_requirements = 0
	exp_required_type = EXP_TYPE_ENGINEERING
	exp_granted_type = EXP_TYPE_ENGINEERING

/datum/job/virologist
	exp_requirements = 300
	exp_required_type = EXP_TYPE_MEDICAL
	exp_granted_type = EXP_TYPE_MEDICAL

/datum/job/warden
	exp_requirements = 900
	exp_required_type = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_SECURITY
