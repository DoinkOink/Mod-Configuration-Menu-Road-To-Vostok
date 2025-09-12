extends "res://Scripts/Settings.gd"

var MCMButton = Button.new()

func _ready():
	super ()

	MCMButton.text = "MCM"

	var _buttonSize = MCMButton.get_minimum_size() + Vector2(5, 5)
	MCMButton.size.x = _buttonSize.x
	MCMButton.size.y = _buttonSize.x

	MCMButton.set_anchor(SIDE_LEFT, 1)
	MCMButton.set_anchor(SIDE_TOP, 0)
	MCMButton.set_anchor(SIDE_RIGHT, 1)
	MCMButton.set_anchor(SIDE_BOTTOM, 0)
	
	if get_tree().current_scene && get_tree().current_scene.name == "Menu":
		var _size = DisplayServer.screen_get_size()
		MCMButton.set_position(Vector2((_size.x/2)-_buttonSize.x-10, -((_size.y/2)-(_buttonSize.x*2))))
	else:
		MCMButton.set_position(Vector2(- (_buttonSize.x + 10), 10))
		
	add_child(MCMButton)

	MCMButton.button_down.connect(_on_mcm_button_pressed)

func _on_mcm_button_pressed():
	var core_node = get_parent()
	
	if get_tree().current_scene && get_tree().current_scene.name == "Menu":
		core_node = core_node.get_parent()
		
	if core_node:
		core_node.ToggleMCMMenu()
