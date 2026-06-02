extends Node

@onready var nameLabel : Label = find_child("Name Label")
@onready var keycodeInput : Button = find_child("Input")
@onready var defaultRevertButton : Button = find_child("MCM_Revert_Button")

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

var valueId: String
var section: String
var valueData
var menu: MCM_Menu
var callbackObject: Object

var value: InputEvent
var defaultValue

var hasChanged = false
var isRemapping = false

func _ready():
    keycodeInput.pressed.connect(_on_keycode_pressed)
    
    if !valueId:
        return
    
    nameLabel.text = valueData["name"]
    nameLabel.tooltip_text = valueData["tooltip"]
    
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
    
    value.alt_pressed = valueData["altPressed"]
    value.ctrl_pressed = valueData["controlPressed"]
    value.meta_pressed = valueData["metaPressed"]
    value.shift_pressed = valueData["shiftPressed"]
    
    keycodeInput.text = value.as_text().trim_suffix(" (Physical)")
    keycodeInput.text = value.as_text().trim_suffix(" - Physical")
    
    CheckIsDefault(value)
    
func _input(event):
    if isRemapping:
        if event.is_released():
            if event is InputEventKey || (event is InputEventMouseButton):
                if event is InputEventMouseMotion && event.double_click:
                    event.double_click = false
                    
                if (event is InputEventKey):            
                    keycodeInput.text = event.as_text().trim_suffix(" (Physical)")
                    keycodeInput.text = event.as_text().trim_suffix(" - Physical")
                    valueData["type"] = "Key"
                elif (event is InputEventMouseButton):
                    keycodeInput.text = GetMouseButtonText(event)
                    valueData["type"] = "Mouse"
                    
                value = event
                
                valueData["altPressed"] = event.alt_pressed
                valueData["controlPressed"] = event.ctrl_pressed
                valueData["metaPressed"] = event.meta_pressed
                valueData["shiftPressed"] = event.shift_pressed
                
                CheckIsDefault(value)
                OnValueChanged(value)
                
                Input.mouse_mode = Input.MOUSE_MODE_CONFINED
                isRemapping = false
    elif MCMHelpers.MCMMenu && MCMHelpers.MCMMenu.visible:
        MCMHelpers.isRemapping = false
            
func GetValueData():
    if (value is InputEventMouseButton):
        valueData["value"] = value.button_index
    else:
        valueData["value"] = value.physical_keycode
        
    return valueData
    
func GetMouseButtonText(event: InputEventWithModifiers):
    var _text = ""
    
    #if(event.ctrl_pressed):
        #_text = _text + "Ctrl+"
    _text = (_text + "Ctrl+") if event.ctrl_pressed else _text
    _text = (_text + "Alt+") if event.alt_pressed else _text
    _text = (_text + "Shift+") if event.shift_pressed else _text
    _text = (_text + "Meta+") if event.meta_pressed else _text
    
    match event.button_index:
        MOUSE_BUTTON_LEFT:
                _text = _text + "Left Mouse Button"
        MOUSE_BUTTON_RIGHT:
                _text = _text + "Right Mouse Button"
        MOUSE_BUTTON_MIDDLE:
                _text = _text + "Middle Mouse Button"
        MOUSE_BUTTON_WHEEL_DOWN:
                _text = _text + "Mouse Wheel Down"
        MOUSE_BUTTON_WHEEL_UP:
                _text = _text + "Mouse Wheel Up"
        MOUSE_BUTTON_XBUTTON1:
                _text = _text + "Mouse Button 1"
        MOUSE_BUTTON_XBUTTON2:
                _text = _text + "Mouse Button 2"
        _:
            _text = _text + "Mouse " + event.button_index
            
    return _text

func CheckIsDefault(checkValue):
    if (valueData["type"] == "Mouse"):
        hasChanged = defaultValue != checkValue.button_index || valueData["default_type"] != valueData["type"]
    else:
        hasChanged = defaultValue != checkValue.physical_keycode || valueData["default_type"] != valueData["type"]
        
    if("default_modifiers" in valueData):
        if(valueData["default_modifiers"]["alt"] != checkValue.alt_pressed): hasChanged = true
        if(valueData["default_modifiers"]["control"] != checkValue.ctrl_pressed): hasChanged = true
        if(valueData["default_modifiers"]["meta"] != checkValue.meta_pressed): hasChanged = true
        if(valueData["default_modifiers"]["shift"] != checkValue.shift_pressed): hasChanged = true
        
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE
    
func SetValue(newValue) -> void:
    if valueData["type"] == "Mouse":
        value = InputEventMouseButton.new()
        value.button_index = newValue
        keycodeInput.text = GetMouseButtonText(newValue)
    else:
        value = InputEventKey.new()
        value.physical_keycode = newValue
        keycodeInput.text = value.as_text().trim_suffix(" (Physical)")
        keycodeInput.text = value.as_text().trim_suffix(" - Physical")
    CheckIsDefault(value)

func OnValueChanged(newValue):
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue, menu)
        
func UpdateNameLabel():
    nameLabel.text = valueData["name"]

func _on_keycode_pressed():
    if !isRemapping:
        isRemapping = true
        MCMHelpers.isRemapping = true
        keycodeInput.text = "Press key to bind..."
        Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
        menu.PlayClick()

func _on_revert_button_pressed() -> void:
    if (valueData["default_type"] == "Mouse"):
        value = InputEventMouseButton.new()
        value.button_index = defaultValue
        GetMouseButtonText(defaultValue)
    else:
        value = InputEventKey.new()
        value.physical_keycode = defaultValue
        
    valueData["type"] = valueData["default_type"]
    
    if("default_modifiers" in valueData):
        value.alt_pressed = valueData["default_modifiers"]["alt"]
        value.ctrl_pressed = valueData["default_modifiers"]["control"]
        value.meta_pressed = valueData["default_modifiers"]["meta"]
        value.shift_pressed = valueData["default_modifiers"]["shift"]
        
        valueData["altPressed"] = valueData["default_modifiers"]["alt"]
        valueData["controlPressed"] = valueData["default_modifiers"]["control"]
        valueData["metaPressed"] = valueData["default_modifiers"]["meta"]
        valueData["shiftPressed"] = valueData["default_modifiers"]["shift"]
        
    keycodeInput.text = value.as_text().trim_suffix(" (Physical)")
    keycodeInput.text = value.as_text().trim_suffix(" - Physical")
    
    CheckIsDefault(value)
    OnValueChanged(value)
    menu.PlayClick()
