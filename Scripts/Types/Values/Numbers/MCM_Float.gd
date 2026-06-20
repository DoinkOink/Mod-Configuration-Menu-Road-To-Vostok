extends MCM_Number
class_name MCM_Float
## Allows the player to input a float value in MCM
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateFloatValue()[/code] instead.

func _init(id: String, name: String, tooltip: String, default: float) -> void:
    super(
        "Float", 
        id, name, tooltip,  default
    )

## Set the minimum value this value can be set to
func setMinRange(minRange: float) -> MCM_Float:
    return super(minRange)

## Set the maximum value this value can be set to
func setMaxRange(maxRange: float) -> MCM_Float:
    return super(maxRange)

## Set how much the UI SpinBox/Slider increments/decrements the value and how many
## decimal places the value can have if it accepts floating point values.
func setStep(step: float) -> MCM_Float:
    return super(step)
