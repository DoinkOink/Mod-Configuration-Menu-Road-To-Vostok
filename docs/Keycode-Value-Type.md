<img width="628" height="50" alt="mcm_keycode" src="https://github.com/user-attachments/assets/6faf7c3c-c660-47b4-86d1-7f92842a0ebf" />

```gdscript
_config.set_value("Keycode", "testKeycode", {
	"name" = "Test Keycode",
	"tooltip" = "A test keycode",
	"default" = KEY_ALT,
	"default_type" = "Key",
	"value" = KEY_ALT,
	"type" = "Key"
})
```

## Properties
### Section Name: `Keycode`
### Required
| Name | Value Type | Description |
|---|---|---|
| `name` | `String` | The friendly name of the value that will be displayed in the configuration menu. |
| `tooltip` | `String` | A short description of the value that will be displayed when hovering over the name in the configuration menu. |
| `default` | `Keycode` | The default value that the player can revert back to in the configuration menu. |
| `default_type` | `"Key"` - Any key on the keyboard.<br><br>`"Mouse"` - Any button on the mouse | The input type the default key is set to. |
| `value` | `Keycode` | The current value that is set. |
| `type` | `"Key"` - Any key on the keyboard.<br><br>`"Mouse"` - Any button on the mouse | The input type of the current value that is set. |

### Optional
| Name | Value Type | Description |
|---|---|---|
| `category` | `String` | The categories name to place the value in. [Learn more about this property here.](Custom-Config-Property-Sorting) |
| `menu_pos` | `Int` | Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a `menu_pos` property. [Learn more about this property here.](Custom-Config-Property-Sorting) |

## Additional Information
The Inputs action name will be the config value name you set here, for this example it would be `testKeycode`

### Important Note
MCM will handle both registering your input to the `InputMap` and updating the `InputMap` with any new values that the player sets. So as the author you will only ever need to set the value in the initial config file creation and just call `Input.is_action_just_pressed()` with whatever you named the value. Here is an example on how to correctly check for input:

# Implementation
### Checking For Input
```gdscript
func _input(event):
    if (Input.is_action_pressed("testKeycode")):
        print("Test Keycode Pressed")
```
### Other Input Methods
To see all Input methods you can use [check out this docs page about it](https://docs.godotengine.org/en/stable/classes/class_input.html) and look at any methods that have the word `action` in it.

[Up next: Color Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Color-Picker-Value-Type)