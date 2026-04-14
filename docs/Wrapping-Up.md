That is everything you need to know on how to use MCM along with your mods to help players easily change values during gameplay. Remember to add MCM as a dependency to your ModWorkshop page so players know to download it as well or else the game won't properly launch without it being installed.

Here is the full completed `ExampleModConfig.gd` script.
```gdscript
extends Node

var McmHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

const MOD_ID = "ExampleMod"
const FILE_PATH = "user://MCM/ExampleMod"

func _ready():
	var _config = ConfigFile.new()
	_config.set_value("Int", "testInt", {
		"name" = "Test Int",
		"tooltip" = "A test int",
		"default" = 5,
		"value" = 5,
		"minRange" = 0,
		"maxRange" = 20
	})
	
	_config.set_value("Bool", "testBool1", {
		"name" = "Test Bool 1",
		"tooltip" = "The first test bool",
		"default" = false,
		"value" = false
	})
	
	_config.set_value("Bool", "testBool2", {
		"name" = "Test Bool 2",
		"tooltip" = "The first test bool",
		"default" = true,
		"value" = true
	})
	
	_config.set_value("Float", "testFloat", {
		"name" = "Test Float",
		"tooltip" = "A test float",
		"default" = 10.3,
		"value" = 10.3,
		"minRange" = 0,
		"maxRange" = 50.5
	})
	
	_config.set_value("Keycode", "testKeycode", {
		"name" = "Test Keycode",
		"tooltip" = "A test keycode",
		"default" = KEY_ALT,
		"default_type" = "Key",
		"value" = KEY_ALT,
		"type" = "Key"
	})
	
	_config.set_value("String", "testString", {
		"name" = "Test String",
		"tooltip" = "A test string",
		"default" = "Hello World",
		"value" = "Hello World"
	})
	
	_config.set_value("Color", "testColor", {
		"name" = "Test Color",
		"tooltip" = "A test color",
		"default" = Color.WHITE,
		"value" = Color.WHITE
	})
	
	_config.set_value("Dropdown", "testDropdown", {
		"name" = "Test Dropdown",
		"tooltip" = "A test dropdown",
		"default" = 1,
		"value" = 1,
		"options" = [
			"Option 1",
			"Option 2",
			"Option 3"
		]
	})
		
	if !FileAccess.file_exists(FILE_PATH + "/config.ini"):
		DirAccess.open("user://").make_dir(FILE_PATH)
		_config.save(FILE_PATH + "/config.ini")
	else:
		McmHelpers.CheckConfigurationHasUpdated(MOD_ID, _config, FILE_PATH + "/config.ini")
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

func UpdateConfigProperties(config: ConfigFile):
	print(config.get_value("String", "testString"))
    
func _input(event):
    if (Input.is_action_pressed("testKeycode")):
        print("Test Keycode Pressed")
```

[Up Next: MCM Not Installed Warning >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Extra:-MCM-Not-Installed-Warning)