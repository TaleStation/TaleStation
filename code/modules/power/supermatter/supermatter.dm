//Ported from /vg/station13, which was in turn forked from baystation12;
//Please do not bother them with bugs from this port, however, as it has been modified quite a bit.
//Modifications include removing the world-ending full supermatter variation, and leaving only the shard.

//Zap constants, speeds up targeting

#define BIKE (COIL + 1)
#define COIL (ROD + 1)
#define ROD (LIVING + 1)
#define LIVING (MACHINERY + 1)
#define MACHINERY (OBJECT + 1)
#define OBJECT (LOWEST + 1)
#define LOWEST (1)

GLOBAL_DATUM(main_supermatter_engine, /obj/machinery/power/supermatter_crystal)

/obj/machinery/power/supermatter_crystal
	name = "supermatter crystal"
	desc = "A strangely translucent and iridescent crystal."
	icon = 'icons/obj/engine/supermatter.dmi'
	icon_state = "darkmatter"
	density = TRUE
	anchored = TRUE
	layer = MOB_LAYER
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1
	light_range = 4
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	critical_machine = TRUE
	base_icon_state = "darkmatter"

	///The id of our supermatter
	var/uid = 1
	///The amount of supermatters that have been created this round
	var/static/gl_uid = 1
	///Tracks the bolt color we are using
	var/zap_icon = DEFAULT_ZAP_ICON_STATE

	///Are we exploding?
	var/final_countdown = FALSE

	///The amount of damage we have currently
	var/damage = 0
	/// The damage we had before this cycle.
	/// Used to limit the damage we can take each cycle, and to check if we are currently taking damage or healing.
	var/damage_archived = 0

	///The point at which we consider the supermatter to be [SUPERMATTER_STATUS_WARNING]
	var/warning_point = 50
	var/warning_channel = RADIO_CHANNEL_ENGINEERING
	///The point at which we consider the supermatter to be [SUPERMATTER_STATUS_DANGER]
	///Spawns anomalies when more damaged than this too.
	var/danger_point = 550
	///The point at which we consider the supermatter to be [SUPERMATTER_STATUS_EMERGENCY]
	var/emergency_point = 675
	var/emergency_channel = null // Need null to actually broadcast, lol.
	///The point at which we delam [SUPERMATTER_STATUS_DELAMINATING]
	var/explosion_point = 900

	///A scaling value that affects the severity of explosions.
	var/explosion_power = 35
	///Time in 1/10th of seconds since the last sent warning
	var/lastwarning = 0
	///Refered to as eer on the moniter. This value effects gas output, heat, damage, and radiation.
	var/power = 0
	///The list of gases mapped against their current comp. We use this to calculate different values the supermatter uses, like power or heat resistance. Ranges from 0 to 1
	var/list/gas_percentage
	///The last air sample's total molar count, will always be above or equal to 0
	var/combined_gas = 0
	///Total mole count of the environment we are in
	var/environment_total_moles = 0
	///Affects the power gain the sm experiances from heat
	var/gasmix_power_ratio = 0
	///Affects the amount of o2 and plasma the sm outputs, along with the heat it makes.
	var/dynamic_heat_modifier = 1
	///Affects the amount of damage and minimum point at which the sm takes heat damage
	var/dynamic_heat_resistance = 1
	///Uses powerloss_dynamic_scaling and combined_gas to lessen the effects of our powerloss functions
	var/powerloss_inhibitor = 1
	///Based on co2 percentage, slowly moves between 0 and 1. We use it to calc the powerloss_inhibitor
	var/powerloss_dynamic_scaling= 0
	///Affects the amount of radiation the sm makes. We multiply this with power to find the zap power.
	var/power_transmission_bonus = 0
	///Used to increase or lessen the amount of damage the sm takes from heat based on molar counts.
	var/mole_heat_penalty = 0
	///Takes the energy throwing things into the sm generates and slowly turns it into actual power
	var/matter_power = 0
	///The cutoff for a bolt jumping, grows with heat, lowers with higher mol count,
	var/zap_cutoff = 1500
	///How much the bullets damage should be multiplied by when it is added to the internal variables
	var/bullet_energy = 2
	///How much hallucination should we produce per unit of power?
	var/hallucination_power = 0.1

	///Pressure bonus constants
	///If the SM is operating in sufficiently low pressure, increase power output.
	///This needs both a small amount of gas and a strong cooling system to keep temperature low in a low heat capacity environment.

	///These constants are used to derive the values in the pressure bonus equation from human-meaningful values
	///If you're varediting these, call update_constants() to update the derived values

	///What is the maximum multiplier reachable from having low pressure?
	var/pressure_bonus_max_multiplier = 0.5
	///At what environmental pressure, in kPa, should we start giving a pressure bonus?
	var/pressure_bonus_max_pressure = 100
	///How steeply angled is the pressure bonus curve? Higher values means more of the bonus is available at higher pressures.
	///Note that very low values can keep the bonus very close to 1 until it's nearly a vaccuum. Higher values can introduce diminishing returns on lower pressure.
	var/pressure_bonus_curve_angle = 1.8

	///These values are calculated from the above in update_constants() and immediately overwritten
	///The default values will always result in a no-op 1x modifier, in case something breaks.
	var/pressure_bonus_derived_constant = 1
	var/pressure_bonus_derived_steepness = 0


	///Our internal radio
	var/obj/item/radio/radio
	///The key our internal radio uses
	var/radio_key = /obj/item/encryptionkey/headset_eng

	///Boolean used for logging if we've been powered
	var/has_been_powered = FALSE

	///An effect we show to admins and ghosts the percentage of delam we're at
	var/obj/effect/countdown/supermatter/countdown

	///Only main engines can have their sliver stolen, can trigger cascades, and can spawn stationwide anomalies.
	var/is_main_engine = FALSE
	///Our soundloop
	var/datum/looping_sound/supermatter/soundloop
	///Can it be moved?
	var/moveable = FALSE

	///cooldown tracker for accent sounds
	var/last_accent_sound = 0
	///Var that increases from 0 to 1 when a psycologist is nearby, and decreases in the same way
	var/psyCoeff = 0
	///Should we check the psy overlay?
	var/psy_overlay = FALSE
	///A pinkish overlay used to denote the presance of a psycologist. We fade in and out of this depending on the amount of time they've spent near the crystal
	var/obj/overlay/psy/psyOverlay = /obj/overlay/psy

	//For making hugbox supermatters
	///Disables all methods of taking damage
	var/takes_damage = TRUE
	///Disables the production of gas, and pretty much any handling of it we do.
	var/produces_gas = TRUE
	///Disables power changes
	var/power_changes = TRUE
	///Disables the sm's proccessing totally.
	var/processes = TRUE
	///Stores the time of when the last zap occurred
	var/last_power_zap = 0
	///Do we show this crystal in the CIMS modular program
	var/include_in_cims = TRUE

	///Hue shift of the zaps color based on the power of the crystal
	var/hue_angle_shift = 0
	///Reference to the warp effect
	var/atom/movable/supermatter_warp_effect/warp
	///The power threshold required to transform the powerloss function into a linear function from a cubic function.
	var/powerloss_linear_threshold = 0
	///The offset of the linear powerloss function set so the transition is differentiable.
	var/powerloss_linear_offset = 0

	///The portion of the gasmix we're on that we should remove
	var/absorption_ratio = 0.15
	/// The gasmix we just recently absorbed. Tile's air multiplied by absorption_ratio
	var/datum/gas_mixture/absorbed_gasmix

	/// How we are delaminating.
	var/datum/sm_delam/delamination_strategy
	/// Whether the sm is forced in a specific delamination_strategy or not. All truthy values means it's forced.
	/// Only values greater or equal to the current one can change the strat.
	var/delam_priority = SM_DELAM_PRIO_NONE

