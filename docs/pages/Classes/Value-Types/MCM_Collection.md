**Inherits:** [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

**Inherited By:** [MCM_Array](MCM_Array), [MCM_Dictionary](MCM_Dictionary)

## Description
The base type for MCM values that hold a collection of inputs

## Properties
| Type | Name |
|---|---|
| [MCM_Collection_Types](MCM_Config#mcm-collection-types) | [ValueType](#value-type) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [DefaultItemValue](#default-item-value) |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | [MaxItems](#max-items) |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | [Expanded](#expanded) |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | [CanDeleteAndAdd](#can-delete-and-add) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [MinRange](#min-range) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [MaxRange](#max-range) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [Step](#step) |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [AcceptedNumberValueTypes](#accepted-number-value-types) |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Collection](MCM_Collection) | [MCM_Collection](#constructor)(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html), valueType: [MCM_Collection_Types](MCM_Config#mcm-collection-types), defaultItemValue: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Collection](MCM_Collection) | [setMaxItems](#set-max-items)(maxItems: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |
| [MCM_Collection](MCM_Collection) | [setExpanded](#set-expanded)(expanded: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)) |
| [MCM_Collection](MCM_Collection) | [setCanDeleteAndAdd](#set-can-delete-and-add)(canDeleteAndAdd: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)) |
| [MCM_Collection](MCM_Collection) | [setMinRange](#set-min-range)(minRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |
| [MCM_Collection](MCM_Collection) | [setMaxRange](#set-max-range)(maxRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |
| [MCM_Collection](MCM_Collection) | [setStep](#set-step)(step: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)) |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](MCM_Type#create-config-object)() const |

## Property Descriptions
<a name="value-type"></a>
#### [MCM_Collection_Types](MCM_Config#mcm-collection-types) ValueType
&emsp;Sets the type of inputs to be displayed to the player when adding items to the array.

---

<a name="default-item-value"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) DefaultItemValue
&emsp;The default value assigned when the player creates a new item in the collection.

---

<a name="max-items"></a>
#### [int](https://docs.godotengine.org/en/stable/classes/class_int.html) MaxItems
&emsp;How many items the player is able to add to the array. If this property is not set it allows the player to add as many as they wish.

&emsp;Anything less than or equal to zero = infinite entries

---

<a name="expanded"></a>
#### [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) Expanded
&emsp;Sets if the Collection is expanded by default or not

---

<a name="can-delete-and-add"></a>
#### [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) CanDeleteAndAdd
&emsp;Sets if the player can add and delete items from the collection

---

<a name="min-range"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) MinRange
&emsp;The minimum value the player is able to set the value to in the configuration menu.

&emsp;Only used if the ValueType inherits MCM_Number

---

<a name="max-range"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) MaxRange
&emsp;The maximum value the player is able to set the value to in the configuration menu.

&emsp;Only used if the ValueType inherits MCM_Number

---

<a name="step"></a>
#### [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) Step
&emsp;How much is added per step in both the Slider and SpinBox input. Also controls how many decimal places are allowed if it accepts floating point numbers

&emsp;Only used if the ValueType inherits MCM_Number

---

<a name="accepted-number-value-types"></a>
#### [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) AcceptedNumberValueTypes
&emsp;The accepted variable types a collection accepts

&emsp;This property is for internal use only. Do not attempt to change this property.

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Collection](MCM_Collection) MCM_Collection(section: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html), valueType: [MCM_Collection_Types](MCM_Config#mcm-collection-types), defaultItemValue: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Constructs an MCM_Collection and sets the [ValueType](#value-type) and [DefaultItemValue](#default-item-value) properties. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Value](MCM_Value#constructor) constructor.

## Method Descriptions
<a name="set-max-items"></a>
#### [MCM_Collection](MCM_Collection) setMaxItems(maxItems: [int](https://docs.godotengine.org/en/stable/classes/class_int.html))
&emsp;Set how many items the player is allowed to enter into the collection.

---

<a name="set-expanded"></a>
#### [MCM_Collection](MCM_Collection) setExpanded(expanded: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html))
&emsp;Set if the collection should be default expanded in the MCM

---

<a name="set-can-delete-and-add"></a>
#### [MCM_Collection](MCM_Collection) setCanDeleteAndAdd(canDeleteAndAdd: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html))
&emsp;Sets if the player can add and delete items from the collection

---

<a name="set-min-range"></a>
#### [MCM_Collection](MCM_Collection) setMinRange(minRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Set the minimum value this value can be set to

---

<a name="set-max-range"></a>
#### [MCM_Collection](MCM_Collection) setMaxRange(maxRange: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Set the maximum value this value can be set to

---

<a name="set-step"></a>
#### [MCM_Collection](MCM_Collection) setStep(step: [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html))
&emsp;Set how much the UI SpinBox/Slider increments/decrements the value.