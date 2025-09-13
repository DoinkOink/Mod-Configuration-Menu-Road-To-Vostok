extends Node

@onready var variableLabel = find_child("Label")
@onready var keycodeInput = find_child("Input")
@onready var defaultRevertButton = find_child("Default Button")

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

var valueId: String
var section: String
var valueData

var value: InputEvent
var defaultValue

var hasChanged = false
var isRemapping = false

func _ready():
	keycodeInput.pressed.connect(_on_keycode_pressed)
	
	if !valueId:
		return
	
	variableLabel.text = valueData["name"]
	
	value = InputEventKey.new()
	value.physical_keycode = valueData["value"]
	
	defaultValue = valueData["default"]
	
	keycodeInput.text = value.as_text().trim_suffix(" (Physical)")
	
	CheckHasChanged(value)
	
func _input(event):
	if isRemapping:
		if event is InputEventKey || (event is InputEventMouseButton && event.pressed):
			if event is InputEventMouseMotion && event.double_click:
				event.double_click = false
				
			keycodeInput.text = event.as_text().trim_suffix(" (Physical)")
			value = event
			
			CheckHasChanged(value)
			
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED
			isRemapping = false
	elif MCMHelpers.MCMMenu && MCMHelpers.MCMMenu.visible:
		MCMHelpers.isRemapping = false
			
func GetValueData():
	valueData["value"] = value.physical_keycode
	return valueData

func CheckHasChanged(_value):
	hasChanged = defaultValue != _value.physical_keycode
	if hasChanged:
		defaultRevertButton.show()
	else:
		defaultRevertButton.hide()

func _on_keycode_pressed():
	if !isRemapping:
		isRemapping = true
		MCMHelpers.isRemapping = true
		keycodeInput.text = "Press key to bind..."
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_default_button_pressed() -> void:
	value = InputEventKey.new()
	value.physical_keycode = defaultValue
	
	keycodeInput.text = value.as_text().trim_suffix(" (Physical)")
	defaultRevertButton.hide()
