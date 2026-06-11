extends MCM_Collection
class_name MCM_Dictionary
## Allows the player to set a dictionary of keys and values in MCM

func _init(id: String, name: String, tooltip: String, default: Dictionary,
            valueType: MCM_Helpers.MCM_Collection_Types, defaultItemValue
) -> void:
    super(
        "Dictionary",
        id, name, tooltip, default,
        valueType, defaultItemValue
    )
