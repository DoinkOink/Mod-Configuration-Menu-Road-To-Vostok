extends Node

@onready var nameLabel : Label = find_child("Label")
@onready var xInput : SpinBox = find_child("InputX")
@onready var yInput : SpinBox = find_child("InputY")
@onready var zInput : SpinBox = find_child("InputZ")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value: Vector3
var defaultValue: Vector3

var minRange: Vector3
var maxRange: Vector3
var isInt = false

var hasChanged = false
var suppressNotify = false

func _ready():
    if !valueId:
        xInput.value_changed.connect(_on_x_input_value_changed)
        yInput.value_changed.connect(_on_y_input_value_changed)
        return

    isInt = valueData.has("isInt") && valueData["isInt"]

    nameLabel.text = valueData["name"]
    nameLabel.tooltip_text = valueData["tooltip"]

    minRange = valueData["minRange"]
    maxRange = valueData["maxRange"]
    value = valueData["value"]
    defaultValue = valueData["default"]

    xInput.min_value = minRange.x
    xInput.max_value = maxRange.x
    xInput.rounded = isInt
    xInput.set_value_no_signal(value.x)
    
    yInput.min_value = minRange.y
    yInput.max_value = maxRange.y
    yInput.rounded = isInt
    yInput.set_value_no_signal(value.y)
    
    zInput.min_value = minRange.z
    zInput.max_value = maxRange.z
    zInput.rounded = isInt
    zInput.set_value_no_signal(value.z)

    if ("step" in valueData):
        xInput.step = valueData["step"]
        yInput.step = valueData["step"]
        zInput.step = valueData["step"]
    elif (isInt):
        xInput.step = 1
        yInput.step = 1
        zInput.step = 1

    CheckIsDefault(value)

    # Connect signals after all values are set setting min_value can clamp
    # the default (0) and fire value_changed, which triggers cascading callbacks.
    xInput.value_changed.connect(_on_x_input_value_changed)
    yInput.value_changed.connect(_on_y_input_value_changed)
    zInput.value_changed.connect(_on_z_input_value_changed)

func GetValueData():
    valueData["value"].x = xInput.value
    valueData["value"].y = yInput.value
    valueData["value"].z = zInput.value
    return valueData

func CheckIsDefault(checkValue: Vector3):
    hasChanged = defaultValue != checkValue
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE

func SetValue(newValue: Vector3) -> void:
    suppressNotify = true
    xInput.set_value_no_signal(newValue.x)
    yInput.set_value_no_signal(newValue.y)
    zInput.set_value_no_signal(newValue.z)
    CheckIsDefault(newValue)
    suppressNotify = false

func OnValueChanged(newValue: Vector3):
    if suppressNotify:
        return
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue, menu)

func _on_x_input_value_changed(newValue: float) -> void:
    var newVector = Vector3(newValue, yInput.value, zInput.value)
    CheckIsDefault(newVector)
    OnValueChanged(newVector)

func _on_y_input_value_changed(newValue: float) -> void:
    var newVector = Vector3(xInput.value, newValue, zInput.value)
    CheckIsDefault(newVector)
    OnValueChanged(newVector)
    
func _on_z_input_value_changed(newValue: float) -> void:
    var newVector = Vector3(xInput.value, yInput.value, newValue)
    CheckIsDefault(newVector)
    OnValueChanged(newVector)

func _on_default_button_pressed() -> void:
    value = defaultValue
    xInput.set_value_no_signal(value.x)
    yInput.set_value_no_signal(value.y)
    zInput.set_value_no_signal(value.z)
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
