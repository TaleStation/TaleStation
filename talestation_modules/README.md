
# The talestation Module Folder

## MODULES AND YOU:

So you want to add content? Then you've come to the right place. I appreciate you for reading this first before jumping in and adding a bunch of changes to /TG/ files.

We use module files to separate our added content from /TG/ content to prevent un-necessary and excessive merge conflicts when mirroring from /TG/.

What does this mean to you? This means if you want to add something, you should add it in THIS FOLDER (talestation_modules) and not in ANY OF THE OTHER FOLDERS unless absolutely necessary (it usually isn't).

# What if I want to add...

## Icons:

ALWAYS add icons to a new .dmi in the `talestation_modules/icons` folder. Icons are notorious for causing awful terrible impossible-to-resolve-easy merge conflicts so never ever add them to normal codebase .dmi files. Adding icons can be complicated for things such as jumpsuits and IDs, so be sure to ask for help if it gets confusing.

Try to not override an entire icon file, that being, overriding icons on `/obj/item/clothing/under`. If you wish to edit ONE singular piece of clothing, edit that specific piece of clothing MODULARLY. Mass overiding of icon files is not permitted and needlessly increases the RSC bloat.

## Maps & Map edits:

Currently we do not permit edit of the current in-rotation /TG/ maps (Box, Delta, Kilo, Meta, Tram). Any edits to these maps will not be accepted. Copying the map and trying to open it as a modular map will also not be accepted. This goes for any map, ruin, shuttle, ect.

However, KiloStation, LimaStation and PubbyStation are our in-house rotation maps. Edits to these maps are more than fair game. If you wish to expand the rotation map, keep in mind you will be **required** to maintain your map. Failure to do so will have it removed from the code. We will help you, but don't count on us.

## Adding new content:

Create all new content in a new .dm file in the `talestation_modules/code` folder. For the sake of organization, try to keep things contained within specific module folders. Don't think your content fits a specific module? Ask! Try to avoid creating needless random folders. 

If you're adding a new file, please add a comment (example below) with a short explanation of what the file is extending or adding.

`// --This file contains mob/living/carbon/human proc extensions.`

VERY IMPORTANT:

After you make your new folder with your new .dm file, you need to add it to tgstation.dme in alphabetical order - VSCODE will do this automatically if you tick the file.

ALWAYS make sure to comment your code, especially if you're overwriting procs and/or code from main files. This goes for non-modular comments too! This makes it easier to track them.

## A minor change and/or tweak:

If you want to add a behavior to an existing item or object, you should hook it in a new file, instead of adding it to the pre-existing one.

For example, if I have an object `foo_bar` and want to make it do a flip when it's picked up, create a NEW FILE named `foo_bar.dm` in our module folder and add the `cool_flip` proc definition and code in that file. Then, you can call the proc `cool_flip` from `foo_bar/attack` proc in the main file if it already has one defined, or add a `foo_bar/attack` to your new file if it doesn't. Keep as much code as possible in the module files and out of /tg/ files for our sanity.

## Big changes and/or tweaks:

Oh boy. This is where it gets annoying.

You CAN override existing object variable and definitions easily, but adding sweeping changes to multiple procs is more difficult.

Modules exist to minimize merge conflicts with the upstream, but if you want to change the main files then we can't just use modules in most cases.

First: we recommend trying to make the change to the upstream first to save everyone's headaches.

If your idea doesn't have a chance in hell of getting merged to the upstream, there's a most probable chance we won't take it here. However, there are some things to keep in mind IF you decide to PR here,

- Keep your changes to an absolute minimum. Touch as few lines and as few files as possible

- Add a comment before and after your changed code so the spot is known in the future that something was changed

- You should also note in the comment what PR this is coming from for future reference

Something like so:

```

var/epic_variable = 3 // NON-MODULAR CHANGES

```

```

// NON-MODULAR CHANGES START

/obj/foo/bar/proc/do_thing()

to_chat(world, "I added a proc to something")

qdel(src)

// NON-MODULAR CHANGES END

```

- What DOES matter: The formatting of the first part of the comment! The comment MUST start with `// NON-MODULAR`, space included, exact number of forward slashes, capitalized.

- What doesn't matter: what follows above. `// NON-MODULAR CHANGES`, `// NON-MODULAR CHANGES START`, `// NON-MODULAR CHANGES END`, `// NON-MODULAR CHANGES: I did stuff`

## Adding to Vendors:

Go to `talestation_modules/code/modules/vending/_vending.dm` and use the template provided to add or remove items from vendors. Follow the provided template there.

## Defines:

Defines can only be seen by files if it's been compiled beforehand.

- Add any defines you need to use across multiple files to `talestation_modules/code/__DEFINES/_module_defines` OR `talestation_modules/code/__DEFINES/_module_defines.dm` if the define is used in a /tg/ code file.

- Add any defines you need just in that file to the top of the file - make sure to undef it at the end.

# Remvoing Content

Removing ANY content from this codebase goes one of two ways:

## Non-Modularly

These are commented out removals. There should be sufficent backings as to why this is being removed.
Trying to remove/delete TG master files will not be accepted. Take your reasoning upstream if thats the case.

## Modularly

These are removals that are on our code. Any removals of our code should be archived here: https://github.com/TaleStation/TaleStation-Archive
Things you can archive are:

- Any sort of code
- Sprites
- Maps (and any associated code)
- Sounds

Please make sure everything is properly accounted for.

# Important other notes:

If you're ever confused, always make sure to ask questions. The system itself shouldn't be too difficult to navigate, but can induce some headaches if you're unsure what to do. The number one rule of contributing, always ask for help if you're not sure!
