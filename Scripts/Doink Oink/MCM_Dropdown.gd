extends Node

@onready var variableLabel : Label = find_child("Label")
@onready var dropdown : OptionButton = find_child("Dropdown")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value: int
var defaultValue: int

var options

var hasChanged = false

func _ready():
    if !valueId:
        return
        
    variableLabel.text = valueData["name"]
    variableLabel.tooltip_text = valueData["tooltip"]
    
    var _tempOptions = valueData["options"]

    if (_tempOptions is Dictionary):
        value = _tempOptions.keys().find(valueData["value"])
        defaultValue = _tempOptions.keys().find(valueData["default"])
        options = _tempOptions.values()
    else:
        value = valueData["value"]
        defaultValue = valueData["default"]
        options = _tempOptions

    for _option in options:
        dropdown.add_item(_option)
    
    dropdown.selected = value
    
    CheckIsDefault(value)
    
func GetValueData():
    valueData["value"] = GetValue()    
    return valueData

func GetValue(tempValue = -1):
    if (tempValue == -1):
        tempValue = value

    if (valueData["options"] is Dictionary):
        tempValue = valueData["options"].keys()[tempValue]

    return tempValue
    
func CheckIsDefault(checkValue):
    hasChanged = defaultValue != checkValue
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE
    
func SetValue(newValue) -> void:
    value = newValue
    dropdown.selected = value
    CheckIsDefault(value)

func OnValueChanged(newValue):
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, GetValue(newValue), menu)

func _on_input_text_submitted(newValue):
    value = newValue
    CheckIsDefault(value)
    OnValueChanged(value)

func _on_default_button_pressed() -> void:
    value = defaultValue
    dropdown.selected = value
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()

func _on_dropdown_item_selected(index: int) -> void:
    value = index
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
