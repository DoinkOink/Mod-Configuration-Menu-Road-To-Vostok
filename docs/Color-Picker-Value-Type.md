<img width="628" height="50" alt="mcm_color" src="https://github.com/user-attachments/assets/03714f54-bdc8-404f-ba5d-911a4f07f9cd" />


```gdscript
_config.set_value("Color", "testColor", {
	"name" = "Test Color",
	"tooltip" = "A test color",
	"default" = Color.WHITE,
	"value" = Color.WHITE
})
```
* Section - "Color"
* "name" - The friendly name of the value that will be displayed in the configuration menu.
* "tooltip" - A short description of the value that will be displayed when hovering over the name in the configuration menu.
* "default" - The default value that the player can revert back to in the configuration menu.
* "value" - The current value that is set.

When the player clicks on the currently displayed color a color picking UI will be displayed on screen.

[Up next: Dropdown Value Type >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Dropdown-Value-Type)