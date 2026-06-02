class_name MCM_Value
extends MCM_Type
## An editable value within MCM

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

func _init(section: String, id: String, name: String, tooltip: String, default) -> void:
    Tooltip = tooltip
    Default = default
    
    super(section, id, name)

## Set what category the value belongs to.
func setCategory(category: String):
    Category = category
    return self
