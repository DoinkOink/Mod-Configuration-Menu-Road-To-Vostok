<p align="center">
    <picture>
    <source width="600px" media="(prefers-color-scheme: dark)" srcset="https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/blob/main/docs/assets/images/mcm_poster_transparent_white.png?raw=true">
    <source width="600px" media="(prefers-color-scheme: light)" srcset="https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/blob/main/docs/assets/images/mcm_poster_transparent_black.png?raw=true">
    <img width="600px" alt="Fallback image description" src="https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/blob/main/docs/assets/images/mcm_poster_transparent_white.png?raw=true">
    </picture>
</p>

# What is Mod Configuration Menu
MCM gives mod authors the ability to provide customizable values to the player through an easy to use Configuration Menu while still in game.

A great example use case would be a mod that adds an additional control input. With MCM the author can give the player access to change that input key whenever they want and for the players change to be saved even after the game is closed.

# How to access the Mod Configuration Menu
The configuration menu can be accessed in two places
1. In the settings menu from the main menu
2. In the settings menu when hitting escape while in the game

On both menus there will be a new button in the top right of the screen that say "MCM", clicking this button will take you to the configuration menu.

# How to edit a mods configuration
Once in the configuration menu on the left hand side you should see a list of all mods that have registered with MCM. All you have to do is click on the mods name you wish to edit which will then populate the right side of the menu with all of the available settings.

When editing a field you will nottice a button pop up to the right of the field with an "X" on it. Clicking this button will revert this value to the original value the mod author set it to.

To save changes either exit out of the menu, by clicking the exit button or by hitting the escape key, or click on one of the other mods listed on the left hand side. MCM will then save the settings automatically.

# Installation
* Install the [VostokMods Mod Loader](https://modworkshop.net/mod/49779)
    * Follow the installation instructions for the mod loader
* Move the downloaded ModConfigurationMenu.zip file to the mods folder in your game installation

# Mod Authors
If you wish to make your mod compatible head over to the [documentation page](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki) on github for full instructions with an included example script on how to register a configuration file with MCM.

# Reporting a bug
To report a bug please head over to the mods [github page and open an issue there.](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/issues)

# Known Mod Conflicts
I will do my best to make sure this list is as close to 0 as possible either by making MCM as compatible as possible or working along mod authors to fix the conflict.

None right now :)

# Changelog
### v2.9.0
* Added a Import/Export system for mod configs
    * Users can now mass export all of their currently loaded mod configs into one single file that can then be shared with other players
    * Users can take those exported config files and import them into their game automatically overriding all of their current settings with the file that's been selected
* Added the `MCM_Config` class
    * Allows devs to more easily create config values and register them to MCM
    * All value types are now created through the `MCM_Config` class using a dot chaining method
    * The `MCM_Config` will now handle everything needed for registering your mod to MCM
        * Creates/Saves the config file
        * Checks if your config has updated if already created on users system
        * Registers the config file with MCM
    * More information on how to use this class can be found on the Wiki
### v2.8.3
* Fixed sliders not updating an Int/Float value properly
* Fixed Array/Dictionaries setting maxRange for any number values to 0 instead of 100 if one isn't provided
    * Thank you to MJRamon for finding these and reporting the issues
### v2.8.2
* Fixed an issue where icons weren't being loaded
    * Thank you to likho1eye for pointing this out
* Fixed an issue with Array and Dictionary values where after pressing the default button it won't appear again
### v2.8.1
* Array's and Dictionary's can be expanded by default with the "expanded" (bool) property
* The Key and Value column labels can now be set with the "keyLabel" (string) and "valueLabel" (string) property
* Can set if values can be added and removed from Array and Dictionary with the "canDeleteAndAdd" (bool) property
* Can set if Dictionary keys can be edited by the player with the "canEditKeys" (bool) property
* Thank you to MJRamon for these suggestions
### v2.8.0
* Remember last opened MCM mod settings by @Joaoha in https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/pull/6
    * Also added Joaoha's changes to the spinner boxes so they keep the SpinnerBox width the same size as the inputted value and removed trailing .0 from the value
* Added Value Property validation
    * Now when configs are being registered to MCM it will check to make sure all required properties are present. If not MCM will log a warning and skip the value
    * The `value` property is now an optional property
        * If it's not present it will be automatically set to whatever the `default` property is set to
* Added the Vector2 and Vector3 value types
    * Check out the Wiki page for implementation
        * [Vector2](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Vector2-Value-Type)
        * [Vector3](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Vector3-Value-Type)
    * Thank you Theta90 for the suggestion on Github
    * These value types combine 2/3 spinner boxes to input x/y/z values
* Added the Array value type
    * [Check out the Wiki page for implementation](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Array-Value-Type)
    * Thank you to MJRamon for the suggestion
    * This value type allows the creation of an array input of a single supported given type which include
        * String
        * Int
        * Float
        * Bool
        * Color
        * Vector2
        * Vector3
        * More may be added but would require significant work to get working
