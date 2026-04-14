<img width="628" height="50" alt="mcm_dropdown" src="https://github.com/user-attachments/assets/1cb22d98-1517-47cc-8ce8-3533ca0e777c" />

```gdscript
_config.set_value("Dropdown", "testDropdown", {
	"name" = "Test Dropdown",
	"tooltip" = "A test dropdown",
	"default" = 1,
	"value" = 1,
	"options" = [
		"Option 1",
		"Option 2",
		"Option 3"
	]
})
```
* Section - "Dropdown"
* "name" - The friendly name of the value that will be displayed in the configuration menu.
* "tooltip" - A short description of the value that will be displayed when hovering over the name in the configuration menu.
* "default" - The default dropdown selection that the player can revert back to in the configuration menu.
* "value" - The current dropdown selection as an Int
* "options" - A list of Strings that will be displayed for the player to select from the dropdown.

Note: default and value **must** be set as an Int

[Up next: Registering Your Mod With MCM >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Registering-Your-Mod-With-MCM)