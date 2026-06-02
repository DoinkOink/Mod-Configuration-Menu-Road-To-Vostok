extends MCM_Value
class_name MCM_Bool
## Gives the player a on/off toggle to set a boolean value in MCM

func _init(id: String, name: String, tooltip: String, default: bool) -> void:
    super(
        "Bool",
        id, name, tooltip, default
    )
