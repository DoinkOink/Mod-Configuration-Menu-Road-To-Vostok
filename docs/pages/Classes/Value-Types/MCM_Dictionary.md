**Inherits:** [MCM_Collection](MCM_Collection) < [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Allows the player to set a dictionary of keys and values in MCM

## Properties
| Type | Name |
|---|---|
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [KeyLabel](#key-label) |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [ValueLabel](#value-label) |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | [CanEditKeys](#can-edit-keys) |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Dictionary](MCM_Dictionary) | [MCM_Dictionary](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html), valueType: [MCM_Collection_Types](), defaultItemValue: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Dictionary](MCM_Dictionary) | [setKeyLabel](#set-key-label)(keyLabel: [String](https://docs.godotengine.org/en/stable/classes/class_string.html)) |
| [MCM_Dictionary](MCM_Dictionary) | [setValueLabel](#set-value-label)(valueLabel: [String](https://docs.godotengine.org/en/stable/classes/class_string.html)) |
| [MCM_Dictionary](MCM_Dictionary) | [setCanEditKeys](#set-can-edit-keys)(canEditKeys: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)) |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](MCM_Type#create-config-object)() const |

## Property Descriptions
<a name="key-label"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) KeyLabel
&emsp;The label text for the key column

---

<a name="value-label"></a>
#### [String](https://docs.godotengine.org/en/stable/classes/class_string.html) ValueLabel
&emsp;The label text for the value column

---

<a name="can-edit-keys"></a>
#### [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) CanEditKeys
&emsp;Sets if the player can edit the keys in the dictionary value editor

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Dictionary](MCM_Dictionary) MCM_Dictionary(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html), valueType: [MCM_Collection_Types](), defaultItemValue: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html))
&emsp;Constructs an MCM_Dictionary. And then sends `section`, `id`, `name`, `tooltip`, `default`, `valueType`, and `defaultItemValue` parameters to the inherited [MCM_Collection](MCM_Collection#constructor) constructor.

## Method Descriptions
<a name="set-key-label"></a>
#### [MCM_Dictionary](MCM_Dictionary) setKeyLabel(keyLabel: [String](https://docs.godotengine.org/en/stable/classes/class_string.html))
&emsp;Sets the label text for the key column

---

<a name="set-value-label"></a>
#### [MCM_Dictionary](MCM_Dictionary) setValueLabel(valueLabel: [String](https://docs.godotengine.org/en/stable/classes/class_string.html))
&emsp;Sets the label text for the value column

---

<a name="set-can-edit-keys"></a>
#### [MCM_Dictionary](MCM_Dictionary) setCanEditKeys(canEditKeys: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html))
&emsp;Sets if the player can edit the keys in the dictionary value editor