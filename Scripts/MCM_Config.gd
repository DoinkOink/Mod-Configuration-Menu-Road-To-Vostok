class_name MCM_Config
## A helper class to create the MCM Config file to be registered with MCM
##
## This class creates a config file to be used with MCM while also providing
## methods to easily create all available MCM value types and to register your
## mod with MCM.

#region Enums
## The allowed MCM value types that can be used for a collection
enum MCM_Collection_Types {
    ## [MCM_String]
    STRING,
    ## [MCM_Int]
    INT,
    ## [MCM_Float]
    FLOAT,
    ## [MCM_Bool]
    BOOLEAN,
    ## [MCM_Color]
    COLOR,
    ## [MCM_Vector2]
    VECTOR2,
    ## [MCM_Vector3]
    VECTOR3
}

## The type of input the default value can be set as
enum MCM_Key_Types {
    ## A keyboard key
    KEY,
    ## A mouse button
    MOUSE
}

## The modifier keys that can be set to be pressed alongside the assigned
## keycode.
enum MCM_Modifiers {
    ## The alt key
    ALT,
    ## The control key
    CONTROL,
    ## The Meta/Windows key
    META,
    ## The shift key
    SHIFT
}
#endregion

var McmHelpers: MCM_Helpers = load("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

## The path to the mods config file folder. This will be updated in the
## constructor to include the [ModID](#modid) as well.
var FilePath: String = "user://MCM//"
## The mods unique ID. If another mod uses the same ID MCM will not register
## the mods that load after it.
var ModID: String
## The name that gets displayed in MCM for users to easily identify.
var FriendlyName: String
## A short description of your mod that gets displayed when hovering over the 
## mods MCM button.
var Description: String
## The method that gets called when a configuration file is edited and saved
## within MCM.
var FileOnSaveCallback
## The object that holds all of the methods that are passed as the 
## `on_value_changed` property in values.
var CallbackObject: Object
## All of the currently created values that will be later saved to the config 
## file.
var CreatedValues: Dictionary = {}

## Creates the MCM_Config object[br][br]
## [u]Params:[/u][br]
## [br][param modId] [String]: The mods unique ID. Warning: If another mod has this same 
## ID an error will be given and your mod will not be registered
## [br][param modFriendlyName] [String]: The name that will be displayed within the MCM
## [br][param modDescription] [String]: A short description of the mod
## [br][param fileOnSaveCallback]: The callback function that will handle value updates 
## for your mod
## [br][param callbackObject] [Object]: The object to call for individual value 
## `on_value_changed` callbacks
func _init(modId: String, modFriendlyName: String, modDescription: String, fileOnSaveCallback, callbackObject: Object = null):
    ModID = modId
    FilePath += ModID
    FriendlyName = modFriendlyName
    Description = modDescription
    FileOnSaveCallback = fileOnSaveCallback
    CallbackObject = callbackObject
    
## Checks to see if the config file has already been created. Creates the file
## if it hasnt or checks if it has been updated if it was already created. Then 
## registers your mods config with MCM
func RegisterMod() -> void:
    var _config: ConfigFile = CreateConfigFile()
    
    # First we need to check if the default config file exists.
    #   If it doesn't create and save the file.
    if !FileAccess.file_exists(FilePath + "/" + McmHelpers.DefaultConfigFileName + ".ini"):
        DirAccess.open("user://").make_dir(FilePath)
        _config.save(FilePath + "/" + McmHelpers.DefaultConfigFileName + ".ini")
        
    # Then we need to check if the current profile's config file exists.
    #   If the current profile is default then we're essentially doing the same
    #   check as before but there isn't an issue with that.
    if !FileAccess.file_exists(FilePath + "/" + McmHelpers.CurrentModLoaderProfile + ".ini"):
        DirAccess.open("user://").make_dir(FilePath)
        _config.save(FilePath + "/" + McmHelpers.CurrentModLoaderProfile + ".ini")
    else:
        McmHelpers.CheckConfigurationHasUpdated(ModID, _config, FilePath + "/" + McmHelpers.CurrentModLoaderProfile + ".ini")
        _config.load(FilePath + "/" + McmHelpers.CurrentModLoaderProfile + ".ini")
            
    McmHelpers.RegisterConfiguration(
        ModID,
        FriendlyName,
        FilePath,
        Description,
        FileOnSaveCallback,
        CallbackObject
    )

## Generates the config file with all the values that were previously created
## [br][br][b][color=red]WARNING[/color][/b]: It's recommended to use [RegisterMod] instead as it handles 
## calling this and other needed functions for registering your mod.
func CreateConfigFile() -> ConfigFile:
    var _configFile = ConfigFile.new()
    
    for _value: MCM_Type in CreatedValues.values():
        _value.addToConfig(_configFile)
    
    return _configFile

#region Value Creation Methods
## Creates and adds an [code]MCM_Category[/code] value to the config file.[br]
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateCategoryHeader(...) \
##     .setMenuPos(1)
## [/codeblock]
func CreateCategoryHeader(id: String, name: String) -> MCM_Category:
    if(id in CreatedValues.keys()):
        return null
        
    var _tempCategory = MCM_Category.new(id, name)
    CreatedValues[id] = _tempCategory
    
    return _tempCategory
    
## Creates and adds an [code]MCM_String[/code] value to the config file.[br]
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateStringValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]
func CreateStringValue(id: String, name: String, tooltip: String, default: String) -> MCM_String:
    if(id in CreatedValues.keys()):
        return null
        
    var _tempString = MCM_String.new(id, name, tooltip, default)
    CreatedValues[id] = _tempString
    
    return _tempString

