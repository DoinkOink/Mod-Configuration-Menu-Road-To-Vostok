**Inherits:** [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

**Inherited By:** [MCM_Float](MCM_Float), [MCM_Int](MCM_Int), [MCM_Vector2](MCM_Vector2), [MCM_Vector3](MCM_Vector3)

## Description
The base type for all editable values that store numbers

## Properties
| Type | Name |
|---|---|
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [MinRange](#minrange) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [MaxRange](#maxrange) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [Step](#step) |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Number](MCM_Number) | [MCM_Number](#constructor)(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Number](MCM_Number) | [setMinRange](#set-min-range)(minRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |
| [MCM_Number](MCM_Number) | [setMaxRange](#set-max-range)(maxRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |
| [MCM_Number](MCM_Number) | [setStep](#set-step)(step: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](MCM_Type#create-config-object)() const |

## Property Descriptions
<a name="minrange"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) MinRange
&emsp;The minimum value the player is able to set the value to in the configuration menu.

---

<a name="maxrange"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) MaxRange
&emsp;The maximum value the player is able to set the value to in the configuration menu.

---

<a name="step"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) Step
&emsp;How much is added per step in both the Slider and SpinBox input. Also controls how many decimal places are allowed if it accepts floating point numbers

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Number](MCM_Number) MCM_Number(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Constructs an MCM_Number. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Value](MCM_Value#constructor) constructor 

## Method Descriptions
<a name="set-min-range"></a>
#### [MCM_Number](MCM_Number) setMinRange(minRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Set the minimum value this value can be set to

---

<a name="set-max-range"></a>
#### [MCM_Number](MCM_Number) setMaxRange(maxRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Set the maximum value this value can be set to

---

<a name="set-step"></a>
#### [MCM_Number](MCM_Number) setStep(step: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Set how much the UI SpinBox/Slider increments/decrements the value.

