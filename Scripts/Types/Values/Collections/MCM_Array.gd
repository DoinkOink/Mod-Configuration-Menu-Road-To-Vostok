extends MCM_Collection
class_name MCM_Array
## Allows the player to set an array of values in MCM
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateArrayValue()[/code] instead.

func _init(id: String, name: String, tooltip: String, default: Array,
            valueType: MCM_Config.MCM_Collection_Types, defaultItemValue
) -> void:
    super(
        "Array",
        id, name, tooltip, default,
        valueType, defaultItemValue
    )
