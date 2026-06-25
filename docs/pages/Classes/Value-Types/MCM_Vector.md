**Inherits:** [MCM_Number](MCM_Number) < [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

**Inherited By:** [MCM_Vector2](MCM_Vector2), [MCM_Vector3](MCM_Vector3)

## Description
The base type for all Vector input types for MCM

## Properties
| Type | Name |
|---|---|
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | [IsInt](#is-int) |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Vector](MCM_Vector) | [MCM_Vector](#constructor)(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Vector](MCM_Vector) | [setIsInt](#set-is-int)(isInt: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)) |
| [Dictionary]() | [createConfigObject](MCM_Type#create-config-object)() const |

## Property Descriptions
<a name="is-int"></a>
#### [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) IsInt
&emsp;This sets if the SpinBox inputs will allow float values to be entered.

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Vector](MCM_Vector) MCM_Vector(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Constructs an MCM_Vector. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_](MCM_#constructor) constructor.

## Method Descriptions
<a name="set-is-int"></a>
#### [MCM_Vector](MCM_Vector) setIsInt(isInt: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html))
&emsp;Set if the vector allows float values or not.