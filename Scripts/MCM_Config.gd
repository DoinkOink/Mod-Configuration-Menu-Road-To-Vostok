class_name MCM_Config
## A helper class to create the MCM Config file to be registered with MCM
##
## This class creates a config file to be used with MCM while also providing
## methods to easily create all available MCM value types.

var FilePath: String = "user://MCM//"
var ModID: String

var CreatedValues: Dictionary = {}

func _init(modId: String):
    ModID = modId
    

func CreateConfigFile() -> ConfigFile:
    var _configFile = ConfigFile.new()
    
    for _value: MCM_Type in CreatedValues.values():
        _value.addToConfig(_configFile)
    
    return _configFile


func CreateStringValue(id: String, name: String, tooltip: String, default: String) -> MCM_String:
    if(id in CreatedValues.keys()):
        return null
        
    var _tempString = MCM_String.new(id, name, tooltip, default)
    CreatedValues[id] = _tempString
    
    return _tempString
    
func CreateIntValue(id: String, name: String, tooltip: String, default: int) -> MCM_Int:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempInt = MCM_Int.new(id, name, tooltip, default)
    CreatedValues[id] = _tempInt
    
    return _tempInt
    
func CreateFloatValue(id: String, name: String, tooltip: String, default: float) -> MCM_Float:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempFloat = MCM_Float.new(id, name, tooltip, default)
    CreatedValues[id] = _tempFloat
    
    return _tempFloat
    
func CreateBoolValue(id: String, name: String, tooltip: String, default: bool) -> MCM_Bool:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempBool = MCM_Bool.new(id, name, tooltip, default)
    CreatedValues[id] = _tempBool
    
    return _tempBool

func CreateKeycodeValue(id: String, name: String, tooltip: String, default: Key, defaultType: MCM_Helpers.MCM_Key_Types) -> MCM_Keycode:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempKeycode = MCM_Keycode.new(id, name, tooltip, default, defaultType)
    CreatedValues[id] = _tempKeycode
    
    return _tempKeycode
    
func CreateColorValue(id: String, name: String, tooltip: String, default: Color) -> MCM_Color:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempColor = MCM_Color.new(id, name, tooltip, default)
    CreatedValues[id] = _tempColor
    
    return _tempColor
    
func CreateDropdownValue(id: String, name: String, tooltip: String, default: String, options: Dictionary) -> MCM_Dropdown:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempDropdown = MCM_Dropdown.new(id, name, tooltip, default, options)
    CreatedValues[id] = _tempDropdown
    
    return _tempDropdown
    
func CreateVector2Value(id: String, name: String, tooltip: String, default: Vector2) -> MCM_Vector2:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempVector2 = MCM_Vector2.new(id, name, tooltip, default)
    CreatedValues[id] = _tempVector2
    
    return _tempVector2
    
func CreateVector3Value(id: String, name: String, tooltip: String, default: Vector3) -> MCM_Vector3:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempVector3 = MCM_Vector3.new(id, name, tooltip, default)
    CreatedValues[id] = _tempVector3
    
    return _tempVector3
    
func CreateArrayValue(id: String, name: String, tooltip: String, default: Array, valueType: MCM_Helpers.MCM_Collection_Types, defaultItemValue) -> MCM_Array:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempArray = MCM_Array.new(id, name, tooltip, default, valueType, defaultItemValue)
    CreatedValues[id] = _tempArray
    
    return _tempArray
    
func CreateDictionaryValue(id: String, name: String, tooltip: String, default: Dictionary, valueType: MCM_Helpers.MCM_Collection_Types, defaultItemValue: Dictionary) -> MCM_Dictionary:
    if(id in CreatedValues.keys()):
        print("[MCM] The value ID (" + id + ") has already been used. Value has not been created.")
        return null
        
    var _tempDictionary = MCM_Dictionary.new(id, name, tooltip, default, valueType, defaultItemValue)
    CreatedValues[id] = _tempDictionary
    
    return _tempDictionary
