<!-- <img width="628" height="50" alt="" src="" /> -->

```gdscript
_config.set_value("Vector3", "testVector3", {
    "name": "Test Vector3",
    "tooltip": "A test vector3",
    "default": Vector3(10, 10, 10),
    "value": Vector3(10, 10, 10),
    "minRange": Vector3(0, 2, -10),
    "maxRange": Vector3(50, 40, 20),
    "step": 1,
    "isInt": true
})
```

## Properties
### Section Name: `Vector3`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Vector3` | The default value that the player can revert back to in the configuration menu. |
| `value` | `Vector3` | The current value that is set. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `minRange` | `Vector3` | The minimum value the player is able to set the value to in the configuration menu. |
| `maxRange` | `Vector3` | The maximum value the player is able to set the value to in the configuration menu. |
| `step` | `Float` | This property effectively sets two settings.<br>1. How many decimal places are allowed in the input<br>2. How much is added per step in the SpinBox input. |
| `isInt` | `Boolean` | This sets if the SpinBox inputs will allow float values to be entered. |

## Additional Information
For both the `minRange` and `maxRange` properties it individually sets the x/y/z min/max range based on the given x/y/z values. So in this example the min range for `z` would be `-10` and the max range would be `20`

[Up next: Array Value Type >](Array-Value-Type)