**Inherits:** [MCM_Vector](MCM_Vector) <> [MCM_Number](MCM_Number) < [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Allows the player to input a Vector3 in MCM

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Vector3](MCM_Vector3) | [MCM_Vector3](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Vector3](MCM_Vector3) | [setMinRange](#set-min-range)(minRange: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html)) |
| [MCM_Vector3](MCM_Vector3) | [setMaxRange](#set-max-range)(maxRange: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html)) |
| [MCM_Vector3](MCM_Vector3) | [setStep](#set-step)(step: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html)) |
| [Dictionary]() | [createConfigObject](MCM_Type#create-config-object)() const |

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Vector3](MCM_Vector3) MCM_Vector3(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html))
&emsp;Constructs an MCM_Vector3. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Vector](MCM_Vector#constructor) constructor.

## Method Descriptions
<a name="set-min-range"></a>
#### [MCM_Vector3](MCM_Vector3) setMinRange(minRange: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html))
&emsp;Set the minimum value this value can be set to

---

<a name="set-max-range"></a>
#### [MCM_Vector3](MCM_Vector3) setMaxRange(maxRange: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html))
&emsp;Set the maximum value this value can be set to

---

<a name="set-step"></a>
#### [MCM_Vector3](MCM_Vector3) setStep(step: [Vector3](https://docs.godotengine.org/en/stable/classes/class_vector3.html))
&emsp;Set how much the UI SpinBox/Slider increments/decrements the value and how many decimal places the value can have if it accepts floating point values.