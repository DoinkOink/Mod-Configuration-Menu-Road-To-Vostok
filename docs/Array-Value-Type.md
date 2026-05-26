<!-- <img width="628" height="50" alt="" src="" /> -->

```gdscript
_config.set_value("Array", "testStringArray", {
	"name": "Test Array",
	"tooltip": "A test array",
	"arrayType": "String",
	"default": ["Hello World!"],
	"value": ["Hello World!"],
	"defaultItemValue": "",
	"maxItems": 5
})
```
# Setup
## Properties
### Section Name: `Array`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Array` | The default value that the player can revert back to in the configuration menu. |
| `value` | `Array` | The current value that is set. |
| `arrayType` | `String` | This sets the type of inputs to be displayed to the player when adding items to the array. See below in Additional Information for the available array types. |
| `defaultItemValue` | Based on Array type | The default value assigned when the player creates a new item in the array. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `maxItems` | `Int` | How many items the player is able to add to the array. If this property is not set it allows the player to add as many as they wish. |

## Additional Information
### Available Array Types
Currently not all MCM Value Types are supported to be used as an Array input type. The following types are ones that are supported:
* [String](String-Value-Type)
* [Integer](Integer-Value-Type)
* [Float](Float-Value-Type)
* [Boolean](Boolean-Value-Type)
* [Color](Color-Picker-Value-Type)
* [Vector2](Vector2-Value-Type)
* [Vector3](Vector3-Value-Type)

### Additional Optional Properties
Along with the listed optional properties on this page any of the other optional properties in the given `arrayType` can be added to the Array's properties and will be applied to each added array item.

[Up next: Registering Your Mod With MCM >](Registering-Your-Mod-With-MCM)