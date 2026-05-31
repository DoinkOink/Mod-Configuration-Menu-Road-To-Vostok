extends PanelContainer

@onready var checkboxButton : CheckBox = find_child("CheckBox")
@onready var nameLabel : Label = find_child("ModNameLabel")

var isChecked : bool
var isModPresent : bool = true
var modFriendlyName : String
var exportMenu

func _ready() -> void:
    nameLabel.text = modFriendlyName
    isChecked = checkboxButton.button_pressed
    
    if(!isModPresent):
        checkboxButton.set_pressed_no_signal(false)
        checkboxButton.disabled = true
        isChecked = false
        
        var _disabledStylebox = StyleBoxFlat.new()
        _disabledStylebox.bg_color = Color("#611b1b7b")
        add_theme_stylebox_override("panel", _disabledStylebox)
    
    checkboxButton.tooltip_text = "Deselect Mod" if checkboxButton.button_pressed else "Select Mod"
    
func SetCheckBox(pressed):
    isChecked = pressed
    checkboxButton.set_pressed_no_signal(pressed)
    
    checkboxButton.tooltip_text = "Deselect Mod" if checkboxButton.button_pressed else "Select Mod"

func _on_check_box_pressed() -> void:
    isChecked = checkboxButton.button_pressed
    exportMenu.UpdateSelectAll()
    
    checkboxButton.tooltip_text = "Deselect Mod" if checkboxButton.button_pressed else "Select Mod"
