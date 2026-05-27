That is everything you need to know on how to use MCM along with your mods to help players easily change values during gameplay. Remember to add MCM as a dependency to your ModWorkshop page so players know to download it as well or else the game won't properly launch without it being installed.

Here is the full completed `ExampleModConfig.gd` script.
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

	_config.set_value("Int", "testInt", {
		"name" = "Test Int",
		"tooltip" = "A test int",
		"default" = 5,
		"value" = 5,
		"minRange" = 0,
		"maxRange" = 20,
		"step" = 1
	})

	_config.set_value("Float", "testFloat", {
		"name" = "Test Float",
		"tooltip" = "A test float",
		"default" = 10.3,
		"value" = 10.3,
		"minRange" = 0,
		"maxRange" = 50.5,
		"step" = 0.001
	})
	
	_config.set_value("Bool", "testBool", {
		"name" = "Test Bool",
		"tooltip" = "The first test bool",
		"default" = false,
		"value" = false
	})
	
	_config.set_value("Keycode", "testKeycode", {
		"name" = "Test Keycode",
		"tooltip" = "A test keycode",
		"default" = KEY_ALT,
		"default_type" = "Key",
		"value" = KEY_ALT,
		"type" = "Key"
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
		"default" = "opt_2",
		"value" = "opt_2",
		"options" = {
			"opt_1": "Option 1",
			"opt_2": "Option 2",
			"opt_3": "Option 3"
		}
	})

	_config.set_value("Vector2", "testVector2", {
		"name": "Test Vector2",
		"tooltip": "A test vector2",
		"default": Vector2(10, 10),
		"value": Vector2(10, 10),
		"minRange": Vector2(0, 2),
		"maxRange": Vector2(50, 40),
		"step": 0.5,
		"isInt": false
	})

	_config.set_value("Vector3", "testVector3", {
		"name": "Test Vector3",
		"tooltip": "A test vector3",
		"default": Vector3(10, 10, 10),
		"value": Vector3(10, 10, 10),
		"minRange": Vector3(0, 2, -10),
		"maxRange": Vector3(50, 40, 20),
		"step": 1,
		"isInt": true
	})

	_config.set_value("Array", "testStringArray", {
		"name": "Test Array",
		"tooltip": "A test array",
		"arrayType": "String",
		"default": ["Hello World!"],
		"value": ["Hello World!"],
		"defaultItemValue": "",
		"maxItems": 5
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

[Up Next: MCM Not Installed Warning >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Extra-MCM-Not-Installed-Warning)
