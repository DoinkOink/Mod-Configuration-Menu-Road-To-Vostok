**Inherits:** [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Allows the player to select a list of options from a dropdown.

## Properties
| Type | Name |
|---|---|
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [Options](#options) |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Dropdown](MCM_Dropdown) | [MCM_Dropdown](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), options: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](MCM_Type#create-config-object)() const |

## Property Descriptions
<a name="options"></a>
#### [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) Options
&emsp;A Dictionary that holds the config "value" as the key and the label that's displayed in MCM as the dictionary value.

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Dropdown](MCM_Dropdown) MCM_Dropdown(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), options: [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html))
&emsp;Constructs an MCM_Dropdown and sets the [Options](#options) properties. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Value](MCM_Value#constructor) constructor.