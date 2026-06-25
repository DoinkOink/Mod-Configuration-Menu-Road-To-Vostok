**Inherits:** [MCM_Collection](MCM_Collection) < [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Allows the player to set an array of values in MCM

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Array](MCM_Array) | [MCM_Array](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html), valueType: [MCM_Collection_Types](MCM_Config#mcm-collection-types), defaultItemValue: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Array](MCM_Array) MCM_Array(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html), valueType: [MCM_Collection_Types](MCM_Config#mcm-collection-types), defaultItemValue: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Constructs an MCM_Array. And then sends `section`, `id`, `name`, `tooltip`, `default`, `valueType`, and `defaultItemValue` parameters to the inherited [MCM_Collection](MCM_Collection#constructor) constructor.