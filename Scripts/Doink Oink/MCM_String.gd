extends Node

@onready var variableLabel : Label = find_child("Label")
@onready var textInput : LineEdit = find_child("Input")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData

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
	
	CheckHasChanged(value)
	
func GetValueData():
	valueData["value"] = value
	return valueData
	
func CheckHasChanged(checkValue):
	hasChanged = defaultValue != checkValue
	defaultRevertButton.disabled = !hasChanged
	defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE

func _on_input_text_submitted(newValue):
	value = newValue
	CheckHasChanged(value)

func _on_default_button_pressed() -> void:
	value = defaultValue
	textInput.text = value
	CheckHasChanged(value)
