// This whole file is just a container for the spiderling subtypes that actually differentiate into different giant spiders. None of them are particularly special as of now.

<<<<<<< HEAD
/// Will differentiate into the base giant spider (known colloquially as the "guard" spider).
/mob/living/basic/spiderling/guard
	grow_as = /mob/living/basic/giant_spider/guard
	name = "guard spiderling"
	desc = "Furry and brown, it looks defenseless. This one has sparkling red eyes."

	/// Will differentiate into the "ambush" giant spider.
/mob/living/basic/spiderling/ambush
	grow_as = /mob/living/basic/giant_spider/ambush
=======
/// Will differentiate into the base young spider (known colloquially as the "guard" spider).
/mob/living/basic/spider/growing/spiderling/guard
	grow_as = /mob/living/basic/spider/growing/young/guard
	name = "guard spiderling"
	desc = "Furry and brown, it looks defenseless. This one has sparkling red eyes."

/// Will differentiate into the "ambush" young spider.
/mob/living/basic/spider/growing/spiderling/ambush
	grow_as = /mob/living/basic/spider/growing/young/ambush
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "ambush spiderling"
	desc = "Furry and white, it looks defenseless. This one has sparkling pink eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "ambush_spiderling"
	icon_dead = "ambush_spiderling_dead"

<<<<<<< HEAD
/// Will differentiate into the "scout" giant spider.
/mob/living/basic/spiderling/scout
	grow_as = /mob/living/basic/giant_spider/scout
=======
/// Will differentiate into the "scout" young spider.
/mob/living/basic/spider/growing/spiderling/scout
	grow_as = /mob/living/basic/spider/growing/young/scout
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "scout spiderling"
	desc = "Furry and black, it looks defenseless. This one has sparkling purple eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "scout_spiderling"
	icon_dead = "scout_spiderling_dead"

<<<<<<< HEAD
/// Will differentiate into the "hunter" giant spider.
/mob/living/basic/spiderling/hunter
	grow_as = /mob/living/basic/giant_spider/hunter
=======
/// Will differentiate into the "hunter" young spider.
/mob/living/basic/spider/growing/spiderling/hunter
	grow_as = /mob/living/basic/spider/growing/young/hunter
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "hunter spiderling"
	desc = "Furry and black, it looks defenseless. This one has sparkling purple eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "hunter_spiderling"
	icon_dead = "hunter_spiderling_dead"

<<<<<<< HEAD
/// Will differentiate into the "nurse" giant spider.
/mob/living/basic/spiderling/nurse
	grow_as = /mob/living/basic/giant_spider/nurse
=======
/// Will differentiate into the "nurse" young spider.
/mob/living/basic/spider/growing/spiderling/nurse
	grow_as = /mob/living/basic/spider/growing/young/nurse
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "nurse spiderling"
	desc = "Furry and black, it looks defenseless. This one has sparkling green eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "nurse_spiderling"
	icon_dead = "nurse_spiderling_dead"

<<<<<<< HEAD
	/// Will differentiate into the "tangle" giant spider.
/mob/living/basic/spiderling/tangle
	grow_as = /mob/living/basic/giant_spider/tangle
=======
/// Will differentiate into the "tangle" young spider.
/mob/living/basic/spider/growing/spiderling/tangle
	grow_as = /mob/living/basic/spider/growing/young/tangle
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "tangle spiderling"
	desc = "Furry and brown, it looks defenseless. This one has dim brown eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "tangle_spiderling"
	icon_dead = "tangle_spiderling_dead"

<<<<<<< HEAD
/// Will differentiate into the "midwife" giant spider.
/mob/living/basic/spiderling/midwife
	grow_as = /mob/living/basic/giant_spider/midwife
=======
/// Will differentiate into the "midwife" young spider.
/mob/living/basic/spider/growing/spiderling/midwife
	grow_as = /mob/living/basic/spider/growing/young/midwife
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "broodmother spiderling"
	desc = "Furry and black, it looks defenseless. This one has scintillating green eyes. Might also be hiding a real knife somewhere."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "midwife_spiderling"
	icon_dead = "midwife_spiderling_dead"
	gold_core_spawnable = NO_SPAWN

<<<<<<< HEAD
/// Will differentiate into the "viper" giant spider.
/mob/living/basic/spiderling/viper
	grow_as = /mob/living/basic/giant_spider/viper
=======
/// Will differentiate into the "viper" young spider.
/mob/living/basic/spider/growing/spiderling/viper
	grow_as = /mob/living/basic/spider/growing/young/viper
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "viper spiderling"
	desc = "Furry and black, it looks defenseless. This one has sparkling purple eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "viper_spiderling"
	icon_dead = "viper_spiderling_dead"
	gold_core_spawnable = NO_SPAWN

<<<<<<< HEAD
/// Will differentiate into the "tarantula" giant spider.
/mob/living/basic/spiderling/tarantula
	grow_as = /mob/living/basic/giant_spider/tarantula
=======
/// Will differentiate into the "tarantula" young spider.
/mob/living/basic/spider/growing/spiderling/tarantula
	grow_as = /mob/living/basic/spider/growing/young/tarantula
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
	name = "tarantula spiderling"
	desc = "Furry and black, it looks defenseless. This one has abyssal red eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "tarantula_spiderling"
	icon_dead = "tarantula_spiderling_dead"
<<<<<<< HEAD
	gold_core_spawnable = NO_SPAWN

/// Will differentiate into the "hunter" giant spider.
/mob/living/basic/spiderling/hunter/flesh
	grow_as = /mob/living/basic/giant_spider/hunter/flesh
	name = "hunter spiderling"
	desc = "Fleshy and red, it looks defenseless. This one has sparkling cerulean eyes."
	icon = 'icons/mob/simple/arachnoid.dmi'
	icon_state = "flesh_spiderling"
	icon_dead = "flesh_spiderling_dead"
	gold_core_spawnable = NO_SPAWN
=======
>>>>>>> 497f18ea3215f (Spiders don't automatically grant an antag datum (#77523))
