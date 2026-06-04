extends MCM_Value
class_name MCM_Color
## Displays a color picker for the player to set a color in MCM

func _init(id: String, name: String, tooltip: String, default: Color) -> void:
    super(
        "Color",
        id, name, tooltip, default
    )
