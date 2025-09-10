extends Node

var McmHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

var config = ConfigFile.new()

const FILE_PATH = "user://MCM/ExampleMod/config.ini"
const MOD_ID = "ExampleMod"

func _ready():
	if !FileAccess.file_exists(FILE_PATH):
		config.set_value("Int", "testInt", {
			"name" = "Test Int",
			"tooltip" = "A test int",
			"default" = 5,
			"value" = 5,
			"minRange" = 0,
			"maxRange" = 20
		})
		
		config.set_value("Bool", "testBool1", {
			"name" = "Test Bool 1",
			"tooltip" = "The first test bool",
			"default" = false,
			"value" = false
		})
		
		config.set_value("Bool", "testBool2", {
			"name" = "Test Bool 2",
			"tooltip" = "The first test bool",
			"default" = true,
			"value" = true
		})
		
		config.set_value("Float", "testFloat", {
			"name" = "Test Float",
			"tooltip" = "A test float",
			"default" = 10.3,
			"value" = 10.3,
			"minRange" = 0,
			"maxRange" = 50.5
		})
		
		config.set_value("Keycode", "testKeycode", {
			"name" = "Test Keycode",
			"tooltip" = "A test keycode",
			"default" = KEY_ALT,
			"value" = KEY_ALT
		})
		
		config.set_value("String", "testString", {
			"name" = "Test String",
			"tooltip" = "A test string",
			"default" = "Hello World",
			"value" = "Hello World"
		})
		
		DirAccess.open("user://").make_dir("user://MCM/ExampleMod")
		config.save(FILE_PATH)
	else:
		config.load(FILE_PATH)
		
	McmHelpers.RegisterConfiguration(
		MOD_ID,
		"Example Mod",
		"A short description of the mod",
		{
			"config.ini" = UpdateConfigProperties
		}
	)

func UpdateConfigProperties(_config: ConfigFile):
	print(_config.get_value("String", "testString"))
	
func _input(event):
	if Input.is_action_just_pressed("testKeycode"):
		print("Test Keycode Pressed!")
