/// -- Defines for antag datums and advanced antag datums. --
/// Whether the antagonist can see exploitable info on people they examine.
#define CAN_SEE_EXPOITABLE_INFO (1<<0)

/// Initial / base TC for advanced traitors.
#define ADV_TRAITOR_INITIAL_TC 8
/// Max amount of TC advanced traitors can get.
#define ADV_TRAITOR_MAX_TC 40
/// Amount of TC gained per intensity level
#define ADV_TRAITOR_TC_PER_INTENSITY 2

/// Initial / base processing points for malf AI advanced traitors.
#define ADV_TRAITOR_INITIAL_MALF_POINTS 20
/// Max amount of processing points for malf AI advanced traitors.
#define ADV_TRAITOR_MAX_MALF_POINTS 60
/// Amount of rocessing points gained per intensity level
#define ADV_TRAITOR_MALF_POINTS_PER_INTENSITY 5

/// Initial / base charges a heretic gets.
#define ADV_HERETIC_INITIAL_INFLUENCE 0
/// Max amount of influence charges for heretic advanced traitors.
#define ADV_HERETIC_MAX_INFLUENCE 5
/// The number of changes given for disabling ascension
#define ADV_HERETIC_NO_ASCENSION_INFLUENCE 2
/// This number is added onto the max influences if ascencion is given up.
#define ADV_HERETIC_NO_ASCENSION_MAX 2
/// Number of influences gained per intensity level
#define ADV_HERETIC_INFLUENCE_PER_INTENSITY 0.33

/// The max number of spells a cultist can invoke with and without a rune.
#define ADV_CULTIST_MAX_SPELLS_NORUNE 1
#define ADV_CULTIST_MAX_SPELLS_RUNE 4

/// Styles of cult.
#define CULT_STYLE_NARSIE "Nar'sian Cult"
#define CULT_STYLE_RATVAR "Rat'varian Cult"

/// Trait for people who were recently funnyhanded and can't be for a few seconds. (See TRAIT_IWASBATONNED)
#define TRAIT_I_WAS_FUNNY_HANDED "i_was_funny_handed"
/// Trait for people who were recently funnyhanded and won't recieve any side effects (but will recieve stamina damage)
#define TRAIT_NO_FUNNY_HAND_SIDE_EFFECTS "no_funny_hand_side_effects"
/// Trait for people who were ""sacrificed"" by a cultist and shouldn't get more side effects
#define TRAIT_WAS_ON_CONVERSION_RUNE "no_sac_side_effects"

#define CONVERSION_FAILED -1
#define CONVERSION_NOT_ALLOWED 0
#define CONVERSION_MINDSHIELDED 1
#define CONVERSION_HOLY 2
#define CONVERSION_SUCCESS 3

#define ADD_CLOCKCULT_FILTER(target) target.add_filter("ratvar_glow", 5, list("type" = "outline", "size" = 1, "color" = "#cc9900", "flags" = 0))
#define REMOVE_CLOCKCULT_FILTER(target) target.remove_filter("ratvar_glow")

/// The initial number of points for changelings
#define ADV_CHANGELING_INITIAL_POINTS 4
/// The max number of points for changelings
#define ADV_CHANGELING_MAX_POINTS 12
/// How many points a changeling gets per intensity level
#define ADV_CHANGELING_POINTS_PER_INTENSITY 0.5
/// How much chem storage a changeling gets per genetic point
#define ADV_CHANGELING_CHEM_PER_POINTS 7.5

/// Some is_helpers for changelings. Bear in mind these return the changeling antag datum that is found.
#define is_any_changeling(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/changeling))
#define is_adult_changeling(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/changeling, FALSE) || mob?.mind?.has_antag_datum(/datum/antagonist/changeling/advanced, FALSE))
#define is_fresh_changeling(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/changeling/fresh))
#define is_neutered_changeling(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/changeling/neutered))
#define is_fallen_changeling(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/fallen_changeling))
#define is_defeated_changeling(mob) (is_fallen_changeling(mob) || is_neutered_changeling(mob))

// Defines for the changeling ability Adaptive Mimic Voice.
/// Mob trait that makes the mob behave as if they passively had a syndicate voice changer.
#define TRAIT_VOICE_MATCHES_ID "voice_matches_id"
/// Source for the mob trait.
#define CHANGELING_ABILITY "trait_source_ling"

