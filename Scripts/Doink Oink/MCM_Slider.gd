extends Node

@onready var nameLabel : Label = find_child("Label")
@onready var slider : HSlider = find_child("Slider")
@onready var sliderInput : SpinBox = find_child("Input")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value
var defaultValue

var minRange: float
var maxRange: float
var isInt = false

var hasChanged = false
var suppressNotify = false

func _ready():
    if !valueId:
        slider.value_changed.connect(_on_slider_value_changed)
        sliderInput.value_changed.connect(_on_input_value_changed)
        return

    isInt = section == "Int"

    nameLabel.text = valueData["name"]
    nameLabel.tooltip_text = valueData["tooltip"]

    minRange = valueData["minRange"]
    maxRange = valueData["maxRange"]
    value = valueData["value"]
    defaultValue = valueData["default"]

    sliderInput.min_value = minRange
    sliderInput.max_value = maxRange
    sliderInput.rounded = isInt
    sliderInput.set_value_no_signal(value)

    slider.min_value = minRange
    slider.max_value = maxRange
    slider.rounded = isInt
    slider.set_value_no_signal(value)

    if ("step" in valueData):
        sliderInput.step = valueData["step"]
        slider.step = valueData["step"]
    elif (isInt):
        sliderInput.step = 1
        slider.step = 1

    CheckIsDefault(value)

    # Connect signals after all values are set setting min_value can clamp
    # the default (0) and fire value_changed, which triggers cascading callbacks.
    slider.value_changed.connect(_on_slider_value_changed)
    sliderInput.value_changed.connect(_on_input_value_changed)

func GetValueData():
    valueData["value"] = sliderInput.value
    return valueData

func CheckIsDefault(checkValue):
    hasChanged = defaultValue != checkValue
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE

func SetValue(newValue) -> void:
    suppressNotify = true
    sliderInput.set_value_no_signal(newValue)
    slider.set_value_no_signal(newValue)
    CheckIsDefault(newValue)
    suppressNotify = false

func OnValueChanged(newValue):
    if suppressNotify:
        return
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue, menu)

func _on_slider_value_changed(newValue: float) -> void:
    sliderInput.set_value_no_signal(newValue)
    CheckIsDefault(newValue)
    OnValueChanged(newValue)

func _on_input_value_changed(newValue: float) -> void:
    slider.set_value_no_signal(newValue)
    CheckIsDefault(newValue)
    OnValueChanged(newValue)

func _on_default_button_pressed() -> void:
    value = defaultValue
    sliderInput.set_value_no_signal(value)
    slider.set_value_no_signal(value)
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
