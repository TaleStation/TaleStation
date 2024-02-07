// Defines related to the mining rework circa June 2023
/// Durability of a large size boulder from a large size vent.
#define BOULDER_SIZE_LARGE 15
/// Durability of a medium size boulder from a medium size vent.
#define BOULDER_SIZE_MEDIUM 10
/// Durability of a small size boulder from a small size vent.
#define BOULDER_SIZE_SMALL 5
/// How many boulders can a single ore vent have on it's tile before it stops producing more?
#define MAX_BOULDERS_PER_VENT 10
/// Time multiplier
#define INATE_BOULDER_SPEED_MULTIPLIER 3
// Vent type
/// Large vents, giving large boulders.
#define LARGE_VENT_TYPE "large"
/// Medium vents, giving medium boulders.
#define MEDIUM_VENT_TYPE "medium"
/// Small vents, giving small boulders.
#define SMALL_VENT_TYPE "small"

/// Proximity to a vent that a wall ore needs to be for 5 ore to be mined.
#define VENT_PROX_VERY_HIGH 3
/// Proximity to a vent that a wall ore needs to be for 4 ore to be mined.
#define VENT_PROX_HIGH 6
/// Proximity to a vent that a wall ore needs to be for 3 ore to be mined.
#define VENT_PROX_MEDIUM 15
/// Proximity to a vent that a wall ore needs to be for 2 ore to be mined.
#define VENT_PROX_LOW 32
/// Proximity to a vent that a wall ore needs to be for 1 ore to be mined.
#define VENT_PROX_FAR 64

/// The chance of ore spawning in a wall that is VENT_PROX_VERY_HIGH tiles to a vent.
#define VENT_CHANCE_VERY_HIGH 75
/// The chance of ore spawning in a wall that is VENT_PROX_HIGH tiles to a vent.
#define VENT_CHANCE_HIGH 18
/// The chance of ore spawning in a wall that is VENT_PROX_MEDIUM tiles to a vent.
#define VENT_CHANCE_MEDIUM 9
/// The chance of ore spawning in a wall that is VENT_PROX_LOW tiles to a vent.
#define VENT_CHANCE_LOW 5
/// The chance of ore spawning in a wall that is VENT_PROX_FAR tiles to a vent.
#define VENT_CHANCE_FAR 1

/// The number of points a miner gets for discovering a vent, multiplied by BOULDER_SIZE when completing a wave defense minus the discovery bonus.
#define MINER_POINT_MULTIPLIER 100
/// The multiplier that gets applied for automatically generated mining points.
#define MINING_POINT_MACHINE_MULTIPLIER 0.8

//String defines to use with CaveGenerator presets for what ore breakdown to use.
#define OREGEN_PRESET_LAVALAND "lavaland"
#define OREGEN_PRESET_TRIPLE_Z "triple_z"