/obj/machinery/power/supermatter_crystal/Initialize(mapload)
	. = ..()
	uid = gl_uid++
	set_delam(SM_DELAM_PRIO_NONE, /datum/sm_delam/explosive)
	SSair.start_processing_machine(src)
	countdown = new(src)
	countdown.start()
	SSpoints_of_interest.make_point_of_interest(src)
	radio = new(src)
	radio.keyslot = new radio_key
	radio.set_listening(FALSE)
	radio.recalculateChannels()
	investigate_log("has been created.", INVESTIGATE_ENGINE)
	if(is_main_engine)
		GLOB.main_supermatter_engine = src

	AddElement(/datum/element/bsa_blocker)
	RegisterSignal(src, COMSIG_ATOM_BSA_BEAM, .proc/force_delam)

	var/static/list/loc_connections = list(
		COMSIG_TURF_INDUSTRIAL_LIFT_ENTER = .proc/tram_contents_consume,
	)
	AddElement(/datum/element/connect_loc, loc_connections)	//Speficially for the tram, hacky

	AddComponent(/datum/component/supermatter_crystal, CALLBACK(src, .proc/wrench_act_callback), CALLBACK(src, .proc/consume_callback))

	soundloop = new(src, TRUE)
	if(ispath(psyOverlay))
		psyOverlay = new psyOverlay()
	else
		stack_trace("Supermatter created with non-path psyOverlay variable. This can break things, please fix.")
		psyOverlay = new()

	if (!moveable)
		move_resist = MOVE_FORCE_OVERPOWERING // Avoid being moved by statues or other memes

	update_constants()

