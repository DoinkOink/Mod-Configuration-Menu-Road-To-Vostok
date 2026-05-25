extends Node

@onready var nameLabel : Label = find_child("Label")
@onready var xInput : FormatSpinBox = find_child("InputX")
@onready var yInput : FormatSpinBox = find_child("InputY")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value: Vector2 = Vector2.ZERO
var defaultValue: Vector2 = Vector2.ZERO

var minRange: Vector2 = Vector2.ZERO
var maxRange: Vector2 = Vector2.ZERO
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

    if ("step" in valueData):
        xInput.step = valueData["step"]
        yInput.step = valueData["step"]
    elif (isInt):
        xInput.step = 1
        yInput.step = 1
        
    xInput.UpdatePrecision()
    yInput.UpdatePrecision()
    
    xInput.UpdateWidth()
    yInput.UpdateWidth()

    CheckIsDefault(value)

    # Connect signals after all values are set setting min_value can clamp
    # the default (0) and fire value_changed, which triggers cascading callbacks.
    xInput.value_changed.connect(_on_x_input_value_changed)
    yInput.value_changed.connect(_on_y_input_value_changed)

func GetValueData():
    valueData["value"].x = xInput.value
    valueData["value"].y = yInput.value
    return valueData

func CheckIsDefault(checkValue: Vector2):
    hasChanged = defaultValue != checkValue
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE

func SetValue(newValue: Vector2) -> void:
    suppressNotify = true
    
    xInput.set_value_no_signal(newValue.x)
    yInput.set_value_no_signal(newValue.y)
    
    xInput.UpdateWidth()
    yInput.UpdateWidth()
    
    CheckIsDefault(newValue)
    suppressNotify = false

func OnValueChanged(newValue: Vector2):
    if suppressNotify:
        return
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue, menu)
        
func UpdateNameLabel():
    nameLabel.text = valueData["name"]

func _on_x_input_value_changed(newValue: float) -> void:
    var newVector = Vector2(newValue, yInput.value)
    xInput.UpdateWidth()
    CheckIsDefault(newVector)
    OnValueChanged(newVector)

func _on_y_input_value_changed(newValue: float) -> void:
    var newVector = Vector2(xInput.value, newValue)
    yInput.UpdateWidth()
    CheckIsDefault(newVector)
    OnValueChanged(newVector)

func _on_default_button_pressed() -> void:
    value = defaultValue
    
    xInput.set_value_no_signal(value.x)
    yInput.set_value_no_signal(value.y)
    
    xInput.UpdateWidth()
    yInput.UpdateWidth()
    
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
