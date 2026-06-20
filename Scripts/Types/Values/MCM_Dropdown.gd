extends MCM_Value
class_name MCM_Dropdown
## Allows the player to select a list of options from a dropdown.
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateDropdownValue()[/code] instead.

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

## Internal Use Only. Do [b]not[/b] call this method directly.[br]
## Use [code]MCM_Config.RegisterMod()[/code] instead.    
func createConfigObject() -> Dictionary:
    var _superObject = super()
    _superObject.merge({
        "options": Options
    })
    
    return _superObject
