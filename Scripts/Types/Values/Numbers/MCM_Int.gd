extends MCM_Number
class_name MCM_Int
## Allows the player to input an integar value in MCM

func _init(id: String, name: String, tooltip: String, default: int) -> void:
    super(
        "Int",
        id, name, tooltip,  default
    )

## Set the minimum value this value can be set to
func setMinRange(minRange: int) -> MCM_Int:
    return super(minRange)

## Set the maximum value this value can be set to
func setMaxRange(maxRange: int) -> MCM_Int:
    return super(maxRange)

## Set how much the UI SpinBox/Slider increments/decrements the value
func setStep(step: int) -> MCM_Int:
    return super(step)
