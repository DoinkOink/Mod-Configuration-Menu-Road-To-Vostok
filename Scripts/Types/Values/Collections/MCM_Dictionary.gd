extends MCM_Collection
class_name MCM_Dictionary
## Allows the player to set a dictionary of keys and values in MCM
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateDictionaryValue()[/code] instead.

# Optional Properties
## The label text for the key column
var KeyLabel: String
## The label text for the value column
var ValueLabel: String
## Sets if the player can edit the keys in the dictionary value editor
var CanEditKeys: bool = true

func _init(id: String, name: String, tooltip: String, default: Dictionary,
            valueType: MCM_Config.MCM_Collection_Types, defaultItemValue
) -> void:
    super(
        "Dictionary",
        id, name, tooltip, default,
        valueType, defaultItemValue
    )

## Sets the label text for the key column
func setKeyLabel(keyLabel: String) -> MCM_Dictionary:
    KeyLabel = keyLabel
    return self
    
## Sets the label text for the value column
func setValueLabel(valueLabel: String) -> MCM_Dictionary:
    ValueLabel = valueLabel
    return self
 
## Sets if the player can edit the keys in the dictionary value editor
func setCanEditKeys(canEditKeys: bool) -> MCM_Dictionary:
    CanEditKeys = canEditKeys
    return self
 
## Internal Use Only. Do [b]not[/b] call this method directly.[br]
## Use [code]MCM_Config.RegisterMod()[/code] instead.     
func createConfigObject() -> Dictionary:
    var _superObject = super()
    
    _superObject["canEditKeys"] = CanEditKeys
    if (KeyLabel != ""): _superObject["keyLabel"] = KeyLabel
    if (ValueLabel != ""): _superObject["valueLabel"] = ValueLabel
    
    return _superObject
