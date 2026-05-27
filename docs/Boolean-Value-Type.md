<!-- <img width="628" height="50" alt="mcm_bool" src="https://github.com/user-attachments/assets/2f65e7a7-3639-4348-9733-26e7e4ec034a" /> -->

```gdscript
_config.set_value("Bool", "testBool", {
	"name" = "Test Bool",
	"tooltip" = "The first test bool",
	"default" = false,
	"value" = false
})
```

## Properties
### Section Name: `Bool`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Boolean` | The default value that the player can revert back to in the configuration menu. |
| `value` | `Boolean` | The current value that is set. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |

[Up next: Keycode Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Keycode-Value-Type)