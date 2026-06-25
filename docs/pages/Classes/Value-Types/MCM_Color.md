**Inherits:** [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Displays a color picker for the player to set a color in MCM

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Color](MCM_Color) | [MCM_Color](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Color](https://docs.godotengine.org/en/stable/classes/class_color.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](MCM_Type#create-config-object)() const |

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Color](MCM_Color) MCM_Color(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Color](https://docs.godotengine.org/en/stable/classes/class_color.html))
&emsp;Constructs an MCM_Color. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Value](MCM_Value#constructor) constructor.