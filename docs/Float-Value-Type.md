<img width="628" height="50" alt="mcm_float" src="https://github.com/user-attachments/assets/935689af-321a-4a9b-9cd3-a941228b24e2" />

```gdscript
_config.set_value("Float", "testFloat", {
	"name" = "Test Float",
	"tooltip" = "A test float",
	"default" = 10.3,
	"value" = 10.3,
	"minRange" = 0,
	"maxRange" = 50.5
})
```
* Section - "Float"
* "name" - The friendly name of the value that will be displayed in the configuration menu.
* "tooltip" - A short description of the value that will be displayed when hovering over the name in the configuration menu.
* "default" - The default value that the player can revert back to in the configuration menu.
* "value" - The current value that is set.
* "minRange" - The minimum value the player is able to set the value to in the configuration menu.
* "maxRange" - The maximum value the player is able to set the value to in the configuration menu.

[Up next: Boolean Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Boolean-Value-Type)