/obj/machinery/power/supermatter_crystal/Destroy()
	if(warp)
		vis_contents -= warp
		QDEL_NULL(warp)
	investigate_log("has been destroyed.", INVESTIGATE_ENGINE)
	SSair.stop_processing_machine(src)
	QDEL_NULL(radio)
	QDEL_NULL(countdown)
	if(is_main_engine && GLOB.main_supermatter_engine == src)
		GLOB.main_supermatter_engine = null
	QDEL_NULL(soundloop)
	if(psyOverlay)
		QDEL_NULL(psyOverlay)
	return ..()

/obj/machinery/power/supermatter_crystal/on_changed_z_level(turf/old_turf, turf/new_turf, same_z_layer, notify_contents)
	. = ..()
	if(same_z_layer)
		return
	if(warp)
		SET_PLANE_EXPLICIT(warp, PLANE_TO_TRUE(warp.plane), src)

/obj/machinery/power/supermatter_crystal/proc/update_constants()
	pressure_bonus_derived_steepness = (1 - 1 / pressure_bonus_max_multiplier) / (pressure_bonus_max_pressure ** pressure_bonus_curve_angle)
	pressure_bonus_derived_constant = 1 / pressure_bonus_max_multiplier - pressure_bonus_derived_steepness
	powerloss_linear_threshold = sqrt(POWERLOSS_LINEAR_RATE / 3 * POWERLOSS_CUBIC_DIVISOR ** 3)
	powerloss_linear_offset = -1 * powerloss_linear_threshold * POWERLOSS_LINEAR_RATE + (powerloss_linear_threshold / POWERLOSS_CUBIC_DIVISOR) ** 3

/obj/machinery/power/supermatter_crystal/examine(mob/user)
	. = ..()
	var/immune = HAS_TRAIT(user, TRAIT_MADNESS_IMMUNE) || (user.mind && HAS_TRAIT(user.mind, TRAIT_MADNESS_IMMUNE))
	if(isliving(user) && !immune && (get_dist(user, src) < HALLUCINATION_RANGE(power)))
		. += span_danger("You get headaches just from looking at it.")
	. += delamination_strategy.examine(src)
	return .

// SupermatterMonitor UI for ghosts only. Inherited attack_ghost will call this.
/obj/machinery/power/supermatter_crystal/ui_interact(mob/user, datum/tgui/ui)
	if(!isobserver(user))
		return FALSE
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "SupermatterMonitor")
		ui.open()

/obj/machinery/power/supermatter_crystal/ui_data(mob/user)
	var/list/data = list()

	var/turf/local_turf = get_turf(src)

	var/datum/gas_mixture/air = local_turf.return_air()

	// singlecrystal set to true eliminates the back sign on the gases breakdown.
	data["singlecrystal"] = TRUE
	data["active"] = TRUE
	data["SM_integrity"] = get_integrity_percent()
	data["SM_power"] = power
	data["SM_ambienttemp"] = air.temperature
	data["SM_ambientpressure"] = air.return_pressure()
	data["SM_bad_moles_amount"] = MOLE_PENALTY_THRESHOLD / absorption_ratio
	data["SM_moles"] = 0
	data["SM_uid"] = uid
	var/area/active_supermatter_area = get_area(src)
	data["SM_area_name"] = active_supermatter_area.name

	var/list/gasdata = list()

	if(air.total_moles())
		data["SM_moles"] = air.total_moles()
		for(var/gasid in air.gases)
			gasdata.Add(list(list(
			"name"= air.gases[gasid][GAS_META][META_GAS_NAME],
			"amount" = round(100*air.gases[gasid][MOLES]/air.total_moles(),0.01))))

	else
		for(var/gasid in air.gases)
			gasdata.Add(list(list(
				"name"= air.gases[gasid][GAS_META][META_GAS_NAME],
				"amount" = 0)))

	data["gases"] = gasdata

	return data

/// Encodes the current state of the supermatter.
/obj/machinery/power/supermatter_crystal/proc/get_status()
	var/turf/local_turf = get_turf(src)
	if(!local_turf)
		return SUPERMATTER_ERROR
	var/datum/gas_mixture/air = local_turf.return_air()
	if(!air)
		return SUPERMATTER_ERROR
	if(final_countdown)
		return SUPERMATTER_DELAMINATING
	if(damage >= emergency_point)
		return SUPERMATTER_EMERGENCY
	if(damage >= danger_point)
		return SUPERMATTER_DANGER
	if(damage >= warning_point)
		return SUPERMATTER_WARNING
	if(absorbed_gasmix.temperature > (T0C + HEAT_PENALTY_THRESHOLD) * 0.8)
		return SUPERMATTER_NOTIFY
	if(power)
		return SUPERMATTER_NORMAL
	return SUPERMATTER_INACTIVE

/obj/machinery/power/supermatter_crystal/proc/get_integrity_percent()
	var/integrity = damage / explosion_point
	integrity = round(100 - integrity * 100, 0.01)
	integrity = integrity < 0 ? 0 : integrity
	return integrity

