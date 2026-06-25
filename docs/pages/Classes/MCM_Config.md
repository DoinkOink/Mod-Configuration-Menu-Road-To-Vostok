A helper class to create the MCM Config file to be registered with MCM

## Description
Provides methods to easily create and store all available MCM value types. The stored values can then be used to generate a config file and register your mod with MCM.

## Properties
| Type | Name | Default Value |
|---|---|---|
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [FilePath](#filepath) | `"user://MCM//"` |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [ModID](#modid) | `""` |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [FriendlyName](#friendlyname) | `""` |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [Description](#description) | `""` |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [FileOnSaveCallback](#fileonsavecallback) | `null` |
| [Object](https://docs.godotengine.org/en/stable/classes/class_object.html) | [CallbackObject](#callbackobject) | `null` |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [CreatedValues](#createdvalues) | `{}` |

## Constructors
| Return Value | Parameters |
|---|---|
| [MCM_Config](MCM_Config) | [MCM_Config](#mcm-config-constructor)(modId: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), modFriendlyName: [String](https://docs.godotengine.org/en/stable/classes/class_string.html#string), modDescription: [String](https://docs.godotengine.org/en/stable/classes/class_string.html#string), fileOnSaveCallback: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html), callbackObject: [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| void | [RegisterMod](#register-mod)() const |
| [ConfigFile](https://docs.godotengine.org/en/stable/classes/class_configfile.html) | [CreateConfigFile](#create-config-file)() const |
| [MCM_Category](MCM_Category) | [CreateCategoryHeader](#create-category-header)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html)) |
| [MCM_String](MCM_String) | [CreateStringValue](#create-string)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [String](https://docs.godotengine.org/en/stable/classes/class_string.html)) |
| [MCM_Int](MCM_Int) | [CreateIntValue](#create-int)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |
| [MCM_Float](MCM_Float) | [CreateFloatValue](#create-float)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [float](https://docs.godotengine.org/en/stable/classes/class_float.html)) |
| [MCM_Bool](MCM_Bool) |  [CreateBoolValue](#create-bool)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)) |
| [MCM_Keycode](MCM_Keycode) | [CreateKeycodeValue](#create-keycode)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Key](https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-key), defaultType: [MCM_Key_Types](#mcm-key-types)) |
| [MCM_Color](MCM_Color) | [CreateColorValue](#create-color)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Color](https://docs.godotengine.org/en/stable/classes/class_color.html)) |
| [MCM_Dropdown](MCM_Dropdown) | [CreateDropdownValue](#create-dropdown)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), options: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html)) |
| [MCM_Vector2](MCM_Vector2) | [CreateVector2Value](#create-vector2)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html)) |
| [MCM_Vector3](MCM_Vector3) | [CreateVector3Value](#create-vector3)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html)) |
| [MCM_Array](MCM_Array) | [CreateArrayValue](#create-array)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html), valueType: [MCM_Collection_Types](#mcm-collection-types), defaultItemValue: [String](https://docs.godotengine.org/en/stable/classes/class_string.html) \| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) \| [float](https://docs.godotengine.org/en/stable/classes/class_float.html) \| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) \| [Color](https://docs.godotengine.org/en/stable/classes/class_color.html) \| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html) \| [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html)) |
| [MCM_Dictionary](MCM_Dictionary) | [CreateDictionaryValue](#create-dictionary)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html), valueType: [MCM_Collection_Types](#mcm-collection-types), defaultItemValue: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html)) |

## Enumerations
<a name="mcm-collection-types"></a>
#### enum MCM_Collection_Types:
&emsp;[MCM_Collection_Types](#mcm-collection-types) **STRING** = 0

&emsp;&emsp;Sets an [MCM_Array]() or [MCM_Dictionary]() to accept [String](https://docs.godotengine.org/en/stable/classes/class_string.html) value types

&emsp;[MCM_Collection_Types](#mcm-collection-types) **INT** = 1

&emsp;&emsp;Sets an [MCM_Array]() or [MCM_Dictionary]() to accept [int](https://docs.godotengine.org/en/stable/classes/class_int.html) value types

&emsp;[MCM_Collection_Types](#mcm-collection-types) **FLOAT** = 2

&emsp;&emsp;Sets an [MCM_Array]() or [MCM_Dictionary]() to accept [Float](https://docs.godotengine.org/en/stable/classes/class_float.html) value types

&emsp;[MCM_Collection_Types](#mcm-collection-types) **BOOLEAN** = 3

&emsp;&emsp;Sets an [MCM_Array]() or [MCM_Dictionary]() to accept [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) value types

&emsp;[MCM_Collection_Types](#mcm-collection-types) **COLOR** = 4

&emsp;&emsp;Sets an [MCM_Array]() or [MCM_Dictionary]() to accept [Color](https://docs.godotengine.org/en/stable/classes/class_color.html) value types

&emsp;[MCM_Collection_Types](#mcm-collection-types) **VECTOR2** = 5

&emsp;&emsp;Sets an [MCM_Array]() or [MCM_Dictionary]() to accept [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html) value types

&emsp;[MCM_Collection_Types](#mcm-collection-types) **VECTOR3** = 6

&emsp;&emsp;Sets an [MCM_Array]() or [MCM_Dictionary]() to accept [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html) value types

---

<a name="mcm-key-types"></a>
#### enum MCM_Key_Types:
&emsp;[MCM_Key_Types](#mcm-key-types) **KEY** = 0

&emsp;&emsp;A keyboard key

&emsp;[MCM_Key_Types](#mcm-key-types) **MOUSE** = 1

&emsp;&emsp;A mouse button

---

<a name="mcm-modifiers"></a>
#### enum MCM_Modifiers:
&emsp;[MCM_Modifiers](#mcm-modifiers) **ALT** = 0

&emsp;&emsp;The alt key

&emsp;[MCM_Modifiers](#mcm-modifiers) **CONTROL** = 1

&emsp;&emsp;The control key

&emsp;[MCM_Modifiers](#mcm-modifiers) **META** = 2

&emsp;&emsp;The Meta/Windows key

&emsp;[MCM_Modifiers](#mcm-modifiers) **SHIFT** = 3

&emsp;&emsp;The shift key

## Property Descriptions
<a name="filepath"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) FilePath = "user://MCM//"
&emsp;Internal use **ONLY** do not modify.

&emsp;The path to the mods config file folder. This will be updated in the constructor to include the [ModID](#modid) as well.

---

<a name="modid"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) ModID = ""
&emsp;Internal use **ONLY** do not modify.

&emsp;The mods unique ID. If another mod uses the same ID MCM will not register the mods that load after it.

---

<a name="friendlyname"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) FriendlyName = ""
&emsp;Internal use **ONLY** do not modify.

&emsp;The name that gets displayed in MCM for users to easily identify.

---

<a name="description"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) Description = ""
&emsp;Internal use **ONLY** do not modify.

&emsp;A short description of your mod that gets displayed when hovering over the mods MCM button.

---

<a name="fileonsavecallback"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) FileOnSaveCallback = null
&emsp;Internal use **ONLY** do not modify.

&emsp;The method that gets called when a configuration file is edited and saved within MCM.

---

<a name="callbackobject"></a>
#### [Object](https://docs.godotengine.org/en/stable/classes/class_object.html) CallbackObject = null
&emsp;Internal use **ONLY** do not modify.

&emsp;The object that holds all of the methods that are passed as the `on_value_changed` property in values.

---

<a name="createdvalues"></a>
#### [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) CreatedValues = {}
&emsp;Internal use **ONLY** do not modify.

&emsp;All of the currently created values that will be later saved to the config file.

## Constructor Descriptions
<a name="mcm-config-constructor"></a>
#### [MCM_Config](MCM_Config) MCM_Config(modId: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), modFriendlyName: [String](https://docs.godotengine.org/en/stable/classes/class_string.html#string), modDescription: [String](https://docs.godotengine.org/en/stable/classes/class_string.html#string), fileOnSaveCallback: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html), callbackObject: [Object](https://docs.godotengine.org/en/stable/classes/class_object.html))
Creates the MCM_Config object
| Parameter Name | Description |
|---|---|
| modId: [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | The mods unique ID. Warning: If another mod has this same ID an error will be given and your mod will not be registered |
| modFriendlyName: [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | The name that will be displayed within the MCM |
| modDescription: [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | A short description of the mod |
| fileOnSaveCallback: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | The callback function that will handle value updates for your mod |
| callbackObject: [Object](https://docs.godotengine.org/en/stable/classes/class_object.html) | The object to call for individual value `on_value_changed` callbacks |

## Method Descriptions
<a name="register-mod"></a>
#### void RegisterMod() const
&emsp;Checks to see if the config file has already been created. Creates the file if it hasnt or checks if it has been updated if it was already created. Then registers your mod's config with MCM.

---

<a name="create-config-file"></a>
#### [ConfigFile](https://docs.godotengine.org/en/stable/classes/class_configfile.html) CreateConfigFile() const
&emsp;Internal use **ONLY**. Do not use this method for config file creation. Use [RegisterMod](#register-mod) instead.

&emsp;Generates the config file with all the values that were previously created.

---

<a name="create-category-header"></a>
#### [MCM_Category](MCM_Category) CreateCategoryHeader(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html))
&emsp;Creates and adds an [MCM_Category](MCM_Category) value to the config file.

##### Example:
```gdscript
CreateCategoryHeader("Test Category 2", "Test Category 2") \
    .setMenuPos(1)
```

---

<a name="create-string"></a>
#### [MCM_String](MCM_String) CreateStringValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [String](https://docs.godotengine.org/en/stable/classes/class_string.html))
&emsp;Creates and adds an [MCM_String](MCM_String) value to the config file.

##### Example:
```gdscript
CreateStringValue("testString", "Test String", "A test string", "Hello World") \
    .setCategory("Test Category 2") \
    .setMenuPos(1)
```

---

<a name="create-int"></a>
#### [MCM_Int](MCM_Int) CreateIntValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [int](https://docs.godotengine.org/en/stable/classes/class_int.html))
&emsp;Creates and adds an [MCM_Int](MCM_Int) value to the config file.

##### Example:
```gdscript
CreateIntValue("testInt", "Test Int", "A test int", 5) \
    .setMinRange(0) \
    .setMaxRange(20) \
    .setOnValueChanged("IntCallback") \
    .setCategory("Test Category 1") \
    .setMenuPos(1)
```
---

<a name="create-float"></a>
#### [MCM_Float](MCM_Float) CreateFloatValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [float](https://docs.godotengine.org/en/stable/classes/class_float.html))
&emsp;Creates and adds an [MCM_Float](MCM_Float) value to the config file.

##### Example:
```gdscript
CreateFloatValue("testFloat", "Test Float", "A test float", 10.3) \
    .setMinRange(0) \
    .setMaxRange(50.5) \
    .setStep(0.01) \
    .setCategory("Test Category 1")
```

---

<a name="create-bool"></a>
#### [MCM_Bool](MCM_Bool) CreateBoolValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html))
&emsp;Creates and adds an [MCM_Bool](MCM_Bool) value to the config file.

##### Example:
```gdscript
CreateBoolValue("testBool", "Test Bool", "A test bool", false) \
    .setCategory("Test Category 1")
```

---

<a name="create-keycode"></a>
#### [MCM_Keycode](MCM_Keycode) CreateKeycodeValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Key](https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-key), defaultType: [MCM_Key_Types](#mcm-key-types))
&emsp;Creates and adds an [MCM_Keycode](MCM_Keycode) value to the config file.

##### Example:
```gdscript
CreateKeycodeValue(
        "testKeycode",
        "Test Keycode",
        "A test keycode",
        KEY_ALT, 
        MCM_Config.MCM_Key_Types.KEY
    ) \
    .addShiftModifier() \
    .setCategory("Test Category 2")
```

---

<a name="create-color"></a>
#### [MCM_Color](MCM_Color) CreateColorValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Color](https://docs.godotengine.org/en/stable/classes/class_color.html))
&emsp;Creates and adds an [MCM_Color](MCM_Color) value to the config file.

##### Example:
```gdscript
CreateColorValue("testColor", "Test Color", "A test color", Color.WHITE) \
    .setCategory("Test Category 3")
```

---

<a name="create-dropdown"></a>
#### [MCM_Dropdown](MCM_Dropdown) CreateDropdownValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), options: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html))
&emsp;Creates and adds an [MCM_Dropdown](MCM_Dropdown) value to the config file.

##### Example:
```gdscript
CreateDropdownValue(
        "testDropdown",
        "Test Dropdown",
        "A test dropdown",
        "opt_1",
        {
            "opt_1": "Option 1",
            "opt_2": "Option 2",
            "opt_3": "Option 3"
        }
    ).setCategory("Test Category 3")
```

---

<a name="create-vector2"></a>
#### [MCM_Vector2](MCM_Vector2) CreateVector2Value(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html))
&emsp;Creates and adds an [MCM_Vector2](MCM_Vector2) value to the config file.

##### Example:
```gdscript
CreateVector2Value("testVector2", "Test Vector2", "A test vector2", Vector2(10, 10)) \
    .setMinRange(Vector2(0, 5)) \
    .setMaxRange(Vector2(50, 40)) \
    .setStep(0.5) \
    .setIsInt(false)
```

---

<a name="create-vector3"></a>
#### [MCM_Vector3](MCM_Vector3) CreateVector3Value(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html))
&emsp;Creates and adds an [MCM_Vector3](MCM_Vector3) value to the config file.

##### Example:
```gdscript
CreateVector3Value("testVector3", "Test Vector3", "a test vector3", Vector3(10, 10, 10)) \
    .setMinRange(Vector3(0, 4, -10)) \
    .setMaxRange(Vector3(50, 40, 20)) \
    .setStep(1) \
    .setIsInt(true) \
    .setCategory("Test Category 4")
```

---

<a name="create-array"></a>
#### [MCM_Array](MCM_Array) CreateArrayValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html), valueType: [MCM_Collection_Types](#mcm-collection-types), defaultItemValue: [String](https://docs.godotengine.org/en/stable/classes/class_string.html) \| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) \| [float](https://docs.godotengine.org/en/stable/classes/class_float.html) \| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) \| [Color](https://docs.godotengine.org/en/stable/classes/class_color.html) \| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html) \| [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html))
&emsp;Creates and adds an [MCM_Array](MCM_Array) value to the config file.

##### Example:
```gdscript
CreateArrayValue(
        "testVector3Array",
        "Test Array",
        "A test array",
        [],
        MCM_Config.MCM_Collection_Types.VECTOR3,
        Vector3.FORWARD
    ).setExpanded(true) \
    .setMinRange(Vector3.ZERO) \
    .setMaxRange(Vector3(40, 50, 10)) \
    .setMaxItems(5) \
    .setCategory("Test Category 4")
```

---

<a name="create-dictionary"></a>
#### [MCM_Dictionary](MCM_Dictionary) CreateDictionaryValue(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html), valueType: [MCM_Collection_Types](#mcm-collection-types), defaultItemValue: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html))
&emsp;Creates and adds an [MCM_Dictionary](MCM_Dictionary) value to the config file.

##### Example:
```gdscript
CreateDictionaryValue(
        "testStringDictionary",
        "Test Dictionary",
        "A test dictionary",
        { "Test Key": "Test Value" },
        MCM_Config.MCM_Collection_Types.STRING,
        { "Key": "Value" }
    ).setMaxItems(5)
```