// Defines for Hivemind Chat, for changelings.
/// Mob trait for linglinked mobs.
#define TRAIT_LING_LINKED "ling_linked"
/// Mob trait for hivemind muted mobs.
#define TRAIT_LING_MUTE "ling_muted"
/// Binary flags for ling hivemind chat statuses.
#define LING_HIVE_NONE 0 // Not a ling
#define LING_HIVE_LING 1 // Is a ling
#define LING_HIVE_NOT_AWOKEN 2 // Is a ling, but no hivemind
#define LING_HIVE_OUTSIDER 3 // Not a ling, but linglinked

/// Changeling hivemind mode stuff.
#define MODE_CHANGELING "changeling"
#define MODE_KEY_CHANGELING "g"
#define MODE_TOKEN_CHANGELING ":g"

/// Max amount of goals an advanced traitor can add.
#define ADV_TRAITOR_MAX_GOALS 5
/// Max amount of similar objectives an advanced traitor can add.
#define ADV_TRAITOR_MAX_SIMILAR_OBJECTIVES 5

/// Max char length of goals.
#define ADV_TRAITOR_MAX_GOAL_LENGTH 250
/// Max char length of notes.
#define ADV_TRAITOR_MAX_NOTE_LENGTH 175

/// Intensity levels for advanced antags.
#define ADV_TRAITOR_INTENSITIES list( \
	"5 = Mass killings, destroying entire departments", \
	"4 = Mass sabotage (engine delamination)", \
	"3 = Assassination / Grand Theft", \
	"2 = Kidnapping / Theft", \
	"1 = Minor theft or basic antagonizing" )

/// Infiltrator uplink
#define UPLINK_INFILTRATOR (1 << 3)

/// Infiltrator antag type
#define ROLE_INFILTRATOR "Infiltrator"

// Antag UI tutorial defines
/// Defines for tutorial state.
#define TUTORIAL_OFF -1
/// Defines for state of the background tutorial.
#define TUTORIAL_BACKGROUND_START 0
#define TUTORIAL_BACKGROUND_NAME 1
#define TUTORIAL_BACKGROUND_EMPLOYER 2
#define TUTORIAL_BACKGROUND_BACKSTORY 3
#define TUTORIAL_BACKGROUND_END (TUTORIAL_BACKGROUND_BACKSTORY+1)
/// Defines for state of the objective tutorial.
#define TUTORIAL_OBJECTIVE_START 0
#define TUTORIAL_OBJECTIVE_ADD_GOAL 1
#define TUTORIAL_OBJECTIVE_EDIT_GOAL 2
#define TUTORIAL_OBJECTIVE_INTENSITIES 3
#define TUTORIAL_OBJECTIVE_SIM_OBJECTIVES 4
#define TUTORIAL_OBJECTIVE_SIM_OBJECTIVES_EXTRA 5
#define TUTORIAL_OBJECTIVE_END (TUTORIAL_OBJECTIVE_SIM_OBJECTIVES_EXTRA+1)

/**
 * Bloodsucker defines
 */

///Whether a mob is a Bloodsucker
#define IS_BLOODSUCKER(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/bloodsucker))
///Whether a mob is a Vassal
#define IS_VASSAL(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/vassal))
///Whether a mob is a Favorite Vassal
#define IS_FAVORITE_VASSAL(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/vassal/favorite))

/**
 * Traits
 */
/// Your heart doesn't beat
#define TRAIT_NOPULSE "nopulse"
/// Falsifies Health analyzer blood levels
#define TRAIT_MASQUERADE "masquerade"
/// Your body is literal room temperature. Does not make you immune to the temp
#define TRAIT_COLDBLOODED "coldblooded"

/**
 * Sources5
 */
/// Source trait for Bloodsuckers-related traits
#define BLOODSUCKER_TRAIT "bloodsucker_trait"
/// Source trait while Feeding
#define FEED_TRAIT "feed_trait"
/// Source trait during a Frenzy
#define FRENZY_TRAIT "frenzy_trait"


/// Determines Bloodsucker regeneration rate
#define BS_BLOOD_VOLUME_MAX_REGEN 700
/// Cost to torture someone, in blood
#define TORTURE_BLOOD_COST "15"
/// Cost to convert someone after successful torture, in blood
#define TORTURE_CONVERSION_COST "50"
/// Once blood is this low, will enter Frenzy
#define FRENZY_THRESHOLD_ENTER 25
/// Once blood is this high, will exit Frenzy
#define FRENZY_THRESHOLD_EXIT 250
/// You have special interactions with Bloodsuckers
#define TRAIT_BLOODSUCKER_HUNTER "bloodsucker_hunter"

