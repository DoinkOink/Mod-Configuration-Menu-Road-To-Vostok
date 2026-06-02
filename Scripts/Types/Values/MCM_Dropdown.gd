extends MCM_Value
class_name MCM_Dropdown
## Allows the player to select a list of options from a dropdown.

# Required Parameters
## A Dictionary that holds the config "value" as the key and the label that's
## displayed in MCM as the dictionary value.
var Options: Dictionary

func _init(id: String, name: String, tooltip: String, default: String,
            options: Dictionary
) -> void:
    Options = options
    
    super(
        "Dropdown",
        id, name, tooltip, default
    )
    
func createConfigObject() -> Dictionary:
    var _superObject = super()
    _superObject.merge({
        "options": Options
    })
    
    return _superObject
