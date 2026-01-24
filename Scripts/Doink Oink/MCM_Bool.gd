extends Node

@onready var nameLabel : Label = find_child("Label")
@onready var off : Button = find_child("Off")
@onready var on : Button = find_child("On")
@onready var defaultRevertButton : Button = find_child("Default Button")

var valueId: String
var section: String
var valueData

var value = true
var defaultValue: bool

var hasChanged = false

func _ready():
	if !valueId:
		return
	
	nameLabel.text = valueData["name"]
	nameLabel.tooltip_text = valueData["tooltip"]
	
	value = valueData["value"]
	defaultValue = valueData["default"]
	
	off.pressed.connect(_on_off_pressed)
	on.pressed.connect(_on_on_pressed)
	
	on.button_pressed = value
	off.button_pressed = !value
	
	CheckHasChanged(value)
			
func GetValueData():
	valueData["value"] = value
	return valueData

func _on_off_pressed() -> void:
	value = false
	on.button_pressed = false
	
	CheckHasChanged(value)

func _on_on_pressed() -> void:
	value = true
	off.button_pressed = false
	
	CheckHasChanged(value)

func CheckHasChanged(checkValue):
	hasChanged = defaultValue != checkValue
	defaultRevertButton.disabled = !hasChanged
	defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE

func _on_default_button_pressed() -> void:
	value = defaultValue
	on.button_pressed = value
	off.button_pressed = !value
	CheckHasChanged(value)
