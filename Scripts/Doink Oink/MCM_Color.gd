extends Node

@onready var nameLabel : Label = find_child("Name Label")
@onready var colorPicker : ColorPickerButton = find_child("ColorPicker")
@onready var defaultRevertButton : Button = find_child("MCM_Revert_Button")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value : Color = Color.WHITE
var defaultValue : Color = Color.WHITE

var hasChanged = false

func _ready():
    if !valueId:
        return
    
    nameLabel.text = valueData["name"]
    nameLabel.tooltip_text = valueData["tooltip"]
    
    value = valueData["value"]
    defaultValue = valueData["default"]
    
    colorPicker.color = value
    
    if (valueData.has("allowAlpha")):
        colorPicker.edit_alpha = valueData["allowAlpha"]
    
    CheckIsDefault(value)
    
func GetValueData():
    valueData["value"] = colorPicker.color
    return valueData

func CheckIsDefault(checkValue):
    hasChanged = defaultValue != checkValue
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE
    
func SetValue(newValue) -> void:
    value = newValue
    colorPicker.color = value
    CheckIsDefault(value)

func OnValueChanged(newValue):
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue, menu)
        
func UpdateNameLabel():
    nameLabel.text = valueData["name"]

func _on_color_picker_color_changed(color: Color) -> void:
    value = color
    CheckIsDefault(value)
    OnValueChanged(value)

func _on_revert_button_pressed() -> void:
    value = defaultValue
    colorPicker.color = value
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
