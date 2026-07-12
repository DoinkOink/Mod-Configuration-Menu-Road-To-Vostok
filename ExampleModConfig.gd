extends Node

var McmHelpers = load("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var MCMNotInstalledUI = preload("res://ModConfigurationMenu/UI/mcm_not_installed.tscn")

const MOD_ID = "ExampleMod"
const FRIENDLY_NAME = "Example Mod"
const DESCRIPTION = "A short description of the mod"

func _ready():
    if McmHelpers:
        var _mcmConfig = MCM_Config.new(
            MOD_ID,                     # The mods unique ID
            FRIENDLY_NAME,              # The mods name that will be displayed within the MCM
            DESCRIPTION,                # A short description of the mod
            UpdateConfigProperties,     # The callback function that will handle all value updates for your mod
            self                        # The object to call for individual value `on_value_changed` callbacks
        )
        
        _mcmConfig.CreateIntValue("testInt", "Test Int", "A test int", 5) \
            .setMinRange(0) \
            .setMaxRange(20) \
            .setOnValueChanged("IntCallback") \
            .setCategory("Test Category 1") \
            .setMenuPos(1)
            
        _mcmConfig.CreateBoolValue("testBool1", "Test Bool 1", "The first test bool", false) \
            .setCategory("Test Category 1")
            
        _mcmConfig.CreateBoolValue("testBool2", "Test Bool 2", "The second test bool", true) \
            .setCategory("Test Category 1") \
            .setMenuPos(2)
            
        _mcmConfig.CreateFloatValue("testFloat", "Test Float", "A test float", 10.3) \
            .setMinRange(0) \
            .setMaxRange(50.5) \
            .setStep(0.000001) \
            .setCategory("Test Category 1")
            
        _mcmConfig.CreateKeycodeValue(
                "testKeycode",
                "Test Keycode",
                "A test keycode",
                KEY_ALT, 
                MCM_Config.MCM_Key_Types.KEY
            ) \
            .addShiftModifier() \
            .setCategory("Test Category 2")
            
        _mcmConfig.CreateStringValue("testString", "Test String", "A test string", "Hello World") \
            .setCategory("Test Category 2") \
            .setMenuPos(1)
            
        _mcmConfig.CreateColorValue("testColor", "Test Color", "A test color", Color.WHITE) \
            .setCategory("Test Category 3")
            
        _mcmConfig.CreateDropdownValue(
                "testDropdown",
                "Test Dropdown",
                "A test dropdown",
                "opt_1",
                {
                    "opt_1": "Option 1",
                    "opt_2": "Option 2",
                    "opt_3": "Option 3"
                }
            ).setCategory("Test Category 3")
            
        _mcmConfig.CreateVector2Value("testVector2", "Test Vector2", "A test vector2", Vector2(10, 10)) \
            .setMinRange(Vector2(0, 5)) \
            .setMaxRange(Vector2(50, 40)) \
            .setStep(0.5) \
            .setIsInt(false)
            
        _mcmConfig.CreateVector3Value("testVector3", "Test Vector3", "a test vector3", Vector3(10, 10, 10)) \
            .setMinRange(Vector3(0, 4, -10)) \
            .setMaxRange(Vector3(50, 40, 20)) \
            .setStep(1) \
            .setIsInt(true) \
            .setCategory("Test Category 4")
            
        _mcmConfig.CreateArrayValue(
                "testVector3Array",
                "Test Array",
                "A test array",
                [],
                MCM_Config.MCM_Collection_Types.VECTOR3,
                Vector3.FORWARD
            ).setExpanded(true) \
            .setMinRange(Vector3.ZERO) \
            .setMaxRange(Vector3(40, 50, 10)) \
            .setMaxItems(5) \
            .setCategory("Test Category 4")
            
        _mcmConfig.CreateDictionaryValue(
                "testStringDictionary",
                "Test Dictionary",
                "A test dictionary",
                { "Test Key": "Test Value" },
                MCM_Config.MCM_Collection_Types.STRING,
                { "Key": "Value" }
            ).setMaxItems(5)
            
        _mcmConfig.CreateCategoryHeader("Test Category 2", "Test Category 2") \
            .setMenuPos(1)
        
        _mcmConfig.RegisterMod()
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
