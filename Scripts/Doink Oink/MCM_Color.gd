extends Node

@onready var nameLabel : Label = find_child("Label")
@onready var colorPicker : ColorPickerButton = find_child("ColorPicker")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData

var value : Color
var defaultValue : Color

var hasChanged = false

func _ready():
	if !valueId:
		return
	
	nameLabel.text = valueData["name"]
	nameLabel.tooltip_text = valueData["tooltip"]
	
	value = valueData["value"]
	defaultValue = valueData["default"]
	
	colorPicker.color = value
	
	CheckHasChanged(value)
	
func GetValueData():
	valueData["value"] = colorPicker.color
	return valueData

func CheckHasChanged(checkValue):
	hasChanged = defaultValue != checkValue
	defaultRevertButton.disabled = !hasChanged
	defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE

func _on_color_picker_color_changed(color: Color) -> void:
	value = color
	CheckHasChanged(value)

func _on_default_button_pressed() -> void:
	value = defaultValue
	colorPicker.color = value
	CheckHasChanged(value)
