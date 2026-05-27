```gdscript
func UpdateConfigProperties(config: ConfigFile):
	print(config.get_value("String", "testString"))
```
Whenever a player updates the configuration file from MCM the associated callback function passed to `RegisterConfigruation` will be called with the `ConfigFile` passed as a parameter. With the exception of `Keycode` type values you as the author must handle updating the properties your mod uses in conjunction with the config file. I would highly suggest looking to see how Road to Vostok uses the `Gamedata.gd` and `Gamedata.tres`, or even this mod with the `MCM_Helper.gd` and `MCM_Helper.tres`, scripts to store and access global variables across your other scripts.

I've included a small example on how to retrieve a value from a `ConfigFile` in the `UpdateConfigProperties` function. Again I highly recommend you looking at the [documentation page for `ConfigFile`](https://docs.godotengine.org/en/4.4/classes/class_configfile.html) to get a better understanding on how to access the data stored in them.

[Up next: Wrapping Up >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Wrapping-Up)