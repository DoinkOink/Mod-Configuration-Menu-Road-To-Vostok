extends MCM_Number
class_name MCM_Vector
## The base type for all Vector input types for MCM
##
## DO NOT USE THIS CLASS[br]Use either [MCM_Vector2] or [MCM_Vector3] instead

# Optional Properties
## This sets if the SpinBox inputs will allow float values to be entered.
var IsInt: bool = false

func _init(section: String, id: String, name: String, tooltip: String, default) -> void:
    super(section, id, name, tooltip,  default)

## Set if the vector allows float values or not.
func setIsInt(isInt: bool):
    IsInt = isInt
    return self
    
func createConfigObject() -> Dictionary:
    var _superObject = super()
    _superObject["isInt"] = IsInt
    
    return _superObject
