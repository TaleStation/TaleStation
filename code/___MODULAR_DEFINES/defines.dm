// I really really really hate load order and this is being a bitch

/*
* Access Defines
*/
/// Asset Protection access
#define ACCESS_AP "ap"
/// Bridge Officer access
#define ACCESS_BO "bo"
/// XenoBotany access
#define ACCESS_XENOBOTANY "xenobot"

/*
* LOOC defines
*/
/// LOOC message define
#define MESSAGE_TYPE_LOOC "looc"
/// Directs what channel is used for TGUI chat windows
#define LOOC_CHANNEL "LOOC"

/*
* DNA/Species defines
*/
/// NOTE: Do NOT move the rest of the defines from code/__DEFINES/DNA.dm due to the number of blocks needed

/// Skrell head tentacles
#define ORGAN_SLOT_EXTERNAL_HEAD_TENTACLES "head_tentacles"
/// Tajaran body markings
#define ORGAN_SLOT_EXTERNAL_TAJARAN_MARKINGS "tajaran_markings"
/// Tajaran snout
#define ORGAN_SLOT_EXTERNAL_TAJARAN_SNOUT "tajaran_snout"
/// Avian beak
#define ORGAN_SLOT_EXTERNAL_AVIAN_BEAK "avian_beak"
/// Avian left talon
#define ORGAN_SLOT_EXTERNAL_AVIAN_TALON_L "avian_talon_l"
/// Avian right talon
#define ORGAN_SLOT_EXTERNAL_AVIAN_TALON_R "avian_talon_r"

/*
* Job defines
*/
// Command
#define JOB_ASSET_PROTECTION "Asset Protection"
#define JOB_BRIDGE_OFFICER "Bridge Officer"

// Science
#define JOB_XENOBIOLOGIST "Xenobiologist"

// Positioning
#define JOB_DISPLAY_ORDER_ASSET_PROTECTION 36
#define JOB_DISPLAY_ORDER_BRIDGE_OFFICER 37
#define JOB_DISPLAY_ORDER_XENOBIOLOGIST 39

// Supervisor
#define SUPERVISOR_COMMAND "the Heads of Staff and the Captain"

/*
* Flavor text defines
*/
/// Max amount of flavor text allowed
#define MAX_FLAVOR_LEN 4096

/// How many characters will be displayed in the flavor text preview before we cut it off?
#define FLAVOR_PREVIEW_LIMIT 110
// NON-MODULAR CHANGES END

/// Min flavor text required to join a round
#define FLAVOR_TEXT_CHAR_REQUIREMENT 125

/*
* Pain Defines
*/
#define BODY_ZONES_ALL list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

//Originally in pain_helpers.dm, moved here for superseding issues
/// Cause [amount] pain of default (BRUTE) damage type to [target_zone]
#define cause_pain(target_zone, amount) pain_controller?.adjust_bodypart_pain(target_zone, amount)
/// Cause [amount] pain of [type] damage type to [target_zone]
#define cause_typed_pain(target_zone, amount, dam_type) pain_controller?.adjust_bodypart_pain(target_zone, amount, dam_type)
/// Do pain related [emote] from a mob, and start a [cooldown] long cooldown before a pain emote can be done again.
#define pain_emote(emote, cooldown) pain_controller?.do_pain_emote(emote, cooldown)
/// Increase the minimum amount of pain [zone] can have for [time]
#define apply_min_pain(target_zone, amount, time) apply_status_effect(/datum/status_effect/minimum_bodypart_pain, target_zone, amount, time)
/// Set [id] pain mod to [amount]
#define set_pain_mod(id, amount) pain_controller?.set_pain_modifier(id, amount)
/// Unset [id] pain mod
#define unset_pain_mod(id) pain_controller?.unset_pain_modifier(id)
