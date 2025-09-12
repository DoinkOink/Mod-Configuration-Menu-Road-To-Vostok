extends Node

var McmHelpers = load("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var MCMNotInstalledUI = preload("res://FreeLook/UI/mcm_not_installed.tscn")

var config = ConfigFile.new()

const FILE_PATH = "user://MCM/ExampleMod"
const MOD_ID = "ExampleMod"

func _ready():
	if !FileAccess.file_exists(FILE_PATH + "/config.ini"):
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
		
		DirAccess.open("user://").make_dir(FILE_PATH)
		config.save(FILE_PATH + "/config.ini")
	else:
		config.load(FILE_PATH + "/config.ini")
		
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

func UpdateConfigProperties(_config: ConfigFile):
	print(_config.get_value("String", "testString"))
