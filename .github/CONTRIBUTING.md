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

<<<<<<< HEAD
Maintainers SHOULDN'T,
1. Be self merging their own PRs, unless its a fix, or they have permission.
2. Be merging PRs or encouraging contributors to break the GitHub ToS or submit [banned content](https://github.com/tgstation/tgstation/blob/master/.github/CONTRIBUTING.md#banned-content).
=======
- Do not merge PRs you create.
- Do not merge PRs until 24 hours have passed since it was opened. Exceptions include:
  - Emergency fixes.
    - Try to get secondary maintainer approval before merging if you are able to.
  - PRs with empty commits intended to generate a changelog.
- Do not merge PRs that contain content from the [banned content list](./CONTRIBUTING.md#banned-content).

These are not steadfast rules as maintainers are expected to use their best judgement when operating.

Our team is entirely voluntary, as such we extend our thanks to maintainers, issue managers, and contributors alike for helping keep the project alive.

</details>

### Issue Managers

Issue Managers help out the project by labelling bug reports and PRs and closing bug reports which are duplicates or are no longer applicable.

<details>
<summary>What You Can and Can't Do as an Issue Manager</summary>

This should help you understand what you can and can't do with your newfound github permissions.

Things you **CAN** do:
* Label issues appropriately
* Close issues when appropriate
* Label PRs, unless you are goofball.

Things you **CAN'T** do:
* [Close PRs](https://imgur.com/w2RqpX8.png): Only maintainers are allowed to close PRs. Do not hit that button.

</details>

## Development Guides

#### Writing readable code 
[Style guide](./guides/STYLE.md)

#### Writing sane code 
[Code standards](./guides/STANDARDS.md)

#### Writing understandable code 
[Autodocumenting code](./guides/AUTODOC.md)

#### Misc

[Policy configuration system](./guides/POLICYCONFIG.md)

[Hard deletes](./guides/HARDDELETES.md)

[UI Development](../tgui/README.md)

[AI Datums](../code/datums/ai/making_your_ai.md)

[MC Tab Guide](./guides/MC_tab.md)

[Embedding tgui components in chat](../tgui/docs/chat-embedded-components.md)
## Pull Request Process

There is no strict process when it comes to merging pull requests. Pull requests will sometimes take a while before they are looked at by a maintainer; the bigger the change, the more time it will take before they are accepted into the code. Every team member is a volunteer who is giving up their own time to help maintain and contribute, so please be courteous and respectful. Here are some helpful ways to make it easier for you and for the maintainers when making a pull request.

* Make sure your pull request complies to the requirements outlined here

* You are expected to have tested your pull requests if it is anything that would warrant testing. Text only changes, single number balance changes, and similar generally don't need testing, but anything else does. This means by extension web edits are disallowed for larger changes.

* You are going to be expected to document all your changes in the pull request. Failing to do so will mean delaying it as we will have to question why you made the change. On the other hand, you can speed up the process by making the pull request readable and easy to understand, with diagrams or before/after data. Should you be optimizing a routine you must provide proof by way of profiling that your changes are faster.

* We ask that you use the changelog system to document your player facing changes, which prevents our players from being caught unaware by said changes - you can find more information about this [on this wiki page](http://tgstation13.org/wiki/Guide_to_Changelogs).

* If you are proposing multiple changes, which change many different aspects of the code, you are expected to section them off into different pull requests in order to make it easier to review them and to deny/accept the changes that are deemed acceptable.

* If your pull request is accepted, the code you add no longer belongs exclusively to you but to everyone; everyone is free to work on it, but you are also free to support or object to any changes being made, which will likely hold more weight, as you're the one who added the feature. It is a shame this has to be explicitly said, but there have been cases where this would've saved some trouble.

* Please explain why you are submitting the pull request, and how you think your change will be beneficial to the game. Failure to do so will be grounds for rejecting the PR.

* If your pull request is not finished, you may open it as a draft for potential review. If you open it as a full-fledged PR make sure it is at least testable in a live environment. Pull requests that do not at least meet this requirement will be closed. You may request a maintainer reopen the pull request when you're ready, or make a new one.

* While we have no issue helping contributors (and especially new contributors) bring reasonably sized contributions up to standards via the pull request review process, larger contributions are expected to pass a higher bar of completeness and code quality *before* you open a pull request. Maintainers may close such pull requests that are deemed to be substantially flawed. You should take some time to discuss with maintainers or other contributors on how to improve the changes.

* After leaving reviews on an open pull request, maintainers may convert it to a draft. Once you have addressed all their comments to the best of your ability, feel free to mark the pull as `Ready for Review` again.

## Good Boy Points

Each GitHub account has a score known as Good Boy Points, or GBP. This is a system we use to ensure that the codebase stays maintained and that contributors fix bugs as well as add features.

The GBP gain or loss for a PR depends on the type of changes the PR makes, represented by the tags assigned to the PR by the tgstation github bot or maintainers. Generally speaking, fixing bugs, updating sprites, or improving maps increases your GBP score, while adding mechanics, or rebalancing things will cost you GBP.

The GBP change of a PR is the sum of greatest positive and lowest negative values it has. For example, a PR that has tags worth +10, +4, -1, -7, will net 3 GBP (10 - 7).

Negative GBP increases the likelihood of a maintainer closing your PR. With that chance being higher the lower your GBP is. Be sure to use the proper tags in the changelog to prevent unnecessary GBP loss. Maintainers reserve the right to change tags as they deem appropriate.

There is no benefit to having a higher positive GBP score, since GBP only comes into consideration when it is negative.

You can see each tag and their GBP values [Here](https://github.com/tgstation/tgstation/blob/master/.github/gbp.toml). 

## Porting features/sprites/sounds/tools from other codebases

If you are porting features/tools from other codebases, you must give them credit where it's due. Typically, crediting them in your pull request and the changelog is the recommended way of doing it. Take note of what license they use though, porting stuff from AGPLv3 and GPLv3 codebases are allowed.

Regarding sprites & sounds, you must credit the artist and possibly the codebase. All /tg/station assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.

## Banned content
Do not add any of the following in a Pull Request or risk getting the PR closed:
* National Socialist Party of Germany content, National Socialist Party of Germany related content, or National Socialist Party of Germany references
* Code adding, removing, or updating the availability of alien races/species/human mutants without prior approval. Pull requests attempting to add or remove features from said races/species/mutants require prior approval as well.
* Code which violates GitHub's [terms of service](https://github.com/site/terms).

Just because something isn't on this list doesn't mean that it's acceptable. Use common sense above all else.

## A word on Git
This repository uses `LF` line endings for all code as specified in the **.gitattributes** and **.editorconfig** files.

Unless overridden or a non standard git binary is used the line ending settings should be applied to your clone automatically.

Note: VSC requires an [extension](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) to take advantage of editorconfig.

Github actions that require additional configuration are disabled on the repository until ACTION_ENABLER secret is created with non-empty value.
>>>>>>> 3f15c6359c0 (Replaces the weed sprites, and removes the /goon folder. (#66136))
