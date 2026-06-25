extends MCM_Value
class_name MCM_Bool
## Gives the player an on/off toggle to set a boolean value in MCM
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateBoolValue()[/code] instead.

func _init(id: String, name: String, tooltip: String, default: bool) -> void:
    super(
        "Bool",
        id, name, tooltip, default
    )
