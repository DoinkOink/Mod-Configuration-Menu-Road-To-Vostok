For this example we will use the base `ExampleModConfig` file we've been working with.

`ExampleModConfig.gd`
```gdscript
extends Node

const MOD_ID = "ExampleMod"
const FILE_PATH = "user://MCM/ExampleMod"

func _ready():
	var _config = ConfigFile.new()
	_config.set_value("String", "testString", {
		"name" = "Test String",
		"tooltip" = "A test string",
		"default" = "Hello World",
		"value" = "Hello World"
	})

	_config.set_value("Int", "testInt", {
		"name" = "Test Int",
		"tooltip" = "A test int",
		"default" = 5,
		"value" = 5,
		"minRange" = 0,
		"maxRange" = 20
	})

	_config.set_value("Float", "testFloat", {
		"name" = "Test Float",
		"tooltip" = "A test float",
		"default" = 10.3,
		"value" = 10.3,
		"minRange" = 0,
		"maxRange" = 50.5
	})
	
	_config.set_value("Bool", "testBool", {
		"name" = "Test Bool",
		"tooltip" = "A test bool",
		"default" = false,
		"value" = false
	})
	
	_config.set_value("Keycode", "testKeycode", {
		"name" = "Test Keycode",
		"tooltip" = "A test keycode",
		"default" = KEY_ALT,
		"value" = KEY_ALT
	})
		
	if !FileAccess.file_exists(FILE_PATH + "/config.ini"):
		DirAccess.open("user://").make_dir(FILE_PATH)
		_config.save(FILE_PATH + "/config.ini")
	else:
		_config.load(FILE_PATH + "/config.ini")

```

# Default Behavior
MCM will sort all your values alphabetically based on the set `name`. So for this example it will currently display the values in this order:
```
> Test Bool
> Test Float
> Test Int
> Test Keycode
> Test String
```

# Customizing How Your Values Are Sorted
If you wish to set how the values are sorted yourself all you need to do is add `menu_pos` when creating the config value. If `menu_pos` isn't set for a value it will place it under all values that has `menu_pos` and then alphabetically with everything else that doesn't have `menu_pos`.

For example if we wish to make sure `Test Keycode` is always shown at the top of the menu and `Test Float` below it we would change them to:
```gdscript
...

_config.set_value("Float", "testFloat", {
	"name" = "Test Float",
	"tooltip" = "A test float",
	"default" = 10.3,
	"value" = 10.3,
	"minRange" = 0,
	"maxRange" = 50.5,
	"menu_pos" = 2
})

...

_config.set_value("Keycode", "testKeycode", {
	"name" = "Test Keycode",
	"tooltip" = "A test keycode",
	"default" = KEY_ALT,
	"value" = KEY_ALT,
	"menu_pos" = 1
})

...
```

Now in the menu it will show up as:
```
> Test Keycode
> Test Float
> Test Bool
> Test Int
> Test String
```

# Adding Category Headers
For further sorting you can assign each config value to a category and MCM will create a Heading seperator within the configuration menu. In order to do this you need to add "category" to your value dictionary and assign a string that will act as the displayed category's header name. 

```gdscript
...

_config.set_value("Int", "testInt", {
  "name" = "Test Int",
  "tooltip" = "A test int",
  "default" = 5,
  "value" = 5,
  "minRange" = 0,
  "maxRange" = 20,
  "category" = "Test Category 1"
})

...

_config.set_value("Bool", "testBool2", {
  "name" = "Test Bool 2",
  "tooltip" = "The second test bool",
  "default" = true,
  "value" = true,
  "category" = "Test Category 1"
})
```

And here is what it will look like in the configuration menu:

<img width="1394" height="151" alt="mcm category_cropped" src="https://github.com/user-attachments/assets/5588723a-0110-4eef-b6cd-ce38bb1e9fc8" />

## Uncategorized Values
If any values aren't assigned a category for whatever reason it will be assigned to a default "Uncategorized" category that will always be displayed at the bottom. If no values are assigned a category the "Uncategorized" category will be ignored and the header not display (the values will still display as normal).

## Sorting Categories
Just like with values, Categories are sorted alphabetically by default (with the exception for Uncategorized). And just like values you can apply a custom "menu_pos" value to categories. In order to do this you will need to add the Category to the config file just like a value. 

Some things to remember:
* Section must be set to "Category"
* Key must be set to the exact value that was set in values "category"

```gdscript
_config.set_value("Category", "Test Category 1", {
  "menu_pos" = 1
})
```

### Sorting Values Within Categories
Each category will sort their assigned values as normal, first with the values "menu_pos" if set then alphabetically.
