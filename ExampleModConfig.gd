extends Node

var McmHelpers = load("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var MCMNotInstalledUI = preload("res://ModConfigurationMenu/UI/mcm_not_installed.tscn")

const FILE_PATH = "user://MCM/ExampleMod"
const MOD_ID = "ExampleMod"

func _ready():
    var _config = ConfigFile.new()
    _config.set_value("Int", "testInt", {
        "name" = "Test Int",
        "tooltip" = "A test int",
        "default" = 5,
        "value" = 5,
        "minRange" = 0,
        "maxRange" = 20,
        "on_value_changed" = "IntCallback",
        "category" = "Test Category 1",
        "menu_pos" = 1
    })
    
    _config.set_value("Bool", "testBool1", {
        "name" = "Test Bool 1",
        "tooltip" = "The first test bool",
        "default" = false,
        "value" = false,
        "category" = "Test Category 1"
    })
    
    _config.set_value("Bool", "testBool2", {
        "name" = "Test Bool 2",
        "tooltip" = "The second test bool",
        "default" = true,
        "value" = true,
        "category" = "Test Category 1",
        "menu_pos" = 2
    })
    
    _config.set_value("Float", "testFloat", {
        "name" = "Test Float",
        "tooltip" = "A test float",
        "default" = 10.3,
        "value" = 10.3,
        "minRange" = 0,
        "maxRange" = 50.5,
        "step" = 0.1,
        "category" = "Test Category 1"
    })
    
    _config.set_value("Keycode", "testKeycode", {
        "name" = "Test Keycode",
        "tooltip" = "A test keycode",
        "default" = KEY_ALT,
        "default_type" = "Key",
        "value" = KEY_ALT,
        "type" = "Key",
        "category" = "Test Category 2"
    })
    
    _config.set_value("String", "testString", {
        "name" = "Test String",
        "tooltip" = "A test string",
        "default" = "Hello World",
        "value" = "Hello World",
        "category" = "Test Category 2",
        "menu_pos" = 1
    })
    
    _config.set_value("Color", "testColor", {
        "name" = "Test Color",
        "tooltip" = "A test color",
        "default" = Color.WHITE,
        "value" = Color.WHITE,
        "category" = "Test Category 3"
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
        ],
        "category" = "Test Category 3"
    })
    
    _config.set_value("Category", "Test Category 2", {
        "menu_pos" = 1
    })
        
    if McmHelpers:
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
            UpdateConfigProperties,
            self
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

func UpdateConfigProperties(config: ConfigFile):
    print(config.get_value("String", "testString"))
    
func IntCallback(valueId, newValue, menu):
    print("Int Update: " + str(valueId) + ", " + str(newValue) + ", " + str(menu))
    
func _input(_event):
    if (InputMap.has_action("testKeycode") && Input.is_action_pressed("testKeycode")):
        print("Test Keycode Pressed")
