class_name MCM_Type
## MCMs base type to control config creation
##
## The base type that all MCM values inherit and sets up properties that all
## values will use.

# Required Properties
## Defines the type of value this config setting will be. This tells MCM what
## kind of UI to use in the ingame menu.
var Section: String = "Value"
## The unique ID for this value
var ID: String
## The friendly name of the value that will be displayed in the configuration menu.
var Name: String

# Optional Properties
## Overrides the default alhpabetical sorting and places it in the given
## position in relation to other values with a menu_pos property.
var MenuPos: int

func _init(section: String, id: String, name: String) -> void:
    Section = section
    ID = id
    Name = name

## Set the position to be displayed within the MCM Menu. Lower number means it 
## shows up earlier on the menu. For Categories it sets the position in relation 
## to the other headers that are present.
func setMenuPos(menuPos: int):
    MenuPos = menuPos
    return self
