extends MCM_Value
class_name MCM_String
## Allows text input by the player within MCM
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateStringValue()[/code] instead.

func _init(id: String, name: String, tooltip: String, default: String) -> void:
    super(
        "String",
        id, name, tooltip, default
    )
