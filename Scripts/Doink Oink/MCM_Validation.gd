# Value is intentionally left out of both the required and optional objects.
#   If it wasn't the player set value would be overwritten whenever the game
#   loads.

const REQUIRED_PROPERTIES : Dictionary = {
    "Generic": [ "name", "tooltip", "default" ],
    "Keycode": [ "default_type", "type" ],
    "Dropdown": [ "options" ],
    "Object": [ "valueType", "defaultItemValue" ]
}

const OPTIONAL_PROPERTIES : Dictionary = {
    "Generic": [ "category", "menu_pos" ],
    "Number": [ "minRange", "maxRange", "step" ],
    "Vector": [ "isInt" ],
    "Object": [ "maxItems" ]
}

const NUMBER_TYPES : Array = [ "Int", "Float", "Vector2", "Vector3" ]
const VECTOR_TYPES : Array = [ "Vector2", "Vector3" ]
const OBJECT_TYPES : Array = [ "Array", "Dictionary" ]

static func GetRequiredProperties(valueType: String):
    var _tempArray = []
    
    if(valueType != "Category"):
        _tempArray.append_array(REQUIRED_PROPERTIES["Generic"])
    
    if(OBJECT_TYPES.has(valueType)):
        _tempArray.append_array(REQUIRED_PROPERTIES["Object"])
    
    if(REQUIRED_PROPERTIES.has(valueType)):
        _tempArray.append_array(REQUIRED_PROPERTIES[valueType])

    return _tempArray
    
static func GetOptionalProperties(valueType: String):
    var _tempArray = []
    _tempArray.append_array(OPTIONAL_PROPERTIES["Generic"])
    
    if(NUMBER_TYPES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES["Number"])
        
    if(VECTOR_TYPES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES["Vector"])
        
    if(OBJECT_TYPES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES["Object"])
    
    if(OPTIONAL_PROPERTIES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES[valueType])

    return _tempArray
