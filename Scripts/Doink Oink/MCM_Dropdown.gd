extends Node

@onready var variableLabel = find_child("Label")
@onready var dropdown : OptionButton = find_child("Dropdown")
@onready var defaultRevertButton = find_child("Default Button")

var valueId: String
var section: String
var valueData

var value: int
var defaultValue: int

var options

var hasChanged = false

func _ready():
	if !valueId:
		return
		
	variableLabel.text = valueData["name"]
	variableLabel.tooltip_text = valueData["tooltip"]
	
	value = valueData["value"]
	defaultValue = valueData["default"]
	
	options = valueData["options"]
	for _option in options:
		dropdown.add_item(_option)
	
	dropdown.selected = value
	
	CheckHasChanged(value)
	
func GetValueData():
	valueData["value"] = value
	return valueData
	
func CheckHasChanged(checkValue):
	hasChanged = defaultValue != checkValue
	if hasChanged:
		defaultRevertButton.show()
	else:
		defaultRevertButton.hide()

func _on_input_text_submitted(newValue):
	value = newValue
	CheckHasChanged(value)

func _on_default_button_pressed() -> void:
	value = defaultValue
	dropdown.selected = value
	defaultRevertButton.hide()

func _on_dropdown_item_selected(index: int) -> void:
	value = index
	CheckHasChanged(value)