/obj/machinery/power/supermatter_crystal/update_overlays()
	. = ..()
	if(delamination_strategy)
		. += delamination_strategy.overlays(src)

/obj/machinery/power/supermatter_crystal/proc/force_delam()
	SIGNAL_HANDLER
	investigate_log("was forcefully delaminated", INVESTIGATE_ENGINE)
	INVOKE_ASYNC(delamination_strategy, /datum/sm_delam/proc/delaminate, src)

/obj/machinery/power/supermatter_crystal/proc/supermatter_pull(turf/center, pull_range = 3)
	playsound(center, 'sound/weapons/marauder.ogg', 100, TRUE, extrarange = pull_range - world.view)
	for(var/atom/movable/movable_atom in orange(pull_range,center))
		if((movable_atom.anchored || movable_atom.move_resist >= MOVE_FORCE_EXTREMELY_STRONG)) //move resist memes.
			if(istype(movable_atom, /obj/structure/closet))
				var/obj/structure/closet/closet = movable_atom
				closet.open(force = TRUE)
			continue
		if(ismob(movable_atom))
			var/mob/pulled_mob = movable_atom
			if(pulled_mob.mob_negates_gravity())
				continue //You can't pull someone nailed to the deck
		step_towards(movable_atom,center)

/**
 * Count down, spout some messages, and then execute the delam itself.
 * We guard for last second delam strat changes here, mostly because some have diff messages.
 *
 * By last second changes, we mean that it's possible for say, a tesla delam to
 * just explode normally if at the absolute last second it loses power and switches to default one.
 * Even after countdown is already in progress.
 */
/obj/machinery/power/supermatter_crystal/proc/count_down()
	set waitfor = FALSE

	if(final_countdown) // We're already doing it go away
		stack_trace("[src] told to delaminate again while it's already delaminating.")
		return

	final_countdown = TRUE
	update_appearance()

	var/datum/sm_delam/last_delamination_strategy = delamination_strategy
	var/list/count_down_messages = delamination_strategy.count_down_messages()

	radio.talk_into(
		src,
		count_down_messages[1],
		emergency_channel
	)

	for(var/i in SUPERMATTER_COUNTDOWN_TIME to 0 step -10)
		if(last_delamination_strategy != delamination_strategy)
			count_down_messages = delamination_strategy.count_down_messages()
			last_delamination_strategy = delamination_strategy

		var/message
		var/healed = FALSE

		if(damage < explosion_point) // Cutting it a bit close there engineers
			message = count_down_messages[2]
			healed = TRUE
		else if((i % 50) != 0 && i > 50) // A message once every 5 seconds until the final 5 seconds which count down individualy
			sleep(1 SECONDS)
			continue
		else if(i > 50)
			message = "[DisplayTimeText(i, TRUE)] [count_down_messages[3]]"
		else
			message = "[i*0.1]..."

		radio.talk_into(src, message, emergency_channel)

		if(healed)
			final_countdown = FALSE
			update_appearance()
			return // delam averted
		sleep(1 SECONDS)

	delamination_strategy.delaminate(src)

/proc/supermatter_anomaly_gen(turf/anomalycenter, type = FLUX_ANOMALY, anomalyrange = 5, has_changed_lifespan = TRUE)
	var/turf/local_turf = pick(orange(anomalyrange, anomalycenter))
	if(!local_turf)
		return
<<<<<<< HEAD
	switch(type)
		if(FLUX_ANOMALY)
			var/explosive = has_changed_lifespan ? FLUX_NO_EXPLOSION : FLUX_LOW_EXPLOSIVE
			new /obj/effect/anomaly/flux(local_turf, has_changed_lifespan ? rand(250, 350) : null, FALSE, explosive)
		if(GRAVITATIONAL_ANOMALY)
			new /obj/effect/anomaly/grav(local_turf, has_changed_lifespan ? rand(200, 300) : null, FALSE)
		if(PYRO_ANOMALY)
			new /obj/effect/anomaly/pyro(local_turf, has_changed_lifespan ? rand(150, 250) : null, FALSE)
		if(HALLUCINATION_ANOMALY)
			new /obj/effect/anomaly/hallucination(local_turf, has_changed_lifespan ? rand(150, 250) : null, FALSE)
		if(VORTEX_ANOMALY)
			new /obj/effect/anomaly/bhole(local_turf, 20, FALSE)
		if(BIOSCRAMBLER_ANOMALY)
			new /obj/effect/anomaly/bioscrambler(local_turf, null, FALSE)
		if(DIMENSIONAL_ANOMALY)
			new /obj/effect/anomaly/dimensional(local_turf, null, FALSE)
