**Inherits:** [MCM_Type](MCM_Type)

**Inherited By:** [MCM_String](MCM_String), [MCM_Int](MCM_Int), [MCM_FLoat](MCM_FLoat), [MCM_Bool](MCM_Bool), [MCM_Keycode](MCM_Keycode), [MCM_Color](MCM_Color), [MCM_Dropdown](MCM_Dropdown), [MCM_Vector2](MCM_Vector2), [MCM_Vector3](MCM_Vector3), [MCM_Array](MCM_Array), [MCM_Dictionary](MCM_Dictionary), [MCM_](MCM_), [MCM_Collections](MCM_Collections), [MCM_Numbers](MCM_Numbers), [MCM_Vectors](MCM_Vectors)

## Description
An editable value within MCM

## Properties
| Type | Name |
|---|---|
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [Tooltip](#tooltip) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [Default](#default) |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [Category](#category) |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [OnValueChanged](#onvaluechanged) |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Value](MCM_Value) | [MCM_Value](#constructor)(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Type](MCM_Type) | [setCategory](#set-category)(category: [String](https://docs.godotengine.org/en/stable/classes/class_string.html)) |
| [MCM_Type](MCM_Type) | [setOnValueChanged](#set-on-value-changed)(onValueChanged: [String](https://docs.godotengine.org/en/stable/classes/class_string.html)) |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](MCM_Type#create-config-object)() const |

## Property Descriptions
<a name="tooltip"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) Tooltip
&emsp;A short description of the value that will be displayed when hovering over the name in the configuration menu.

---

<a name="default"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) Default
&emsp;The default value that the player can revert back to in the configuration menu.

---

<a name="category"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) Category
&emsp;The categories name/id to place the value in.

---

<a name="onvaluechanged"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) OnValueChanged
&emsp;The callback function to call when this value is changed by the player in MCM

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Value](MCM_Value) MCM_Value(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Constructs an MCM_Value and sets the [Tooltip](#tooltip) and [Default](#default) properties. And then sends `section`, `id`, and `name` parameters to the inherited [MCM_Type](MCM_Type#constructor) constructor

## Method Descriptions
<a name="set-category"></a>
#### [MCM_Type](MCM_Type) setCategory(category: [String](https://docs.godotengine.org/en/stable/classes/class_string.html))
&emsp;Set what category the value belongs to.

---

<a name="set-on-value-changed"></a>
#### [MCM_Type](MCM_Type) setOnValueChanged(onValueChanged: [String](https://docs.godotengine.org/en/stable/classes/class_string.html))
&emsp;Set the callback function to be called when the value is changed

