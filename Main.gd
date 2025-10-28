extends Node

var mcmMenuScene = preload("res://ModConfigurationMenu/UI/Doink Oink/UI_MCM.tscn")
var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

# In order to not override Settings.gd, which can only be overridden once, we create
#	the button and menu in our main file and store all associated variables in MCM_Helpers.
#	Between each scene the MCMButton is set to be freed so we can just check if
#	it currently exists. If it doesn't then we go ahead and create it again.
func _process(delta):
	if !MCMHelpers.MCMButton && get_tree().current_scene:
		CreateMCMButton()

func _ready():
	name = "MCM"
	
	var _dir = DirAccess.open("user://MCM")
	if !_dir:
		DirAccess.open("user://").make_dir("user://MCM")
	
	overrideScript("res://ModConfigurationMenu/Scripts/Overrides/Inputs.gd")
	overrideScript("res://ModConfigurationMenu/Scripts/Overrides/UIManager.gd")
	overrideScript("res://ModConfigurationMenu/Scripts/Overrides/Menu.gd")
	
func overrideScript(overrideScriptPath: String):
	var script: Script = load(overrideScriptPath)
	script.reload()
	var parentScript = script.get_base_script()
	script.take_over_path(parentScript.resource_path)
	
func CreateMCMButton():
	# Even though the menu travels between each scene the menu for whatever reason
	#	loses all inputs and buttons can't be pressed. So we have to free the menu
	#	and then instantiate it again.
	if MCMHelpers.MCMMenu:
		MCMHelpers.MCMMenu.queue_free()
		
	var _sceneName = get_tree().current_scene.name
	
	var _settings = get_tree().root.find_child("UI_Settings", true, false)
	if (_settings):
		MCMHelpers.SettingsMenu = _settings
	else:
		MCMHelpers.SettingsMenu = get_tree().root.find_child("Settings", true, false)#.get_child(1)
	
	# Just incase the settings menu wasn't found break out so we don't cause any issues.
	if (!MCMHelpers.SettingsMenu):
		return
		
	MCMHelpers.MCMMenu = mcmMenuScene.instantiate()
	MCMHelpers.MCMMenu.uiManager = self
	MCMHelpers.MCMMenu.hide()
	
	if _sceneName == "Menu":
		MCMHelpers.SettingsMenu.get_parent().visibility_changed.connect(_on_settings_visibility_changed)
		get_tree().root.add_child(MCMHelpers.MCMMenu)
	else:
		MCMHelpers.SettingsMenu.get_parent().add_child(MCMHelpers.MCMMenu)

	var _button = Button.new()
	_button.text = "MCM"

	var _buttonSize = _button.get_minimum_size() + Vector2(5, 5)
	_button.size.x = _buttonSize.x
	_button.size.y = _buttonSize.x

	if _sceneName == "Menu":
		var _size = DisplayServer.screen_get_size()
		#MCMHelpers.SettingsMenu.get_parent().size = _size
		#MCMHelpers.SettingsMenu.get_parent().set_global_position(Vector2(0, 0))
		#MCMHelpers.SettingsMenu.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
		#_button.set_global_position(Vector2((_size.x/2)-_buttonSize.x-10, -(_size.y/2)+10))
		#_button.set_global_position(Vector2(540,10))
	#else:
	_button.set_anchor(SIDE_LEFT, 1)
	_button.set_anchor(SIDE_TOP, 0)
	_button.set_anchor(SIDE_RIGHT, 1)
	_button.set_anchor(SIDE_BOTTOM, 0)
	
	_button.set_position(Vector2(- (_buttonSize.x + 10), 10))
	
	MCMHelpers.MCMButton = _button
	
	if _sceneName == "Menu":
		MCMHelpers.MCMButton.visible = false
		MCMHelpers.SettingsMenu.get_parent().get_parent().add_child(MCMHelpers.MCMButton)
	else:
		MCMHelpers.SettingsMenu.add_child(MCMHelpers.MCMButton)

	MCMHelpers.MCMButton.button_down.connect(MCMHelpers.ToggleMCMMenu)

func _on_settings_visibility_changed():
	if MCMHelpers.SettingsMenu:
		MCMHelpers.MCMButton.visible = MCMHelpers.SettingsMenu.get_parent().visible
