extends Node

@onready var nameLabel : Label = find_child("Name Label")
@onready var textInput : LineEdit = find_child("Input")
@onready var defaultRevertButton : Button = find_child("MCM_Revert_Button")

var valueId: String
var section: String
var valueData
var menu: MCM_Menu
var callbackObject: Object

var value: String = ""
var defaultValue: String = ""

var hasChanged = false

func _ready():	
    if !valueId:
        return
        
    nameLabel.text = valueData["name"]
    nameLabel.tooltip_text = valueData["tooltip"]
    
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
        
func UpdateNameLabel():
    nameLabel.text = valueData["name"]

func _on_input_text_submitted(newValue):
    value = newValue
    CheckIsDefault(value)
    OnValueChanged(value)

func _on_revert_button_pressed() -> void:
    value = defaultValue
    textInput.text = value
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
