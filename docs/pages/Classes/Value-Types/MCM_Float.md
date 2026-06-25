**Inherits:** [MCM_Number](MCM_Number) < [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Allows the player to input a float value in MCM

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Float](MCM_Float) | [MCM_Float](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [float](https://docs.godotengine.org/en/stable/classes/class_float.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Float](MCM_Float) | [setMinRange](#set-min-range)(minRange: [float](https://docs.godotengine.org/en/stable/classes/class_float.html)) |
| [MCM_Float](MCM_Float) | [setMaxRange](#set-max-range)(maxRange: [float](https://docs.godotengine.org/en/stable/classes/class_float.html)) |
| [MCM_Float](MCM_Float) | [setStep](#set-step)(step: [float](https://docs.godotengine.org/en/stable/classes/class_float.html)) |
| [Dictionary]() | [createConfigObject](MCM_Type#create-config-object)() const |

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Float](MCM_Float) MCM_Float(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [float](https://docs.godotengine.org/en/stable/classes/class_float.html))
&emsp;Constructs an MCM_Float. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Number](MCM_Number#constructor) constructor.

## Method Descriptions
<a name="set-min-range"></a>
#### [MCM_Float](MCM_Float) setMinRange(minRange: [float](https://docs.godotengine.org/en/stable/classes/class_float.html))
&emsp;Set the minimum value this value can be set to

---

<a name="set-max-range"></a>
#### [MCM_Float](MCM_Float) setMaxRange(maxRange: [float](https://docs.godotengine.org/en/stable/classes/class_float.html))
&emsp;Set the maximum value this value can be set to

---

<a name="set-step"></a>
#### [MCM_Float](MCM_Float) setStep(step: [float](https://docs.godotengine.org/en/stable/classes/class_float.html))
&emsp;Set how much the UI SpinBox/Slider increments/decrements the value