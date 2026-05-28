extends Node

@onready var inputField : LineEdit = find_child("Key Input")
@onready var errorIcon : TextureRect = find_child("Error Icon")

var valueKey: String
var previousKey: String
var callback

func _ready():
    inputField.text = valueKey
    previousKey = valueKey
    
func UpdateInputKey(newKey):
    if (newKey == valueKey):
        return
    
    if(callback.CheckHasKey(newKey)):
        inputField.text = valueKey
        errorIcon.visible = true
        return
        
    errorIcon.visible = false
    callback.ValueKeyChanged(valueKey, newKey)
    valueKey = newKey

func _on_key_input_text_submitted(newKey: String) -> void:
    UpdateInputKey(newKey)

func _on_key_input_focus_exited() -> void:
    UpdateInputKey(inputField.text)
