Please read /TG/Stations contributing.md first before reading ours, 

https://github.com/tgstation/tgstation/blob/master/.github/CONTRIBUTING.md

## Welcome to JollyStation!

JollyStation is a never-ending project with a simple goal, to create an enjoyable RP experience using /TG/ code. Together, we'll make an experience everyone can enjoy.

To get started, please review the following segements (after reading /TG/s).

1. [Compiling and Modulairty](#compiling-and-modulairty)
2. [Contributing](#contributing)
3. [The Team](#the-team)
	1.[Maintainer Rules](#maintainer-rules)

## Compiling and Modulairty

### Compiling

We do **NOT** use the tgstation.dme, instead, we use the jollystation.dme. All files ticked will be automatically updated and added to it. **Do not add to the tgstation.dmb**.
This is how we use and access our modular files.

### Modulairty

All code should be kept modular in nature if possible. If unable to, your code MUST include the following comment(s): //NON-MODULE CHANGE/EDIT/START/END.
If adding to a check in the main games files, try to (if possible) put your code at the end. This isn't always feesible, do it where applicable and if it works.
Images are NOT to be added to the main .dmi files. Don't do it. If you need to overwrite something, make a new .dmi file, and copy the master file if needed.

When adding files, trying to follow a similar file path as the main game. For example, if you need to extend certain vars or procs in /code/modules/carbon/, you would do the same file format in jollystation_modules/code/modules/carbon/, this way its somewhat easier to flow through the folders and code if needed. Always start a new file with a comment stating what it is.

## Contributing

If you're unsure always ask, thats the number one rule when contributing.

If you have an idea that would benefit the upstream, we highly reccomend taking it upstream. 

If you had an idea upstream that got denied, do not attempt to open a PR. We are not a "second chance" haven. We'll cite the reason your PR was closed upstream, and close it ourselves, again.

As a rule of thumb, **do not port assets from Goon, even with permissions**. Goon is a different license than /TG/, best to avoid any conflict and/or issues.

### Sprites

As mentioned in the Modualirty section, sprites added to the main games imags (/icons/) will be required to be modularized. Failure to do so will result in your PR being closed. All images should be added to /jollystation_modules/icons/. 

### Maps

As of 3/29/2022, there is no plans to touch the main /TG/ in-rotation maps (Box, Delta, Kilo, Meta, Tram). Touching any of these maps will result in your PR being closed.
If its a critical fix, take it upstream.

Pubby and Lima are our custom in-house maps. They are maintained by everyone, and kept up-to-date with the upstream as much as possible. Edits to these maps are permissible, but will
be kept to the /TG/ stanard. In other words, quality over quantity.

If you are **PORTING** a map from ANOTHER codebase (or even an old map from /TG/) you are **REQUIRED** to get permission from either: the map author or a maptainer. Failure to do so will result in your PR being closed. We won't hound these individuals ourselves.

## The Team

### Host & Not Host

A Byond dunce and an inept Byond coder. They run the place with tape and glue. That'll be Jolly and mcguy9123 (Patchy)

### Maintainers

Maintainers are split up into 3 catagories, Spritetainers (maintain sprites), Maptainers (maintain maps), Maintainers (maintains the code). They hold weigh on merging PRs. They call the shots, and you listen to them. Don't argue with them.

### Maintainer Rules

Maintainers are still held to the same guidelines and expectations as the rest of the contributors, however, they have elevated permissions, and as such, are expected to exercise caution and respect with their powers.

Maintainers SHOULD,
1. Be following /TG/s [precendets](https://github.com/tgstation/tgstation/blob/master/.github/CONTRIBUTING.md#maintainers) on how to act as a maintainer.
2. Be reviewing PRs in a constructive, helpful way, provide feedback when needed, and helping contributors through problems they may encounter.

Maintainers SHOULDN'T,
1. Be self merging their own PRs, unless its a fix, or they have permission.
2. Be merging PRs or encouraging contributors to break the GitHub ToS or submit [banned content](https://github.com/tgstation/tgstation/blob/master/.github/CONTRIBUTING.md#banned-content).
