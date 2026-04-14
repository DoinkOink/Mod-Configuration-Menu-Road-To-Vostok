If you want to warn the player that they need to install the Mod Configuration Menu before they play this example will show you how to do that.

# GUI Warning File
I have created and uploaded a simple pop-up window to the repository that you can download and use in your mod. [You can find it here.](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/blob/main/UI/mcm_not_installed.tscn)

And here is what the pop-up will look like:

<img width="513" height="342" alt="image" src="https://github.com/user-attachments/assets/ba6899e1-ddc9-4a77-9358-9ddc7d85e746" />

It gives the player a direct link to MCM and a way for them to quit the game as this will remove all UI on the screen.

# Setup
We'll have to make a few changes to the file you're registering your mod from. In this example we will continue using the `ExampleModConfig.gd` script.

First you will want to replace the `MCMHelpers = preload()` with `MCMHelpers = load()` this way we can try loading the file without getting an error that crashes the game.

Underneath that we will add a new variable `MCMNotInstalledUI` and use `preload` to load the pop-up window. The path you will place will need to be whatever path you've placed the `mcm_not_installed.tscn` file in. For this example it was placed in the `UI` folder within the mods root folder `ModConfigurationMenu`.

`ExampleModConfig.gd`
```gdscript
extends Node

var McmHelpers = load("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var MCMNotInstalledUI = preload("res://ModConfigurationMenu/UI/mcm_not_installed.tscn")

const FILE_PATH = "user://MCM/ExampleMod"
const MOD_ID = "ExampleMod"

func _ready():
    ...
```

# Displaying The Pop-up
With the UI loaded we are ready to update the end of the `_ready` function where we register the mod with MCM. Here we will use an `if` statement to check if `MCMHelpers` was loaded or not. If it wasn't loaded then we know the player doesn't have MCM installed.

`ExampleModConfig.gd`
```gdscript
...

func _ready():
    ...

	if McmHelpers:
		McmHelpers.RegisterConfiguration(
			MOD_ID,
			"Example Mod",
			FILE_PATH,
			"A short description of the mod",
			{
				"config.ini" = UpdateConfigProperties
			}
		)
	else:
		var _notInstalledUI = MCMNotInstalledUI.instantiate()
		_notInstalledUI.find_child("Link").pressed.connect(func():
			OS.shell_open("https://modworkshop.net/mod/53713")
		)
		_notInstalledUI.find_child("Quit").pressed.connect(func():
			Loader.Quit()
		)
		_notInstalledUI.find_child("Description").text = "Mod Configuration Menu must be installed to use " + MOD_ID + ". The button below will take you to the MCM ModWorkshop page."
		
		for _element in get_parent().get_children():
			if _element.name == "Menu":
				_element.find_child("Main").hide()
				_element.add_child(_notInstalledUI)
```

And with that added your mod is ready to go. You can edit the Description text to whatever you like but don't change the link in `OS.shell_open` as that's how people can easily get to the MCM mod page.

[Up Next: Custom Config Property Sorting >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Custom-Config-Property-Sorting)