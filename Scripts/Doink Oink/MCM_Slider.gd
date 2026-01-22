extends Node

@onready var nameLabel = find_child("Label")
@onready var slider = find_child("Slider")
@onready var sliderInput = find_child("Input")
@onready var defaultRevertButton = find_child("Default Button")

var valueId: String
var section: String
var valueData

var value
var defaultValue

var minRange: float
var maxRange: float
var isInt = false

var hasChanged = false

func _ready():	
	slider.value_changed.connect(_on_slider_value_changed)
	sliderInput.value_changed.connect(_on_input_value_changed)
	
	if !valueId:
		return
	
	nameLabel.text = valueData["name"]
	nameLabel.tooltip_text = valueData["tooltip"]
	
	minRange = valueData["minRange"]
	maxRange = valueData["maxRange"]
	value = valueData["value"]
	defaultValue = valueData["default"]
	
	sliderInput.value = value
	sliderInput.min_value = minRange
	sliderInput.max_value = maxRange
	sliderInput.rounded = isInt
	
	slider.value = value
	slider.min_value = minRange
	slider.max_value = maxRange	
	slider.rounded = isInt
	
	CheckHasChanged(value)
	
func GetValueData():
	valueData["value"] = sliderInput.value
	return valueData

func CheckHasChanged(checkValue):
	hasChanged = defaultValue != checkValue
	if hasChanged:
		defaultRevertButton.show()
	else:
		defaultRevertButton.hide()

func _on_slider_value_changed(newValue: float) -> void:
	sliderInput.value = newValue
	CheckHasChanged(newValue)

func _on_input_value_changed(newValue: float) -> void:
	slider.value = newValue
	CheckHasChanged(newValue)

func _on_default_button_pressed() -> void:
	value = defaultValue
	sliderInput.value = value
	slider.value = value
	defaultRevertButton.hide()