///Drinks blood the normal Bloodsucker way.
#define BLOODSUCKER_DRINK_NORMAL "bloodsucker_drink_normal"
///Drinks blood but is snobby, refusing to drink from mindless
#define BLOODSUCKER_DRINK_SNOBBY "bloodsucker_drink_snobby"
///Drinks blood from disgusting creatures without Humanity consequences.
#define BLOODSUCKER_DRINK_INHUMANELY "bloodsucker_drink_imhumanely"

#define BLOODSUCKER_RANK_UP_NORMAL "bloodsucker_rank_up_normal"
#define BLOODSUCKER_RANK_UP_VASSAL "bloodsucker_rank_up_vassal"

/**
 * Cooldown defines
 * Used in Cooldowns Bloodsuckers use to prevent spamming
 */
///Spam prevention for healing messages.
#define BLOODSUCKER_SPAM_HEALING (15 SECONDS)
///Span prevention for Sol messages.
#define BLOODSUCKER_SPAM_SOL (30 SECONDS)

/**
 * Clan defines
 */
#define CLAN_NONE "Caitiff"
#define CLAN_BRUJAH "Brujah Clan"
#define CLAN_TOREADOR "Toreador Clan"
#define CLAN_NOSFERATU "Nosferatu Clan"
#define CLAN_TREMERE "Tremere Clan"
#define CLAN_GANGREL "Gangrel Clan"
#define CLAN_VENTRUE "Ventrue Clan"
#define CLAN_MALKAVIAN "Malkavian Clan"

#define TREMERE_VASSAL "tremere_vassal"
#define FAVORITE_VASSAL "favorite_vassal"
#define REVENGE_VASSAL "revenge_vassal"

/**
 * Power defines
 */
/// This Power can't be used in Torpor
#define BP_CANT_USE_IN_TORPOR (1<<0)
/// This Power can't be used in Frenzy.
#define BP_CANT_USE_IN_FRENZY (1<<1)
/// This Power can't be used with a stake in you
#define BP_CANT_USE_WHILE_STAKED (1<<2)
/// This Power can't be used while incapacitated
#define BP_CANT_USE_WHILE_INCAPACITATED (1<<3)
/// This Power can't be used while unconscious
#define BP_CANT_USE_WHILE_UNCONSCIOUS (1<<4)

/// This Power can be purchased by Bloodsuckers
#define BLOODSUCKER_CAN_BUY (1<<0)
/// This is a Default Power that all Bloodsuckers get.
#define BLOODSUCKER_DEFAULT_POWER (1<<1)
/// This Power can be purchased by Tremere Bloodsuckers
#define TREMERE_CAN_BUY (1<<2)
/// This Power can be purchased by Vassals
#define VASSAL_CAN_BUY (1<<3)

/// This Power is a Toggled Power
#define BP_AM_TOGGLE (1<<0)
/// This Power is a Single-Use Power
#define BP_AM_SINGLEUSE (1<<1)
/// This Power has a Static cooldown
#define BP_AM_STATIC_COOLDOWN (1<<2)
/// This Power doesn't cost bloot to run while unconscious
#define BP_AM_COSTLESS_UNCONSCIOUS (1<<3)

/**
 * Signals
 */
///Called when a Bloodsucker ranks up: (datum/bloodsucker_datum, mob/owner, mob/target)
#define BLOODSUCKER_RANK_UP "bloodsucker_rank_up"

///Called when a Bloodsucker attempts to make a Vassal into their Favorite.
#define BLOODSUCKER_PRE_MAKE_FAVORITE "bloodsucker_pre_make_favorite"
///Called when a Bloodsucker makes a Vassal into their Favorite Vassal: (datum/vassal_datum, mob/master)
#define BLOODSUCKER_MAKE_FAVORITE "bloodsucker_make_favorite"
///Called when a new Vassal is successfully made: (datum/bloodsucker_datum)
#define BLOODSUCKER_MADE_VASSAL "bloodsucker_made_vassal"

///Called on Bloodsucker's LifeTick()
#define BLOODSUCKER_HANDLE_LIFE "bloodsucker_handle_life"
///Called when a Bloodsucker exits Torpor.
#define BLOODSUCKER_EXIT_TORPOR "bloodsucker_exit_torpor"
///Called when a Bloodsucker reaches Final Death.
#define BLOODSUCKER_FINAL_DEATH "bloodsucker_final_death"
