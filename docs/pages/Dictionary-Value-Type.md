<!-- <img width="628" height="50" alt="" src="" /> -->

```gdscript
_config.set_value("Dictionary", "testStringDictionary", {
    "name": "Test Dictionary",
    "tooltip": "A test dictionary",
    "valueType": "String",
    "default": { "Test Key": "Test Value" },
    "defaultItemValue": { "Key": "Value" },
    "maxItems": 5
})
```

## Properties
### Section Name: `Dictionary`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Dictionary` | The default value **and** key that get set when the player creates a new item.<br>Note: The default key will auto incriment incase there's another simliarly named key. |
| `valueType` | `String` | This sets the type of inputs to be displayed to the player when adding items to the array. See below in Additional Information for the available array types. |
| `defaultItemValue` | Based on Array type | The default value assigned when the player creates a new item in the array. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `value` | `Dictionary` | The current value that is set. If this property is not present on creation it will automatically be set to the `default` value. |
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `maxItems` | `Int` | How many items the player is able to add to the array. If this property is not set it allows the player to add as many as they wish. |
| `expanded` | `Boolean` | Sets if the Collection is expanded by default or not. |
| `canDeleteAndAdd` | `Boolean` | Sets if the player can add and delete items from the collection. |
| `keyLabel` | `String` | The label text for the key column. |
| `valueLabel` | `String` | The label text for the value column. |
| `canEditKeys` | `Boolean` | Sets if the player can edit the keys in the dictionary value editor. |

## Additional Information
### Available Array Types
Currently not all MCM Value Types are supported to be used as a Dictionary input type. The following types are ones that are supported:
* [String](String-Value-Type)
* [Integer](Integer-Value-Type)
* [Float](Float-Value-Type)
* [Boolean](Boolean-Value-Type)
* [Color](Color-Picker-Value-Type)
* [Vector2](Vector2-Value-Type)
* [Vector3](Vector3-Value-Type)

### Additional Optional Properties
Along with the listed optional properties on this page any of the other optional properties in the given `valueType` can be added to the Dictionary's properties and will be applied to each added array item.

[Up next: Registering Your Mod With MCM >](Registering-Your-Mod-With-MCM)