* Added the Dictionary Value type
    * [Check out the Wiki page for implementation](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Dictionary-Value-Type)
    * Thank you to MJRamon for the suggestion
    * Very similar to function as the Array type but gives the player an editable key value as well
* Updated the Keycode value type to allow storing modifier keys alongside the keycode
    * There is nothing that needs to be added on the devs end to get this working
    * [If a dev wishes to set modifier keys as the default head over to the Wiki to see implementation](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Keycode-Value-Type)
* The input mapping spam should hopefully be fixed now
    * MCM now also validates a given Keycode action name isn't already added by another mod
### v2.7.0
* Changed the Dropdown value to accept a dictionary of options
    * Thank you to MJRamon for this request
    * This will allow mod authors to assign Key IDs to their options for easier use in code
    * To see how to integrate this into your mod [check out the Dropdown WiKi page for an example](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Dropdown-Value-Type)
        * Any mods that use the old Array options will still work and will not be required to change to a dictionary
* UI changes by MJRamon
    * Theme styling cleanup
    * Minor adjustments to elements
### v2.6.3
* Fixed an issue where values weren't updating correctly if changed by the mod author
    * Thank you to MJRamon for finding and pointing this out
### v2.6.2
* Removed the "Uncategorized" category whenever there is no Uncategorized values in a mods config
    * Thank you to Gugluv for pointing this issue out
### v2.6.1
* Fixed a folder structure issue that was causing the mod to not load properly
### v2.6.0
* Added the ability for realtime individual value callbacks while the player is changing values within the MCM menu
    * Thank you to tetrahydroc for contributing this addition to MCM
* Added the Category setting for values [head over to the wiki to see how to add this](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Custom-Config-Property-Sorting#adding-category-headers)
    * This will allow mod authors to add category headers to their config menu to better layout settings for users
    * Thank you to MJRamon for the category header UI
### v2.5.1
* Actually fixed the slider issue this time
* Fixed a crash when the player dies
    * Thank you to domfrags for finding this one
* Added the ability to set how many decimal spots are in a Float value with the step value
    * Thank you to False_Hope for the suggestion
### v2.5.0
* Complete redesign of the MCM UI to match the games UI
    * A huge shotout to MJRamon for creating this redesign along with the new logo
* Fixed an issue where the slider would reset values to 100 if it went over
    * Thank you to domfrags for figuring out why this was happening and sending me the solution
### v2.4.0
* The Keycode datatype now allows users to input Mouse Buttons
    * While this doesn't require any extra setup for mod authors to be compatible it is best to implement the new values talked about [here](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Keycode-Value-Type)
    * Thank you to Zippy for bringing this to my attention
### v2.3.2
* Added the ability to disable the alpha channel on the Color Picker value type
### v2.3.1
* Changed how the revert button displays
    * Changed to an Icon instead of using an X for better function readability
    * UI elements will not shift when being hidden/shown anymore
* Fixed the Int slider behaving like a Float
    * Thank you for Oldman for pointing this out
### v2.3.0
* CheckConfigurationHasUpdated has been updated to also remove config values that no longer exist
* The Dropdown value type as been added
    * [Head over to the new wiki page to see how to add this value type](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Dropdown-Value-Type)
    * Thank you for Oldman for the suggesting this
### v2.2.0
* The Color Picker value type has been added
    * [Head over to the new wiki page to see this new value type](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Color-Picker-Value-Type)
    * Thank you for LanaOnTheRhoades for suggesting this
### v2.1.0
* Mod authors can now set custom menu ordering by setting "menu_pos"
    * [A new wiki page has been created going over this feature](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Custom-Config-Property-Sorting)
### v2.0.1
* Fixed the Configuration Menu not being editable while on the main menu
* Fixed the MCM button not showing up in the settings screen on larger displays
    * Thank you to both Bama and CrackpotTheorist from the Vostok discord for helping me test fixes for these issues.
### v2.0.0
* Updated the mod to work with the Next Fest demo
* Configuration tooltips now display
* Changing a configs default value, name, or tooltip will cause the config to be updated when calling `CheckConfigurationHasUpdated`
### v1.2.1
* Fixed a typo in the function name `CheckConfigurationHasUpdated`
### v1.2.0
* Added the `CheckConfigurationHasUpdated` function to the MCM_Helpers script
    * This function will allow MCM to update a mods configuration file if there was new settings added with an update. Instructions on how to set this up will be on the [wiki](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki).
### v1.1.1
* Fixed a bug where the MCM folder, that holds the config files for mods, is never initially created by the mod. This would cause mods using MCM not to be able to create config files correctly.
    * Thank you to DeleteBeliever for reporting this and helping me debug the issue.
### v1.1.0
* Removed all overrides to scripts using `class_name`
    * Oldman's Immersive Overhaul and MrJacket's Demo Overhaul are now compatible because of this change
* Fixed an error when changing keycodes while in the main menu
###  v1.0.1
* Fixed a crash that would occur when alt tabbing out of the game when loading a scene
### v1.0.0
* Initial mod release
