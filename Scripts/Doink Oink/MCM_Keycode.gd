extends Node

@onready var variableLabel : Label = find_child("Label")
@onready var keycodeInput : Button = find_child("Input")
@onready var defaultRevertButton : Button = find_child("Default Button")

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value: InputEvent
var defaultValue

var hasChanged = false
var isRemapping = false

func _ready():
    keycodeInput.pressed.connect(_on_keycode_pressed)
    
    if !valueId:
        return
    
    variableLabel.text = valueData["name"]
    variableLabel.tooltip_text = valueData["tooltip"]
    
    if ("type" not in valueData):
        valueData["type"] = "Key"    
    if ("default_type" not in valueData):
        valueData["default_type"] = "Key"
    
    if (valueData["type"] == "Mouse"):
        value = InputEventMouseButton.new()
        value.button_index = valueData["value"]
    else:
        value = InputEventKey.new()
        value.physical_keycode = valueData["value"]
    
    defaultValue = valueData["default"]
    
    keycodeInput.text = value.as_text().trim_suffix(" (Physical)")
    
    CheckIsDefault(value)
    
func _input(event):
    if isRemapping:
        if event is InputEventKey || (event is InputEventMouseButton && event.pressed):
            if event is InputEventMouseMotion && event.double_click:
                event.double_click = false
                
            if (event is InputEventKey):            
                keycodeInput.text = event.as_text().trim_suffix(" (Physical)")
                valueData["type"] = "Key"
            elif (event is InputEventMouseButton):
                keycodeInput.text = GetMouseButtonText(event.button_index)
                valueData["type"] = "Mouse"
                
            value = event
            
            CheckIsDefault(value)
            OnValueChanged(value)
            
            Input.mouse_mode = Input.MOUSE_MODE_CONFINED
            isRemapping = false
    elif MCMHelpers.MCM_Menu && MCMHelpers.MCM_Menu.visible:
        MCMHelpers.isRemapping = false
            
func GetValueData():
    if (value is InputEventMouseButton):
        valueData["value"] = value.button_index
    else:
        valueData["value"] = value.physical_keycode
        
    return valueData
    
func GetMouseButtonText(buttonIndex):
    match buttonIndex:
        MOUSE_BUTTON_LEFT:
                return "Left Mouse Button"
        MOUSE_BUTTON_RIGHT:
                return "Right Mouse Button"
        MOUSE_BUTTON_MIDDLE:
                return "Middle Mouse Button"
        MOUSE_BUTTON_WHEEL_DOWN:
                return "Mouse Wheel Down"
        MOUSE_BUTTON_WHEEL_UP:
                return "Mouse Wheel Up"
        MOUSE_BUTTON_XBUTTON1:
                return "Mouse Button 1"
        MOUSE_BUTTON_XBUTTON2:
                return "Mouse Button 2"
        _:
            return "Mouse " + buttonIndex

func CheckIsDefault(checkValue):
    if (valueData["type"] == "Mouse"):
        hasChanged = defaultValue != checkValue.button_index || valueData["default_type"] != valueData["type"]
    else:
        hasChanged = defaultValue != checkValue.physical_keycode || valueData["default_type"] != valueData["type"]
        
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE
    
func OnValueChanged(value):
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(value)

func _on_keycode_pressed():
    if !isRemapping:
        isRemapping = true
        MCMHelpers.isRemapping = true
        keycodeInput.text = "Press key to bind..."
        Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
        menu.PlayClick()

func _on_default_button_pressed() -> void:
    if (valueData["default_type"] == "Mouse"):
        value = InputEventMouseButton.new()
        value.button_index = defaultValue
        GetMouseButtonText(defaultValue)
    else:
        value = InputEventKey.new()
        value.physical_keycode = defaultValue
        keycodeInput.text = value.as_text().trim_suffix(" (Physical)")
        
    valueData["type"] = valueData["default_type"]
    
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
