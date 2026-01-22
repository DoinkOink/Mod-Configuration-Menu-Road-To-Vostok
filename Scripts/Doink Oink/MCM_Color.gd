extends Node

@onready var nameLabel = find_child("Label")
@onready var slider = find_child("Slider")
@onready var colorPicker = find_child("ColorPicker")
@onready var defaultRevertButton = find_child("Default Button")

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

func CheckHasChanged(_value):
	hasChanged = defaultValue != _value
	if hasChanged:
		defaultRevertButton.show()
	else:
		defaultRevertButton.hide()

func _on_color_picker_color_changed(color: Color) -> void:
	value = color
	CheckHasChanged(value)

func _on_default_button_pressed() -> void:
	value = defaultValue
	colorPicker.color = value
	defaultRevertButton.hide()
