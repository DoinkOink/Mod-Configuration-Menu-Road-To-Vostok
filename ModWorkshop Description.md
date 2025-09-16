# {#3498db}(What is Mod Configuration Menu)
MCM gives mod authors the ability to provide customizable values to the player through an easy to use Configuration Menu while still in game.

A great example use case would be a mod that adds an additional control input. With MCM the author can give the player access to change that input key whenever they want and for the players change to be saved even after the game is closed.

# {#3498db}(How to access the Mod Configuration Menu)
The configuration menu can be accessed in two places
1. In the settings menu from the main menu
2. In the settings menu when hitting escape while in the game

On both menus there will be a new button in the top right of the screen that say "MCM", clicking this button will take you to the configuration menu.

# {#3498db}(How to edit a mods configuration)
Once in the configuration menu on the left hand side you should see a list of all mods that have registered with MCM. All you have to do is click on the mods name you wish to edit which will then populate the right side of the menu with all of the available settings.

When editing a field you will nottice a button pop up to the right of the field with an "X" on it. Clicking this button will revert this value to the original value the mod author set it to.

To save changes either exit out of the menu, by clicking the exit button or by hitting the escape key, or click on one of the other mods listed on the left hand side. MCM will then save the settings automatically.

# {#3498db}(Installation)
* Install the [VostokMods Mod Loader](https://modworkshop.net/mod/49779)
	* Follow the installation instructions for the mod loader
* Move the downloaded ModConfigurationMenu.zip file to the mods folder in your game installation

# {#3498db}(Mod Authors)
If you wish to make your mod compatible head over to the [documentation page](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki) on github for full instructions with an included example script on how to register a configuration file with MCM.

# {#3498db}(Reporting a bug)
To report a bug please head over to the mods [github page and open an issue there.](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/issues)

# {#e74c3c}(Known Mod Conflicts)
I will do my best to make sure this list is as close to 0 as possible either by making MCM as compatible as possible or working along mod authors to fix the conflict.

None right now :)

# {#3498db}(Changelog)
### v1.2.1
* Fixed a typo in the function name `CheckConfigurationHasUpdated`
### V1.2.0
* Added the `CheckConfigruationHasUpdated` function to the MCM_Helpers script
	* This function will allow MCM to update a mods configuration file if there was new settings added with an update. Instructions on how to set this up will be on the [wiki](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki).
### v1.1.1
* Fixed a bug where the MCM folder, that holds the config files for mods, is never initially created by the mod. This would cause mods using MCM not to be able to create config files correctly.
	* Thank you to DeleteBeliever for reporting this and helping me debug the issue.
### v1.1.0
* Removed all overrides to scripts using `class_name`
	* Oldman's Immersive Overhaul and MrJacket's Demo Overhaul are now compatible because of this change
* Fixed an error when changing keycodes while in the main menu
### v1.0.1
* Fixed a crash that would occur when alt tabbing out of the game when loading a scene
### v1.0.0
* Initial mod release
