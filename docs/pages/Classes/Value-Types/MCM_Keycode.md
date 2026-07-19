**Inherits:** [MCM_Value](MCM_Value) < [MCM_Type](MCM_Type)

## Description
Allows players the input a custom keybind as a value.

## Properties
| Type | Name |
|---|---|
| [MCM_Key_Types](MCM_Config#mcm-key-types) | [DefaultType](#default-type) |
| [MCM_Modifiers](MCM_Config#mcm-modifiers)[] | [DefaultModifiers](#default-modifiers) |

## Constructors
| Return Value | Name and Parameters |
|---|---|
| [MCM_Keycode](MCM_Keycode) | [MCM_Keycode](#constructor)(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Key](https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-key), defaultType: [MCM_Key_Types](MCM_Config#mcm-key-types)) |

## Methods
| Return Value | Name and Parameters |
|---|---|
| [MCM_Keycode](MCM_Keycode) | [setDefaultModifiers](#set-default-modifiers)(defaultModifiers: [MCM_Modifiers](MCM_Config#mcm-modifiers)[]) |
| [MCM_Keycode](MCM_Keycode) | [addAltModifier](#add-alt-modifier)() |
| [MCM_Keycode](MCM_Keycode) | [addControlModifier](#add-control-modifier)() |
| [MCM_Keycode](MCM_Keycode) | [addMetaModifier](#add-meta-modifier)() |
| [MCM_Keycode](MCM_Keycode) | [addShiftModifier](#add-shift-modifier)() |
| [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html) | [createConfigObject](MCM_Type#create-config-object)() const |

## Property Descriptions
<a name="default-type"></a>
#### [MCM_Key_Types](MCM_Config#mcm-key-types) DefaultType
&emsp;The input type the default key is set to.

---

<a name="default-modifiers"></a>
#### [MCM_Modifiers](MCM_Config#mcm-modifiers)[] DefaultModifiers
&emsp;The default modifier keys that need to be pressed alongside the default key to register as an input.

## Constructor Descriptions
<a name="constructor"></a>
#### [MCM_Keycode](MCM_Keycode) MCM_Keycode(id: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), tooltip: [String](https://docs.godotengine.org/en/stable/classes/class_string.html), default: [Key](https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-key), defaultType: [MCM_Key_Types](MCM_Config#mcm-key-types))
&emsp;Constructs an MCM_Key and sets the [DefaultType](#default-type) properties. And then sends `section`, `id`, `name`, `tooltip`, and `default` parameters to the inherited [MCM_Value](MCM_Value#constructor) constructor.

## Method Descriptions
<a name="set-default-modifiers"></a>
#### [MCM_Keycode](MCM_Keycode) setDefaultModifiers(defaultModifiers: [MCM_Modifiers](MCM_Config#mcm-modifiers)[])
&emsp;Set the default modifiers that need to be pressed alongside the assigned keycode. Will also validate a modifier isn't being added that is the same as the assigned default key.

---

<a name="add-alt-modifier"></a>
#### [MCM_Keycode](MCM_Keycode) addAltModifier()
&emsp;Add the alt key to be pressed as a modifier alongside the assigned keycode. Will also validate a modifier isn't being added that is the same as the assigned default key.

---

<a name="add-control-modifier"></a>
#### [MCM_Keycode](MCM_Keycode) addControlModifier()
&emsp;Add the control key to be pressed as a modifier alongside the assigned keycode. ill also validate a modifier isn't being added that is the same as the assigned default key.

---

<a name="add-meta-modifier"></a>
#### [MCM_Keycode](MCM_Keycode) addMetaModifier()
&emsp;Add the meta/windows key to be pressed as a modifier alongside the assigned keycode. Will also validate a modifier isn't being added that is the same as the assigned default key.

---

<a name="add-shift-modifier"></a>
#### [MCM_Keycode](MCM_Keycode) addShiftModifier()
&emsp;Add the shift key to be pressed as a modifier alongside the assigned keycode. Will also validate a modifier isn't being added that is the same as the assigned default key.
