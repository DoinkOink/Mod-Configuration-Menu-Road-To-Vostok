extends MCM_Vector
class_name MCM_Vector3
## Allows the player to input a Vector3 in MCM

func _init(id: String, name: String, tooltip: String, default: Vector3) -> void:
    super(
        "Vector3",
        id, name, tooltip,  default
    )
    
## Set the minimum value this value can be set to
func setMinRange(minRange: Vector3) -> MCM_Vector3:
    return super(minRange)

## Set the maximum value this value can be set to
func setMaxRange(maxRange: Vector3) -> MCM_Vector3:
    return super(maxRange)

## Set how much the UI SpinBox/Slider increments/decrements the value and how many
## decimal places the value can have if it accepts floating point values.
func setStep(step: float) -> MCM_Vector3:
    return super(step)
