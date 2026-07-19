<!-- <img width="628" height="50" alt="mcm_dropdown" src="https://github.com/user-attachments/assets/1cb22d98-1517-47cc-8ce8-3533ca0e777c" /> -->

```gdscript
_config.set_value("Dropdown", "testDropdown", {
	"name" = "Test Dropdown",
	"tooltip" = "A test dropdown",
	"default" = "opt_2"
	"options" = {
		"opt_1": "Option 1",
		"opt_2": "Option 2",
		"opt_3": "Option 3"
	}
})
```

## Properties
### Section Name: `Dropdown`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `String` | The default value that the player can revert back to in the configuration menu. |
| `options` | `Dictionary<String, String>` | A Dictionary that holds the config "value" as the key and the label that's displayed in MCM as the dictionary value. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `value` | `String` | The current value that is set. If this property is not present on creation it will automatically be set to the `default` value. |
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |

## Additional Information
`default` and `value` **must** be set as one of the given Keys in the `options` dictionary.

[Up next: Vector2 Value Type >](Vector2-Value-Type)
