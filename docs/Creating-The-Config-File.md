In the `_ready()` function
1. Create variable and store the ConfigFile class in it: `var _config = ConfigFile.new()`
2. Start setting your config values within your config variable: `_config.set_value(...)`
    * There is a very specific way these values need to be stored. We will go over this shortly
2. Using `FileAccess` check to see if the config file exists: `if !FileAccess.file_exists(FILE_PATH + "/config.ini"):`
	* If it doesn't exist, using `DirAccess`, create the folder that the config files will be stored: `DirAccess.open("user://").make_dir(FILE_PATH)` and then save the config file to the system: `_config.save(FILE_PATH + "/config.ini")`
	* If it does exist, load the configuration file

`ExampleModConfig.gd`
```gdscript
extends Node

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
		"maxRange" = 20
	})

	_config.set_value("Float", "testFloat", {
		"name" = "Test Float",
		"tooltip" = "A test float",
		"default" = 10.3,
		"value" = 10.3,
		"minRange" = 0,
		"maxRange" = 50.5
	})
	
	_config.set_value("Bool", "testBool", {
		"name" = "Test Bool",
		"tooltip" = "A test bool",
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
		_config.load(FILE_PATH + "/config.ini")

```

# The available config values
MCM Supports 5 different types of values 
* [String](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/String-Value-Type)
* [Int](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Integer-Value-Type)
* [Float](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Float-Value-Type)
* [Bool](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Boolean-Value-Type)
* [Keycode](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Keycode-Value-Type)
* [Color](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Color-Picker-Value-Type)
* [Dropdown](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Dropdown-Value-Type)

**Array's of these types are not currently supported.**

Instead of just storing a value in a normal variable we create a Dictionary for every value. This allows MCM to store control variables that is used in the GUI aspect of the mod and allows the author to set default values to be reset if the player wishes.

The way MCM determines what type a value is is based on the **Section** that is passed in `_config.set_value` [Take a look at the documentation to see what sections are](https://docs.godotengine.org/en/4.4/classes/class_configfile.html#class-configfile-method-set-value)

Because of this it is **VERY** important that the sections are written exactly as I have them in the examples (Capital letters and all). If they aren't then they will not be displayed in the MCM menu.
* String
* Int
* Float
* Bool
* Keycode
* Color
* Dropdown

Let's go over the different types and how they should be set up.

[Up next: String Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/String-Value-Type)