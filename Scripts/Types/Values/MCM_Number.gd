extends MCM_Value
class_name MCM_Number
## The base type for all editable values that store numbers
##
## DO NOT USE THIS CLASS[br]Use either [MCM_Float], [MCM_Int], [MCM_Vector2],
## [MCM_Vector3] instead

# Optional Properties
## The minimum value the player is able to set the value to in the configuration menu.
var MinRange = null
## The maximum value the player is able to set the value to in the configuration menu.
var MaxRange = null
## How much is added per step in both the Slider and SpinBox input. Also controls
## how many decimal places are allowed if it accepts floating point numbers
var Step = null

func _init(section: String, id: String, name: String, tooltip: String, default) -> void:
    super(section, id, name, tooltip,  default)

## Set the minimum value this value can be set to
func setMinRange(minRange) -> MCM_Number:
    MinRange = minRange
    return self

## Set the maximum value this value can be set to
func setMaxRange(maxRange) -> MCM_Number:
    MaxRange = maxRange
    return self
   
## Set how much the UI SpinBox/Slider increments/decrements the value.
func setStep(step) -> MCM_Number:
    Step = step
    return self
    
func createConfigObject() -> Dictionary:
    var _superObject = super()
    
    if(MinRange != null): _superObject["minRange"] = MinRange
    if(MaxRange != null): _superObject["maxRange"] = MaxRange
    if(Step != null): _superObject["step"] = Step
    
    return _superObject
