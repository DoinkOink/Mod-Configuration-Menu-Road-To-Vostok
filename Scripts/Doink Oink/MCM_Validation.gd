const REQUIRED_PROPERTIES : Dictionary = {
    "Generic": [ "name", "tooltip", "default" ],
    "Keycode": [ "default_type", "type" ],
    "Dropdown": [ "options" ],
    "Array": [ "arrayType", "defaultItemValue" ]
}

const OPTIONAL_PROPERTIES : Dictionary = {
    "Generic": [ "category", "menu_pos" ],
    "Number": [ "minRange", "maxRange", "step" ],
    "Vector": [ "isInt" ],
    "Array": [ "maxItems" ]
}

const NUMBER_TYPES : Array = [ "Int", "Float", "Vector2", "Vector3" ]
const VECTOR_TYPES : Array = [ "Vector2", "Vector3" ]

static func GetRequiredProperties(valueType: String):
    var _tempArray = []
    _tempArray.append_array(REQUIRED_PROPERTIES["Generic"])
    
    if(REQUIRED_PROPERTIES.has(valueType)):
        _tempArray.append_array(REQUIRED_PROPERTIES[valueType])

    return _tempArray
    
static func GetOptionalProperties(valueType: String):
    var _tempArray = []
    _tempArray.append_array(OPTIONAL_PROPERTIES["Generic"])
    
    if (NUMBER_TYPES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES["Number"])
        
    if (VECTOR_TYPES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES["Vector"])
    
    if(OPTIONAL_PROPERTIES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES[valueType])

    return _tempArray
