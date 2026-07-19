<!-- <img width="628" height="50" alt="mcm_string" src="https://github.com/user-attachments/assets/afd685c0-d2c9-4aed-8994-0b511775eb03" /> -->

```gdscript
_config.set_value("String", "testString", {
	"name" = "Test String",
	"tooltip" = "A test string",
	"default" = "Hello World"
})
```

## Properties
### Section Name: `String`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `String` | The default value that the player can revert back to in the configuration menu. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `value` | `String` | The current value that is set. If this property is not present on creation it will automatically be set to the `default` value. |
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |

[Up next: Integer Value Type >](Integer-Value-Type)