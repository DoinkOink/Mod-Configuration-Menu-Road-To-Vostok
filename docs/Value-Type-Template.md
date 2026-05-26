<!-- <img width="628" height="50" alt="" src="" /> -->

```gdscript
_config.set_value("{Section Name}", "", {
	"name" = "",
	"tooltip" = "",
	"default" = "",
	"value" = ""
})
```

# Setup
## Properties
### Section Name: `{Section Name}`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `toolitp` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `` | The default value that the player can revert back to in the configuration menu. |
| `value` | `` | The current value that is set. |
| `` | `` |  |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `` | `` |  |

## Additional Information

[Up next:  >]()