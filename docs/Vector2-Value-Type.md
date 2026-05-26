<!-- <img width="628" height="50" alt="" src="" /> -->

```gdscript
_config.set_value("Vector2", "testVector2", {
	"name": "Test Vector2",
	"tooltip": "A test vector2",
	"default": Vector2(10, 10),
	"value": Vector2(10, 10),
	"minRange": Vector2(0, 2),
	"maxRange": Vector2(50, 40),
	"step": 0.5,
	"category": "Test Category 4",
	"isInt": false
})
```

## Properties
### Section Name: `Vector2`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Vector2` | The default value that the player can revert back to in the configuration menu. |
| `value` | `Vector2` | The current value that is set. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `minRange` | `Vector2` | The minimum value the player is able to set the value to in the configuration menu. |
| `maxRange` | `Vector2` | The maximum value the player is able to set the value to in the configuration menu. |
| `step` | `Float` | This property effectively sets two settings.<br>1. How many decimal places are allowed in the input<br>2. How much is added per step in the SpinBox input. |
| `isInt` | `Boolean` | This sets if the SpinBox inputs will allow float values to be entered. |

## Additional Information
For both the `minRange` and `maxRange` properties it individually sets the x/y min/max range based on the given x/y values. So in this example the min range for `y` would be `2` and the max range would be `40`

[Up next: Vector 3 Value Type >](Vector3-Value-Type)