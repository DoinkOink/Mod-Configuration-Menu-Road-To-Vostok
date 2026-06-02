extends MCM_Value
class_name MCM_String
## Allows text input by the player within MCM

func _init(section: String, id: String, name: String, tooltip: String, default: String) -> void:
    super(
        "String",
        id,
        name,
        tooltip,
        default
    )
