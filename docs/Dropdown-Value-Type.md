<img width="628" height="50" alt="mcm_dropdown" src="https://github.com/user-attachments/assets/1cb22d98-1517-47cc-8ce8-3533ca0e777c" />

```gdscript
_config.set_value("Dropdown", "testDropdown", {
	"name" = "Test Dropdown",
	"tooltip" = "A test dropdown",
	"default" = "opt_2",
	"value" = "opt_2",
	"options" = {
		"opt_1": "Option 1",
		"opt_2": "Option 2",
		"opt_3": "Option 3"
	}
})
```
* Section - "Dropdown"
* "name" - The friendly name of the value that will be displayed in the configuration menu.
* "tooltip" - A short description of the value that will be displayed when hovering over the name in the configuration menu.
* "default" - The default dropdown selection that the player can revert back to in the configuration menu.
* "value" - The current dropdown selection as the selected "options" dictionary key
* "options" - A Dictionary that holds the config "value" as the key and the label that's displayed in MCM as the dictionary value.

Note: default and value **must** be set as one of the given Keys in the "options" dictionary.

[Up next: Registering Your Mod With MCM >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Registering-Your-Mod-With-MCM)
