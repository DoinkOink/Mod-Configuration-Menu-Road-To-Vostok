# Value is intentionally left out of both the required and optional objects.
#   If it wasn't the player set value would be overwritten whenever the game
#   loads.
const GROUPED_TYPES : Dictionary = {
    "Number" : [ "Int", "Float", "Vector2", "Vector3" ],
    "Vector" : [ "Vector2", "Vector3" ],
    "Object" : [ "Array", "Dictionary" ]
}

const REQUIRED_PROPERTIES : Dictionary = {
    "Generic": [ "name", "tooltip", "default" ],
    "Keycode": [ "default_type", "type" ],
    "Dropdown": [ "options" ],
    "Object": [ "valueType", "defaultItemValue" ]
}

const OPTIONAL_PROPERTIES : Dictionary = {
    "Generic": [ "category", "menu_pos", "on_value_changed" ],
    "Number": [ "minRange", "maxRange", "step" ],
    "Vector": [ "isInt" ],
    "Object": [ "maxItems" ],
    "Keycode": [ "default_modifiers" ]
}

static func GetRequiredProperties(valueType: String):
    var _tempArray = []
    
    # Get the generic requirements that all values share
    # The Category type is the only exception that doesn't use
    #   the generic required properties so skip adding those
    if(valueType != "Category"):
        _tempArray.append_array(REQUIRED_PROPERTIES["Generic"])
        
    # Check for any requirements for the passed value type
    if(REQUIRED_PROPERTIES.has(valueType)):
        _tempArray.append_array(REQUIRED_PROPERTIES[valueType])
        
    # Finally check for any grouped requirements
    for _group in GROUPED_TYPES.keys():
        if(REQUIRED_PROPERTIES.has(_group)):
            if(GROUPED_TYPES[_group].has(valueType)):
                _tempArray.append_array(REQUIRED_PROPERTIES[_group])

    return _tempArray
    
static func GetOptionalProperties(valueType: String):
    var _tempArray = []
    
    # Get the generic requirements that all values share
    _tempArray.append_array(OPTIONAL_PROPERTIES["Generic"])
    
    # Check for any requirements for the passed value type
    if(OPTIONAL_PROPERTIES.has(valueType)):
        _tempArray.append_array(OPTIONAL_PROPERTIES[valueType])
    
    # Finally check for any grouped requirements
    for _group in GROUPED_TYPES.keys():
        if(OPTIONAL_PROPERTIES.has(_group)):
            if(GROUPED_TYPES[_group].has(valueType)):
                _tempArray.append_array(OPTIONAL_PROPERTIES[_group])

    return _tempArray
