<img width="628" height="50" alt="mcm_color" src="https://github.com/user-attachments/assets/03714f54-bdc8-404f-ba5d-911a4f07f9cd" />


```gdscript
_config.set_value("Color", "testColor", {
	"name" = "Test Color",
	"tooltip" = "A test color",
	"default" = Color.WHITE,
	"value" = Color.WHITE
})
```

## Properties
### Section Name: `Color`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` |`String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` |`String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Color` | The default value that the player can revert back to in the configuration menu. |
| `value` | `Color` | The current value that is set. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |

## Additional Information
When the player clicks on the currently displayed color a color picking UI will be displayed on screen.

[Up next: Dropdown Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Dropdown-Value-Type)