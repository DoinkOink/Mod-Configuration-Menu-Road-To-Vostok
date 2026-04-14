Within MCM_Helpers there is a function, `CheckConfigurationHasUpdated` which will handle updating a players already existing config file with any new values you as the author has added in future updates. All you need to do is call the function after checking if the file already exists, passing the config file you've made with all the default files.

`ExampleModConfig.gd`
```gdscript
extends Node

var McmHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

const MOD_ID = "ExampleMod"
const FILE_PATH = "user://MCM/ExampleMod"

func _ready():
	var _config = ConfigFile.new()
	_config.set_value("String", "testString", {
		"name" = "Test String",
		"tooltip" = "A test string",
		"default" = "Hello World",
		"value" = "Hello World"
	})

	...
	
	if !FileAccess.file_exists(FILE_PATH + "/config.ini"):
		DirAccess.open("user://").make_dir(FILE_PATH)
		_config.save(FILE_PATH + "/config.ini")
	else:
		CheckConfigurationHasUpdated(MOD_ID, _config, FILE_PATH + "/config.ini")
		_config.load(FILE_PATH + "/config.ini")
		
	McmHelpers.RegisterConfiguration(
		MOD_ID,
		"Example Mod",
		FILE_PATH,
		"A short description of the mod",
		{
			"config.ini" = UpdateConfigProperties
		}
	)
```

That's all that needs to be done. Now anytime you make changes to your config file in future updates players will see the new settings within the configuration menu!

[Up next: Handling Configuration Updates By The Player >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Handling-configuration-updates-by-the-player)