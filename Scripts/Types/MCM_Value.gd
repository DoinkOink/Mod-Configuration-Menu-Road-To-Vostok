class_name MCM_Value
extends MCM_Type
## An editable value within MCM
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use any of the [code]MCM_Config.Create[/code] methods instead.

# Required Properties
## A short description of the value that will be displayed when hovering over
## the name in the configuration menu.
var Tooltip: String
## The default value that the player can revert back to in the configuration
## menu.
var Default

# Optional Properties
## The categories name/id to place the value in.
var Category: String
## The callback function to call when this value is changed by the player in MCM
var OnValueChanged: String

func _init(section: String, id: String, name: String, tooltip: String, default) -> void:
    Tooltip = tooltip
    Default = default
    
    super(section, id, name)

## Set what category the value belongs to.
func setCategory(category: String) -> MCM_Type:
    Category = category
    return self
    
## Set the callback function to be called when the value is changed
func setOnValueChanged(onValueChanged: String) -> MCM_Type:
    OnValueChanged = onValueChanged
    return self

## Internal Use Only. Do [b]not[/b] call this method directly.[br]
## Use [code]MCM_Config.RegisterMod()[/code] instead.
func createConfigObject() -> Dictionary:
    var _superObject = super()
    _superObject.merge({
        "tooltip": Tooltip,
        "default": Default,
        "value": Default
    })
    
    if(Category != ""): _superObject["category"] = Category
    if(OnValueChanged != ""): _superObject["on_value_changed"] = OnValueChanged
    
    return _superObject