## Creates and adds an [code]MCM_Int[/code] value to the config file.
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged, setMinRange, setMaxRange, setStep[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateIntValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]
func CreateIntValue(id: String, name: String, tooltip: String, default: int) -> MCM_Int:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempInt = MCM_Int.new(id, name, tooltip, default)
    CreatedValues[id] = _tempInt
    
    return _tempInt

## Creates and adds an [code]MCM_Float[/code] value to the config file.    
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged, setMinRange, setMaxRange, setStep[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateFloatValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]
func CreateFloatValue(id: String, name: String, tooltip: String, default: float) -> MCM_Float:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempFloat = MCM_Float.new(id, name, tooltip, default)
    CreatedValues[id] = _tempFloat
    
    return _tempFloat

## Creates and adds an [code]MCM_Bool[/code] value to the config file.    
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateBoolValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]
func CreateBoolValue(id: String, name: String, tooltip: String, default: bool) -> MCM_Bool:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempBool = MCM_Bool.new(id, name, tooltip, default)
    CreatedValues[id] = _tempBool
    
    return _tempBool

## Creates and adds an [code]MCM_Keycode[/code] value to the config file.
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged, setDefaultModifiers, addAltModifier, addControlModifier, addControlModifier, addMetaModifier, addShiftModifier[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateKeycodeValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]
func CreateKeycodeValue(id: String, name: String, tooltip: String, default: Key, defaultType: MCM_Key_Types) -> MCM_Keycode:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempKeycode = MCM_Keycode.new(id, name, tooltip, default, defaultType)
    CreatedValues[id] = _tempKeycode
    
    return _tempKeycode

## Creates and adds an [code]MCM_Color[/code] value to the config file.    
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateColorValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]
func CreateColorValue(id: String, name: String, tooltip: String, default: Color) -> MCM_Color:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempColor = MCM_Color.new(id, name, tooltip, default)
    CreatedValues[id] = _tempColor
    
    return _tempColor
   
## Creates and adds an [code]MCM_Dropdown[/code] value to the config file.    
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateDropdownValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]
func CreateDropdownValue(id: String, name: String, tooltip: String, default: String, options: Dictionary) -> MCM_Dropdown:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempDropdown = MCM_Dropdown.new(id, name, tooltip, default, options)
    CreatedValues[id] = _tempDropdown
    
    return _tempDropdown
 
## Creates and adds an [code]MCM_Vector2[/code] value to the config file.      
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged, setMinRange, setMaxRange, setStep[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateVector2Value(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock] 
func CreateVector2Value(id: String, name: String, tooltip: String, default: Vector2) -> MCM_Vector2:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempVector2 = MCM_Vector2.new(id, name, tooltip, default)
    CreatedValues[id] = _tempVector2
    
    return _tempVector2
   
## Creates and adds an [code]MCM_Vector3[/code] value to the config file.     
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged, setMinRange, setMaxRange, setStep[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateVector3Value(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock] 
func CreateVector3Value(id: String, name: String, tooltip: String, default: Vector3) -> MCM_Vector3:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempVector3 = MCM_Vector3.new(id, name, tooltip, default)
    CreatedValues[id] = _tempVector3
    
    return _tempVector3

## Creates and adds an [code]MCM_Array[/code] value to the config file.  
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged, setMaxItems, setExpanded, setCanDeleteAndAdd, setMinRange, setMaxRange, setStep[/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateArrayValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]       
func CreateArrayValue(id: String, name: String, tooltip: String, default: Array, valueType: MCM_Collection_Types, defaultItemValue) -> MCM_Array:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempArray = MCM_Array.new(id, name, tooltip, default, valueType, defaultItemValue)
    CreatedValues[id] = _tempArray
    
    return _tempArray

## Creates and adds an [code]MCM_Dictionary[/code] value to the config file.      
## [u]Available Chain Methods:[/u][br]
## [code]setMenuPos, setCategory, setOnValueChanged, setMaxItems, setExpanded, setCanDeleteAndAdd, setMinRange, setMaxRange, setStep, setKeyLabel, setValueLabel, setCanEditKeys, [/code][br][br]
## [u]Usage:[/u]
## [codeblock]
## _mcmConfig.CreateDictionaryValue(...) \
##     .setCategory("Category Name") \
##     .setOnValueChanged("callback_method_name")
## [/codeblock]      
func CreateDictionaryValue(id: String, name: String, tooltip: String, default: Dictionary, valueType: MCM_Collection_Types, defaultItemValue: Dictionary) -> MCM_Dictionary:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempDictionary = MCM_Dictionary.new(id, name, tooltip, default, valueType, defaultItemValue)
    CreatedValues[id] = _tempDictionary
    
    return _tempDictionary
#endregion
