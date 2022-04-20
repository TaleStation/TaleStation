<<<<<<< HEAD
// PDA defines //
#define CART_SECURITY (1<<0)
#define CART_ENGINE (1<<1)
#define CART_ATMOS (1<<2)
#define CART_MEDICAL (1<<3)
#define CART_MANIFEST (1<<4)
#define CART_CLOWN (1<<5)
#define CART_MIME (1<<6)
#define CART_REAGENT_SCANNER (1<<7)
#define CART_REMOTE_DOOR (1<<8)
#define CART_STATUS_DISPLAY (1<<9)
#define CART_QUARTERMASTER (1<<10)
#define CART_HYDROPONICS (1<<11)
#define CART_DRONEPHONE (1<<12)
#define CART_DRONEACCESS (1<<13)
=======
// Role disk defines
>>>>>>> cd1b891d79c (Modular Tablets: Converting PDAs to the NtOS System (#65755))

#define DISK_POWER (1<<0)
#define DISK_ATMOS (1<<1)
#define DISK_MED (1<<2)
#define DISK_CHEM (1<<3)
#define DISK_MANIFEST (1<<4)
#define DISK_NEWS (1<<5)
#define DISK_SIGNAL	(1<<6)
#define DISK_STATUS (1<<7)
#define DISK_CARGO (1<<8)
#define DISK_ROBOS (1<<9)
#define DISK_JANI (1<<10)
#define DISK_SEC (1<<11)
#define DISK_BUDGET (1<<12)

// Used to stringify message targets before sending the signal datum.
#define STRINGIFY_PDA_TARGET(name, job) "[name] ([job])"

//N-spect scanner defines
#define INSPECTOR_PRINT_SOUND_MODE_NORMAL 1
#define INSPECTOR_PRINT_SOUND_MODE_CLASSIC 2
#define INSPECTOR_PRINT_SOUND_MODE_HONK 3
#define INSPECTOR_PRINT_SOUND_MODE_FAFAFOGGY 4
#define BANANIUM_CLOWN_INSPECTOR_PRINT_SOUND_MODE_LAST 4
#define CLOWN_INSPECTOR_PRINT_SOUND_MODE_LAST 4
#define INSPECTOR_POWER_USAGE_HONK 15
#define INSPECTOR_POWER_USAGE_NORMAL 5
#define INSPECTOR_TIME_MODE_SLOW 1
#define INSPECTOR_TIME_MODE_FAST 2
#define INSPECTOR_TIME_MODE_HONK 3
