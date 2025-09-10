extends Node

@onready var variableLabel = find_child("Label")
@onready var textInput = find_child("Input")
@onready var defaultRevertButton = find_child("Default Button")

var valueId: String
var section: String
var valueData

var value: String
var defaultValue: String

var mcmMenu

var hasChanged = false

func _ready():	
	if !valueId:
		return
		
	variableLabel.text = valueData["name"]
	value = valueData["value"]
	defaultValue = valueData["default"]
	
	textInput.text = value
	textInput.text_changed.connect(_on_input_text_submitted)
	
	CheckHasChanged(value)
	
func GetValueData():
	valueData["value"] = value
	return valueData
	
func CheckHasChanged(_value):
	hasChanged = defaultValue != _value
	if hasChanged:
		defaultRevertButton.show()
	else:
		defaultRevertButton.hide()

func _on_input_text_submitted(new_text):
	value = new_text
	CheckHasChanged(value)

func _on_default_button_pressed() -> void:
	value = defaultValue
	textInput.text = value
	defaultRevertButton.hide()
