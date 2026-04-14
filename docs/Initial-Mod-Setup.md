First create your script file that be used to create and manage your config files. In this example we will name it `ExampleModConfig.gd`
* While you can do this in your `Main.gd` script I recommend creating a separate file to keep it clutter free
* **Make sure to place `extends Node` at the top of the script**

ExampleModConfig.gd
```gdscript
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
* `FILE_PATH` - This is the file path that your config file(s) will be stored. **It is very important that your config files be saved at** `"user://MCM/{MOD_ID}/"`

`ExampleModConfig.gd`
```gdscript
extends Node

const MOD_ID = "ExampleMod"
const FILE_PATH = "user://MCM/ExampleMod"

func _ready():
    pass
```

[Up next: Creating The Config File >](https://github.com/DoinkOink/Mod-Configuration-Menu-Road-To-Vostok/wiki/Creating-The-Config-File)