=======

	var/total_moles = absorbed_gasmix.total_moles()

	for (var/gas_path in absorbed_gasmix.gases)
		gas_percentage[gas_path] = absorbed_gasmix.gases[gas_path][MOLES] / total_moles
		var/datum/sm_gas/sm_gas = GLOB.sm_gas_behavior[gas_path]
		if(!sm_gas)
			continue
		gas_power_transmission += sm_gas.power_transmission * gas_percentage[gas_path]
		gas_heat_modifier += sm_gas.heat_modifier * gas_percentage[gas_path]
		gas_heat_resistance += sm_gas.heat_resistance * gas_percentage[gas_path]
		gas_heat_power_generation += sm_gas.heat_power_generation * gas_percentage[gas_path]
		gas_powerloss_inhibition += sm_gas.powerloss_inhibition * gas_percentage[gas_path]

	gas_heat_power_generation = clamp(gas_heat_power_generation, 0, 1)
	gas_powerloss_inhibition = clamp(gas_powerloss_inhibition, 0, 1)

/**
 * Perform calculation for power lost and gained this tick.
 * Description of each factors can be found in the defines.
 *
 * Updates:
 * [/obj/machinery/power/supermatter_crystal/var/internal_energy]
 * [/obj/machinery/power/supermatter_crystal/var/external_power_trickle]
 * [/obj/machinery/power/supermatter_crystal/var/external_power_immediate]
 *
 * Returns: The factors that have influenced the calculation. list[FACTOR_DEFINE] = number
 */
/obj/machinery/power/supermatter_crystal/proc/calculate_internal_energy()
	if(disable_power_change)
		return
	var/list/additive_power = list()

	/// If we have a small amount of external_power_trickle we just round it up to 40.
	additive_power[SM_POWER_EXTERNAL_TRICKLE] = external_power_trickle ? max(external_power_trickle/MATTER_POWER_CONVERSION, 40) : 0
	external_power_trickle -= min(additive_power[SM_POWER_EXTERNAL_TRICKLE], external_power_trickle)
	additive_power[SM_POWER_EXTERNAL_IMMEDIATE] = external_power_immediate
	external_power_immediate = 0
	additive_power[SM_POWER_HEAT] = gas_heat_power_generation * absorbed_gasmix.temperature / 6

	// I'm sorry for this, but we need to calculate power lost immediately after power gain.
	// Helps us prevent cases when someone dumps superhothotgas into the SM and shoots the power to the moon for one tick.
	/// Power if we dont have decay. Used for powerloss calc.
	var/momentary_power = internal_energy
	for(var/powergain_type in additive_power)
		momentary_power += additive_power[powergain_type]
	if(internal_energy < powerloss_linear_threshold) // Negative numbers
		additive_power[SM_POWER_POWERLOSS] = -1 * (momentary_power / POWERLOSS_CUBIC_DIVISOR) ** 3
	else
		additive_power[SM_POWER_POWERLOSS] = -1 * (momentary_power * POWERLOSS_LINEAR_RATE + powerloss_linear_offset)
	// Positive number
	additive_power[SM_POWER_POWERLOSS_GAS] = -1 * gas_powerloss_inhibition *  additive_power[SM_POWER_POWERLOSS]
	additive_power[SM_POWER_POWERLOSS_SOOTHED] = -1 * min(1-gas_powerloss_inhibition , 0.2 * psy_coeff) *  additive_power[SM_POWER_POWERLOSS]

	for(var/powergain_types in additive_power)
		internal_energy += additive_power[powergain_types]
	internal_energy = max(internal_energy, 0)
	return additive_power

/**
 * Perform calculation for the main zap power multiplier.
 * Description of each factors can be found in the defines.
 *
 * Updates:
 * [/obj/machinery/power/supermatter_crystal/var/zap_multiplier]
 *
 * Returns: The factors that have influenced the calculation. list[FACTOR_DEFINE] = number
 */
/obj/machinery/power/supermatter_crystal/proc/calculate_zap_multiplier()
	var/list/additive_transmission = list()
	additive_transmission[SM_ZAP_BASE] = 1
	additive_transmission[SM_ZAP_GAS] = gas_power_transmission

	zap_multiplier = 0
	for (var/transmission_types in additive_transmission)
		zap_multiplier += additive_transmission[transmission_types]
	zap_multiplier = max(zap_multiplier, 0)
	return additive_transmission

/**
 * Perform calculation for the waste multiplier.
 * This number affects the temperature, plasma, and oxygen of the waste gas.
 * Multiplier is applied to energy for plasma and temperature but temperature for oxygen.
 *
 * Description of each factors can be found in the defines.
 *
 * Updates:
 * [/obj/machinery/power/supermatter_crystal/var/waste_multiplier]
 *
 * Returns: The factors that have influenced the calculation. list[FACTOR_DEFINE] = number
 */
