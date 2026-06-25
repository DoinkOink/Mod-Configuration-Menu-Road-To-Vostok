First create your script file that be used to create and manage your config files. In this example we will name it `ExampleModConfig.gd`
* While you can do this in your `Main.gd` script it's recommended to creat a separate file to keep it clutter free
* **Make sure to place `extends Node` at the top of the script**

```gdscript
ExampleModConfig.gd:
extends Node

func _ready():
    pass
```

## mod.txt Autoload
Add your config file to the `mod.txt` file under the `[Autoload]` section. This allows the script to be ran as the game first loads so your config file can be created/loaded before anything accesses it.
* Make sure the path has the correct folder structure to point to the script just like your `Main.gd` script

mod.txt
```toml
[Autoload]
ExampleConfig="res://ModConfigruationMenu/ExampleModConfig.gd"
```

## Config Constants
There are 2 constants that should be defined at the top of your config script to make config creation and registration easier. They are:
* `MOD_ID` - A unique identifier for your mod's configuration registration. **This does not need to be the same as your `mod.txt` id**
* `FRIENDLY_NAME` - The name that gets displayed in MCM for users to easily identify.
* `DESCRIPTION` - A short description of your mod that gets displayed when hovering over the mods MCM button.

```gdscript
ExampleModConfig.gd:
extends Node

const MOD_ID = "ExampleMod"
const FRIENDLY_NAME = "Example Mod"
const DESCRIPTION = "A short description of the mod"

func _ready():
    pass
```

[Up next: Constructing The Config File >](Constructing-The-Config-File)