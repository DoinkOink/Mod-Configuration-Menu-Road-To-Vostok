**Inherits:** [MCM_Number](MCM_Number) < [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Allows the player to input an integar value in MCM

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Int](MCM_Int) | [MCM_Int](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Int](MCM_Int) | [setMinRange](#set-min-range)(minRange: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |
| [MCM_Int](MCM_Int) | [setMaxRange](#set-max-range)(maxRange: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |
| [MCM_Int](MCM_Int) | [setStep](#set-step)(step: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |
| [Dictionary]() | [createConfigObject](MCM_Type#create-config-object)() const |

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Int](MCM_Int) MCM_Int(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [int](https://docs.godotengine.org/en/stable/classes/class_int.html))
&emsp;Constructs an MCM_Int. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Number](MCM_Number#constructor) constructor.

## Method Descriptions
<a name="set-min-range"></a>
#### [MCM_Int](MCM_Int) setMinRange(minRange: [int](https://docs.godotengine.org/en/stable/classes/class_int.html))
&emsp;Set the minimum value this value can be set to

---

<a name="set-max-range"></a>
#### [MCM_Int](MCM_Int) setMaxRange(maxRange: [int](https://docs.godotengine.org/en/stable/classes/class_int.html))
&emsp;Set the maximum value this value can be set to

---

<a name="set-step"></a>
#### [MCM_Int](MCM_Int) setStep(step: [int](https://docs.godotengine.org/en/stable/classes/class_int.html))
&emsp;Set how much the UI SpinBox/Slider increments/decrements the value