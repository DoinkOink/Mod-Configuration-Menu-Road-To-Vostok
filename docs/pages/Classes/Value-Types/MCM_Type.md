**Inherited By:** [MCM_Category](MCM_Category) [MCM_Value](MCM_Value), [MCM_String](MCM_String), [MCM_Int](MCM_Int), [MCM_FLoat](MCM_FLoat), [MCM_Bool](MCM_Bool), [MCM_Keycode](MCM_Keycode), [MCM_Color](MCM_Color), [MCM_Dropdown](MCM_Dropdown), [MCM_Vector2](MCM_Vector2), [MCM_Vector3](MCM_Vector3), [MCM_Array](MCM_Array), [MCM_Dictionary](MCM_Dictionary), [MCM_](MCM_), [MCM_Collections](MCM_Collections), [MCM_Numbers](MCM_Numbers), [MCM_Vectors](MCM_Vectors)

MCMs base type to control config creation

## Description
The base type that all MCM values inherit and sets up properties that all values will use.

## Properties
| Type | Name | Default Value |
|---|---|---|
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [Section](#section) | `"Value"` |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [ID](#id) | `""` |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [Name](#name) | `""` |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | [MenuPos](#menupos) | `0` |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Type](MCM_Type) | [MCM_Type](#constructor)(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Type](MCM_Type) | [setMenuPos](#set-menu-pos)(menuPos: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](#create-config-object)() const |
| void | [addToConfig](#add-to-config)(config: [ConfigFile](https://docs.godotengine.org/en/stable/classes/class_configfile.html)) const |

## Property Descriptions
<a name="section"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | Section = "Value"
&emsp;Defines the type of value this config setting will be. This tells MCM what kind of UI to use in the ingame menu.

---

<a name="id"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) ID = ""
&emsp;The unique ID for this value

---

<a name="name"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) Name = ""
&emsp;The friendly name of the value that will be displayed in the configuration menu.

---

<a name="menupos"></a>
#### [int](https://docs.godotengine.org/en/stable/classes/class_int.html) MenuPos = 0
&emsp;Overrides the default alhpabetical sorting and places it in the given position in relation to other values with a menu_pos property.

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Type](MCM_Type) MCM_Type(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html))
&emsp;Constructs an MCM_Type value and sets the [Section](#section), [ID](#id), and [Name](#name) properties.

## Method Descriptions
<a name="set-menu-pos"></a>
#### [MCM_Type](MCM_Type) setMenuPos(menuPos: [int](https://docs.godotengine.org/en/stable/classes/class_int.html))
&emsp;Set the position to be displayed within the MCM Menu. Lower number means it shows up earlier on the menu. For Categories it sets the position in relation to the other headers that are present.

---

<a name="create-config-object"></a>
#### [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) createConfigObject()
&emsp;Internal Use Only. Do **not** call this method directly.

&emsp;Creates the config object format and assigns set values that MCM will use to display settings.

---

<a name="add-to-config"></a>
#### void addToConfig(config: [ConfigFile](https://docs.godotengine.org/en/stable/classes/class_configfile.html))
&emsp;Internal Use Only. Do **not** call this method directly.

&emsp;Assigns this values config object to the assigned [Section](#section) and [ID](#id) inside `config`