/obj/machinery/power/supermatter_crystal/proc/calculate_waste_multiplier()
	waste_multiplier = 0
	if(disable_gas)
		return
	/// Tell people the heat output in energy. More informative than telling them the heat multiplier.
	var/additive_waste_multiplier = list()
	additive_waste_multiplier[SM_WASTE_BASE] = 1
	additive_waste_multiplier[SM_WASTE_GAS] = gas_heat_modifier
	additive_waste_multiplier[SM_WASTE_SOOTHED] = -0.2 * psy_coeff

	for (var/waste_type in additive_waste_multiplier)
		waste_multiplier += additive_waste_multiplier[waste_type]
	waste_multiplier = clamp(waste_multiplier, 0.5, INFINITY)
	return additive_waste_multiplier

/**
 * Calculate at which temperature the sm starts taking damage.
 * heat limit is given by: (T0C+40) * (1 + gas heat res + psy_coeff)
 *
 * Description of each factors can be found in the defines.
 *
 * Updates:
 * [/obj/machinery/power/supermatter_crystal/var/temp_limit]
 *
 * Returns: The factors that have influenced the calculation. list[FACTOR_DEFINE] = number
 */
/obj/machinery/power/supermatter_crystal/proc/calculate_temp_limit()
	var/list/additive_temp_limit = list()
	additive_temp_limit[SM_TEMP_LIMIT_BASE] = T0C + HEAT_PENALTY_THRESHOLD
	additive_temp_limit[SM_TEMP_LIMIT_GAS] = gas_heat_resistance *  (T0C + HEAT_PENALTY_THRESHOLD)
	additive_temp_limit[SM_TEMP_LIMIT_SOOTHED] = psy_coeff * 45
	additive_temp_limit[SM_TEMP_LIMIT_LOW_MOLES] =  clamp(2 - absorbed_gasmix.total_moles() / 100, 0, 1) * (T0C + HEAT_PENALTY_THRESHOLD)

	temp_limit = 0
	for (var/resistance_type in additive_temp_limit)
		temp_limit += additive_temp_limit[resistance_type]
	temp_limit = max(temp_limit, TCMB)

	return additive_temp_limit

/**
 * Perform calculation for the damage taken or healed.
 * Description of each factors can be found in the defines.
 *
 * Updates:
 * [/obj/machinery/power/supermatter_crystal/var/damage]
 *
 * Returns: The factors that have influenced the calculation. list[FACTOR_DEFINE] = number
 */
/obj/machinery/power/supermatter_crystal/proc/calculate_damage()
	if(disable_damage)
		return

	var/list/additive_damage = list()
	var/total_moles = absorbed_gasmix.total_moles()

	// We dont let external factors deal more damage than the emergency point.
	// Only cares about the damage before this proc is run. We ignore soon-to-be-applied damage.
	additive_damage[SM_DAMAGE_EXTERNAL] = external_damage_immediate * clamp((emergency_point - damage) / emergency_point, 0, 1)
	external_damage_immediate = 0

	additive_damage[SM_DAMAGE_HEAT] = clamp((absorbed_gasmix.temperature - temp_limit) / 2400, 0, 1.5)
	additive_damage[SM_DAMAGE_POWER] = clamp((internal_energy - POWER_PENALTY_THRESHOLD) / 4000, 0, 1)
	additive_damage[SM_DAMAGE_MOLES] = clamp((total_moles - MOLE_PENALTY_THRESHOLD) / 320, 0, 1)

	var/is_spaced = FALSE
	if(isturf(src.loc))
		var/turf/local_turf = src.loc
		for (var/turf/open/space/turf in ((local_turf.atmos_adjacent_turfs || list()) + local_turf))
			additive_damage[SM_DAMAGE_SPACED] = clamp(internal_energy * 0.00125, 0, 10)
			is_spaced = TRUE
			break

	if(total_moles > 0 && !is_spaced)
		additive_damage[SM_DAMAGE_HEAL_HEAT] = clamp((absorbed_gasmix.temperature - temp_limit) / 600, -1, 0)

	var/total_damage = 0
	for (var/damage_type in additive_damage)
		total_damage += additive_damage[damage_type]

	damage_archived = damage
	damage += total_damage
	damage = max(damage, 0)
	return additive_damage

/**
 * Sets the delam of our sm.
 *
 * Arguments:
 * * priority: Truthy values means a forced delam. If current forced_delam is higher than priority we dont run.
 * Set to a number higher than [SM_DELAM_PRIO_IN_GAME] to fully force an admin delam.
 * * delam_path: Typepath of a [/datum/sm_delam]. [SM_DELAM_STRATEGY_PURGE] means reset and put prio back to zero.
 *
 * Returns: Not used for anything, just returns true on succesful set, manual and automatic. Helps admins check stuffs.
 */
