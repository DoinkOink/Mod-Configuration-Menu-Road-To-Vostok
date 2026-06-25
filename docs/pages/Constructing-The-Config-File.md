First we must grab the `MCM_Helpers` resource that is made available when it is loaded alongside your mod. To do that we'll place this right below the `extends Node` line:

```gdscript
extends Node

var McmHelpers = load("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
...
```

Now inside the `_ready()` function we will do three things
1. Write an if statement using the `McmHelpers` variable to make sure that the player has MCM installed
2. Construct a new [MCM_Config](MCM_Config) variable and pass the variables we have created previously alongside two new values
    * `UpdateConfigProperties` - This will be a function that will be used to update your code with the newley configured values by the player
    * `self` - a reference to the script that will hold all of the functions that will handle individual value updates done by the player
3. Create the mentioned `UpdateConfigProperties` function after the `_ready` function
    * This function will receive a [ConfigFile](https://docs.godotengine.org/en/stable/classes/class_configfile.html) that will hold all of your config values after the player is done configuring them.


```gdscript
...
func _ready():
    if McmHelpers:
        var _mcmConfig = MCM_Config.new(
            MOD_ID,                     # The mods unique ID
            FRIENDLY_NAME,              # The mods name that will be displayed within the MCM
            DESCRIPTION,                # A short description of the mod
            UpdateConfigProperties,     # The callback function that will handle all value updates for your mod
            self                        # The object to call for individual value `on_value_changed` callbacks
        )

func UpdateConfigProperties(config: ConfigFile):
    pass
```

