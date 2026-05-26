<img width="628" height="50" alt="mcm_float" src="https://github.com/user-attachments/assets/935689af-321a-4a9b-9cd3-a941228b24e2" />

```gdscript
_config.set_value("Float", "testFloat", {
	"name" = "Test Float",
	"tooltip" = "A test float",
	"default" = 10.3,
	"value" = 10.3,
	"minRange" = 0,
	"maxRange" = 50.5,
	"step" = 0.001
})
```

# Setup
## Properties
### Section Name: `Float`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` |`String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` |`String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Float` | The default value that the player can revert back to in the configuration menu. |
| `value` | `Float` | The current value that is set. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `minRange` | `Float` | The minimum value the player is able to set the value to in the configuration menu. |
| `maxRange` | `Float` | The maximum value the player is able to set the value to in the configuration menu. |
| `step` | `Float` | This property effectively sets two settings.<br>1. How many decimal places are allowed in the input<br>2. How much is added per step in both the Slider and SpinBox input. |

[Up next: Boolean Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Boolean-Value-Type)