/obj/machinery/power/supermatter_crystal/proc/set_delam(priority = SM_DELAM_PRIO_NONE, manual_delam_path = SM_DELAM_STRATEGY_PURGE)
	if(priority < delam_priority)
		return FALSE
	var/datum/sm_delam/new_delam = null

	if(manual_delam_path == SM_DELAM_STRATEGY_PURGE)
		for (var/delam_path in GLOB.sm_delam_list)
			var/datum/sm_delam/delam = GLOB.sm_delam_list[delam_path]
			if(!delam.can_select(src))
				continue
			if(delam == delamination_strategy)
				return FALSE
			new_delam = delam
			break
		delam_priority = SM_DELAM_PRIO_NONE
	else
		new_delam = GLOB.sm_delam_list[manual_delam_path]
		delam_priority = priority

	if(!new_delam)
		return FALSE
	delamination_strategy?.on_deselect(src)
	delamination_strategy = new_delam
	delamination_strategy.on_select(src)
	return TRUE
>>>>>>> db83f6498da3 (Simplifies SM damage calculation, tweaks the numbers. (#70347))

/obj/machinery/proc/supermatter_zap(atom/zapstart = src, range = 5, zap_str = 4000, zap_flags = ZAP_SUPERMATTER_FLAGS, list/targets_hit = list(), zap_cutoff = 1500, power_level = 0, zap_icon = DEFAULT_ZAP_ICON_STATE, color = null)
	if(QDELETED(zapstart))
		return
	. = zapstart.dir
	//If the strength of the zap decays past the cutoff, we stop
	if(zap_str < zap_cutoff)
		return
	var/atom/target
	var/target_type = LOWEST
	var/list/arc_targets = list()
	//Making a new copy so additons further down the recursion do not mess with other arcs
	//Lets put this ourself into the do not hit list, so we don't curve back to hit the same thing twice with one arc
	for(var/atom/test as anything in oview(zapstart, range))
		if(!(zap_flags & ZAP_ALLOW_DUPLICATES) && LAZYACCESS(targets_hit, test))
			continue

		if(istype(test, /obj/vehicle/ridden/bicycle/))
			var/obj/vehicle/ridden/bicycle/bike = test
			if(!HAS_TRAIT(bike, TRAIT_BEING_SHOCKED) && bike.can_buckle)//God's not on our side cause he hates idiots.
				if(target_type != BIKE)
					arc_targets = list()
				arc_targets += test
				target_type = BIKE

		if(target_type > COIL)
			continue

		if(istype(test, /obj/machinery/power/energy_accumulator/tesla_coil/))
			var/obj/machinery/power/energy_accumulator/tesla_coil/coil = test
			if(!HAS_TRAIT(coil, TRAIT_BEING_SHOCKED) && coil.anchored && !coil.panel_open && prob(70))//Diversity of death
				if(target_type != COIL)
					arc_targets = list()
				arc_targets += test
				target_type = COIL

		if(target_type > ROD)
			continue

		if(istype(test, /obj/machinery/power/energy_accumulator/grounding_rod/))
			var/obj/machinery/power/energy_accumulator/grounding_rod/rod = test
			//We're adding machine damaging effects, rods need to be surefire
			if(rod.anchored && !rod.panel_open)
				if(target_type != ROD)
					arc_targets = list()
				arc_targets += test
				target_type = ROD

		if(target_type > LIVING)
			continue

		if(isliving(test))
			var/mob/living/alive = test
			if(!HAS_TRAIT(alive, TRAIT_TESLA_SHOCKIMMUNE) && !HAS_TRAIT(alive, TRAIT_BEING_SHOCKED) && alive.stat != DEAD && prob(20))//let's not hit all the engineers with every beam and/or segment of the arc
				if(target_type != LIVING)
					arc_targets = list()
				arc_targets += test
				target_type = LIVING

		if(target_type > MACHINERY)
			continue

		if(ismachinery(test))
			if(!HAS_TRAIT(test, TRAIT_BEING_SHOCKED) && prob(40))
				if(target_type != MACHINERY)
					arc_targets = list()
				arc_targets += test
				target_type = MACHINERY

		if(target_type > OBJECT)
			continue

		if(isobj(test))
			if(!HAS_TRAIT(test, TRAIT_BEING_SHOCKED))
				if(target_type != OBJECT)
					arc_targets = list()
				arc_targets += test
				target_type = OBJECT

	if(arc_targets.len)//Pick from our pool
		target = pick(arc_targets)

	if(QDELETED(target))//If we didn't found something
		return

	//Do the animation to zap to it from here
	if(!(zap_flags & ZAP_ALLOW_DUPLICATES))
		LAZYSET(targets_hit, target, TRUE)
	zapstart.Beam(target, icon_state=zap_icon, time = 0.5 SECONDS, beam_color = color)
	var/zapdir = get_dir(zapstart, target)
	if(zapdir)
		. = zapdir

	//Going boom should be rareish
	if(prob(80))
		zap_flags &= ~ZAP_MACHINE_EXPLOSIVE
	if(target_type == COIL)
		var/multi = 2
		switch(power_level)//Between 7k and 9k it's 4, above that it's 8
			if(SEVERE_POWER_PENALTY_THRESHOLD to CRITICAL_POWER_PENALTY_THRESHOLD)
				multi = 4
			if(CRITICAL_POWER_PENALTY_THRESHOLD to INFINITY)
				multi = 8
		if(zap_flags & ZAP_SUPERMATTER_FLAGS)
			var/remaining_power = target.zap_act(zap_str * multi, zap_flags)
			zap_str = remaining_power * 0.5 //Coils should take a lot out of the power of the zap
		else
			zap_str /= 3

	else if(isliving(target))//If we got a fleshbag on our hands
		var/mob/living/creature = target
		ADD_TRAIT(creature, TRAIT_BEING_SHOCKED, WAS_SHOCKED)
		addtimer(TRAIT_CALLBACK_REMOVE(creature, TRAIT_BEING_SHOCKED, WAS_SHOCKED), 1 SECONDS)
		//3 shots a human with no resistance. 2 to crit, one to death. This is at at least 10000 power.
		//There's no increase after that because the input power is effectivly capped at 10k
		//Does 1.5 damage at the least
		var/shock_damage = ((zap_flags & ZAP_MOB_DAMAGE) ? (power_level / 200) - 10 : rand(5,10))
		creature.electrocute_act(shock_damage, "Supermatter Discharge Bolt", 1,  ((zap_flags & ZAP_MOB_STUN) ? SHOCK_TESLA : SHOCK_NOSTUN))
		zap_str /= 1.5 //Meatsacks are conductive, makes working in pairs more destructive

	else
		zap_str = target.zap_act(zap_str, zap_flags)

	//This gotdamn variable is a boomer and keeps giving me problems
	var/turf/target_turf = get_turf(target)
	var/pressure = 1
	if(target_turf?.return_air())
		pressure = max(1,target_turf.return_air().return_pressure())
	//We get our range with the strength of the zap and the pressure, the higher the former and the lower the latter the better
	var/new_range = clamp(zap_str / pressure * 10, 2, 7)
	var/zap_count = 1
	if(prob(5))
		zap_str -= (zap_str/10)
		zap_count += 1
	for(var/j in 1 to zap_count)
		var/child_targets_hit = targets_hit
		if(zap_count > 1)
			child_targets_hit = targets_hit.Copy() //Pass by ref begone
		supermatter_zap(target, new_range, zap_str, zap_flags, child_targets_hit, zap_cutoff, power_level, zap_icon, color)

/obj/machinery/power/supermatter_crystal/engine
	is_main_engine = TRUE

/obj/machinery/power/supermatter_crystal/shard
	name = "supermatter shard"
	desc = "A strangely translucent and iridescent crystal that looks like it used to be part of a larger structure."
	base_icon_state = "darkmatter_shard"
	icon_state = "darkmatter_shard"
	anchored = FALSE
	absorption_ratio = 0.125
	explosion_power = 12
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	moveable = TRUE
	psyOverlay = /obj/overlay/psy/shard

/obj/machinery/power/supermatter_crystal/shard/engine
	name = "anchored supermatter shard"
	is_main_engine = TRUE
	anchored = TRUE
	moveable = FALSE

// When you wanna make a supermatter shard for the dramatic effect, but
// don't want it exploding suddenly
/obj/machinery/power/supermatter_crystal/shard/hugbox
	name = "anchored supermatter shard"
	takes_damage = FALSE
	produces_gas = FALSE
	power_changes = FALSE
	processes = FALSE //SHUT IT DOWN
	moveable = FALSE
	anchored = TRUE

/obj/machinery/power/supermatter_crystal/shard/hugbox/fakecrystal //Hugbox shard with crystal visuals, used in the Supermatter/Hyperfractal shuttle
	name = "supermatter crystal"
	base_icon_state = "darkmatter"
	icon_state = "darkmatter"

/obj/overlay/psy
	icon = 'icons/obj/engine/supermatter.dmi'
	icon_state = "psy"
	layer = FLOAT_LAYER - 1

/obj/overlay/psy/shard
	icon_state = "psy_shard"

/atom/movable/supermatter_warp_effect
	plane = GRAVITY_PULSE_PLANE
	appearance_flags = PIXEL_SCALE // no tile bound so you can see it around corners and so
	icon = 'icons/effects/light_overlays/light_352.dmi'
	icon_state = "light"
	pixel_x = -176
	pixel_y = -176

#undef BIKE
#undef COIL
#undef ROD
#undef LIVING
#undef MACHINERY
#undef OBJECT
#undef LOWEST
