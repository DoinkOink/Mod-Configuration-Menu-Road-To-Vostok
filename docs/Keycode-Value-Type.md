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
* Section - "Keycode"
* The Inputs action name will be the value name you set here for this example it would be `testKeycode`
* "name" - The friendly name of the value that will be displayed in the configuration menu.
* "tooltip" - A short description of the value that will be displayed when hovering over the name in the configuration menu.
* "default" - The default value that the player can revert back to in the configuration menu.
* "default_type" - The input type the default key is set to.
	* This must be one of two values
		* "Key" - Any key on the keyboard
		* "Mouse" - Any button on the mouse
* "value" - The current value that is set.
* "type" - The input type of the current value that is set.
	* This must be one of two values
		* "Key" - Any key on the keyboard
		* "Mouse" - Any button on the mouse

An important note about Keycode's is that MCM will handle both registering it to the `InputMap` and updating the `InputMap` with any new values that the player sets. So as the author you will only ever need to set the value in the initial config file creation and just call `Input.is_action_just_pressed()` with whatever you named the value. Here is an example on how to correctly check for input:

```gdscript
func _input(event):
    if (Input.is_action_pressed("testKeycode")):
        print("Test Keycode Pressed")
```

To see all Input methods you can use [check out this docs page about it](https://docs.godotengine.org/en/stable/classes/class_input.html) and look at any methods that have the word `action` in it.

[Up next: Color Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Color-Picker-Value-Type)