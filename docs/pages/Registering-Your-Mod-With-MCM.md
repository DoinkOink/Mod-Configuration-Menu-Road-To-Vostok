Now with the config file created you will need to register your mod with MCM so players can edit the values in the configuration menu. To do this you will need to use the `preload()` function to load the [`MCM_Helper.gd`](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/blob/main/Scripts/Doink%20Oink/MCM_Helpers.gd) script.

This script is is the main file you as a mod author will be using to register your config file with MCM. It holds a handful of helper functions that's used within the mod itself but only 2 that you need to worry about: `RegisterConfigruation` and `CheckConfigurationHasUpdated`. Let's go over the first function.

## ReigsterConfiguration()
This function handles everything needed to register your mods config file(s) with MCM while also setting up any Keycode inputs you have created. Lets go over the needed parameters what what they will be used for.

```gdscript
func RegisterConfiguration(modId: String, modFriendlyName: String, modFilePath: String,
                            modDescription: String, fileOnSaveCallbacks: Dictionary):
```
* `modId: String` - Your mods unique identifier that we have stored in a constant variable previously.
* `modFriendlyName: String` - This is the name that will be displayed on the configuration menu that the player will select when editing settings.
* `modFilePath: String` - The path you've saved your config files in the `user://` data folder.
* `modDescription: String` - A short description for your mod that will be shown when hovering over the `modFriendlyName` button in the configuration menu.
* `fileOnSaveCallbacks: Dictionary` - A dictionary where the key is your config files name and the value is a callable function that will be called when any changes in the configuration menu have been saved.
    * We will go over how to handle updating your values later.

## Referencing the MCM_Helper resource
Now that we've gone over the `RegisterConfiguration` function let's load the `MCM_Helper` file so we can call it. To do this we must use the `preload` function to load `MCM_Helpers.tres` by placing this line below `extends Node`

`ExampleModConfig.gd`
```gdscript
extends Node

var McmHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

const MOD_ID = "ExampleMod"
const FILE_PATH = "user://MCM/ExampleMod"

func _ready():
    ...
```

## Registering your mod and associated config files with MCM
Now with the `MCM_Helper` reference you can call the `RegisterConfigruation` function to register your mod with MCM. This will be done in the `_ready` function after everything in the `if !FileAccess.file_exists(FILE_PATH + "/config.ini"):` statement. You'll also know I've added another function at the bottom `UpdateConfigProperties()`. This is what will be called anytime the `config.ini` file is updated within the configuration menu. **Any function used for the update callback must have a parameter with a type of ConfigFile.**

`ExampleModConfig.gd`
```gdscript
extends Node

var McmHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

const MOD_ID = "ExampleMod"
const FILE_PATH = "user://MCM/ExampleMod"

func _ready():
    ...
    McmHelpers.RegisterConfiguration(
        MOD_ID, # _modId: String
        "Example Mod", # _modFriendlyName: String
        FILE_PATH, # _modFilePath: String
        "A short description of the mod", # _modDescription
        {
            "config.ini" = UpdateConfigProperties # _fileOnSaveCallbacks: Dictionary
        }
    )

func UpdateConfigProperties(config: ConfigFile):
	print(config.get_value("String", "testString"))
```

### Note about multiple config files
While at the moment the `RegisterConfiguration` function can handle multiple configuration files being registered this is not yet implemented (but will be implemented in the future). As of now the first config file in the dictionary is what's shown in the configuration menu.

[Up next: Updating Your Mods Configuration >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Updating-Your-Mods-Configuration)