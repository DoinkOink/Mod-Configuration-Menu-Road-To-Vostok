extends Node

@onready var nameLabel : Label = find_child("Label")
@onready var slider : HSlider = find_child("Slider")
@onready var sliderInput : SpinBox = find_child("Input")
@onready var defaultRevertButton : Button = find_child("Default Button")

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
		
	isInt = section == "Int"
	
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
	
	if (isInt):
		sliderInput.step = 1
		slider.step = 1
	
	CheckHasChanged(value)
	
func GetValueData():
	valueData["value"] = sliderInput.value
	return valueData

func CheckHasChanged(checkValue):
	hasChanged = defaultValue != checkValue
	defaultRevertButton.disabled = !hasChanged
	defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE

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
	CheckHasChanged(value)
