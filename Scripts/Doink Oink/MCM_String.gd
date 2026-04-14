extends Node

@onready var variableLabel : Label = find_child("Label")
@onready var textInput : LineEdit = find_child("Input")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value: String
var defaultValue: String

var hasChanged = false

func _ready():	
    if !valueId:
        return
        
    variableLabel.text = valueData["name"]
    variableLabel.tooltip_text = valueData["tooltip"]
    
    value = valueData["value"]
    defaultValue = valueData["default"]
    
    textInput.text = value
    textInput.text_changed.connect(_on_input_text_submitted)
    
    CheckIsDefault(value)
    
func GetValueData():
    valueData["value"] = value
    return valueData
    
func CheckIsDefault(checkValue):
    hasChanged = defaultValue != checkValue
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE
    
func SetValue(newValue) -> void:
    value = newValue
    textInput.text = value
    CheckIsDefault(value)

func OnValueChanged(newValue):
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue, menu)

func _on_input_text_submitted(newValue):
    value = newValue
    CheckIsDefault(value)
    OnValueChanged(value)

func _on_default_button_pressed() -> void:
    value = defaultValue
    textInput.text = value
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
