class_name MCM_Value
extends MCM_Type
## An editable value within MCM
##
## DO NOT USE THIS CLASS

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
func setCategory(category: String):
    Category = category
    return self
    
## Set the callback function to be called when the value is changed
func setOnValueChanged(onValueChanged: String):
    OnValueChanged = onValueChanged
    return self
    
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
