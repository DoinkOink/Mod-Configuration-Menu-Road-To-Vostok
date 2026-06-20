extends MCM_Vector
class_name MCM_Vector2
## Allows the player to input a Vector2 in MCM
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateVector2Value()[/code] instead.

func _init(id: String, name: String, tooltip: String, default: Vector2) -> void:
    super(
        "Vector2",
        id, name, tooltip,  default
    )
    
## Set the minimum value this value can be set to
func setMinRange(minRange: Vector2) -> MCM_Vector2:
    return super(minRange)

## Set the maximum value this value can be set to
func setMaxRange(maxRange: Vector2) -> MCM_Vector2:
    return super(maxRange)

## Set how much the UI SpinBox/Slider increments/decrements the value and how many
## decimal places the value can have if it accepts floating point values.
func setStep(step: float) -> MCM_Vector2:
    return super(step)
