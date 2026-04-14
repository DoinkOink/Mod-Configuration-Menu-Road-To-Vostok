<img width="628" height="50" alt="mcm_int" src="https://github.com/user-attachments/assets/aea4ffe1-f483-453e-8f56-aed4c8e7a13c" />

```gdscript
_config.set_value("Int", "testInt", {
	"name" = "Test Int",
	"tooltip" = "A test int",
	"default" = 5,
	"value" = 5,
	"minRange" = 0,
	"maxRange" = 20
})
```
* Section - "Int"
* "name" - The friendly name of the value that will be displayed in the configuration menu.
* "tooltip" - A short description of the value that will be displayed when hovering over the name in the configuration menu.
* "default" - The default value that the player can revert back to in the configuration menu.
* "value" - The current value that is set.
* "minRange" - The minimum value the player is able to set the value to in the configuration menu.
* "maxRange" - The maximum value the player is able to set the value to in the configuration menu.

[Up next: Float Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Float-Value-Type)