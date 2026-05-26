<img width="628" height="50" alt="mcm_int" src="https://github.com/user-attachments/assets/aea4ffe1-f483-453e-8f56-aed4c8e7a13c" />

```gdscript
_config.set_value("Int", "testInt", {
	"name" = "Test Int",
	"tooltip" = "A test int",
	"default" = 5,
	"value" = 5,
	"minRange" = 0,
	"maxRange" = 20,
	"step" = 1
})
```


## Properties
### Section Name: `Int`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` |`String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` |`String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Int` | The default value that the player can revert back to in the configuration menu. |
| `value` | `Int` | The current value that is set. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `minRange` | `Int` | The minimum value the player is able to set the value to in the configuration menu. |
| `maxRange` | `Int` | The maximum value the player is able to set the value to in the configuration menu. |
| `step` | `Int` | How much is added per step in both the Slider and SpinBox input. |

[Up next: Float Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Float-Value-Type)