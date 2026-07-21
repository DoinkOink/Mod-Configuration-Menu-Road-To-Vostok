# {#e74c3c}(Priority)
MCM MUST always be the first mod being loaded so all other mods can access it when they load. Make sure to set the priority in Metro Mod Loader to something very low like -100 if it isn't automatically set to that.

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

# {#3498db}(Configuration Profiles)
MCM works alongside Metro Mod Loader's mod profile system to offer your profile specific configuration settings. Any changes made while using a specific Mod Profile will only change for that profile. Any other profiles, or even the default profile, will not take on those changes.

# {#3498db}(How to Import/Export mod configuration)
For those of you that wish to share your mod configurations with friends, the community, or even create a mod list to share out MCM comes with an easy Importing and Exporting feature for you to use that outputs to a single config file. [Head on over to the Wiki to see how to use this feature](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Import-Export-Guide).

# {#3498db}(Installation)
* Install the [Metro Mod Loader](https://modworkshop.net/mod/55623)
    * Follow the installation instructions for the mod loader
* Move the downloaded ModConfigurationMenu.vmz file to the mods folder in your game installation

# {#3498db}(Mod Authors)
If you wish to make your mod compatible head over to the [documentation page](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki) on github for full instructions with an included example script on how to register a configuration file with MCM.

# {#3498db}(Reporting a bug)
To report a bug please head over to the mods [github page and open an issue there.](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/issues)

# {#e74c3c}(Known Mod Conflicts)
I will do my best to make sure this list is as close to 0 as possible either by making MCM as compatible as possible or working along mod authors to fix the conflict.

None right now :)

### [Full Changelog](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok#changelog)
