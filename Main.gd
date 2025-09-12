extends Node

var createButton = false
var MCMButton

var mcmMenuScene = preload("res://ModConfigurationMenu/UI/Doink Oink/UI_MCM.tscn")
var mcmMenu: Control = null
var settingsMenu

func _ready():
	name = "MCM"
	
	overrideScript("res://ModConfigurationMenu/Scripts/Overrides/Inputs.gd")
	overrideScript("res://ModConfigurationMenu/Scripts/Overrides/Settings.gd")
	overrideScript("res://ModConfigurationMenu/Scripts/Overrides/UIManager.gd")
	overrideScript("res://ModConfigurationMenu/Scripts/Overrides/Menu.gd")
	#queue_free()
	
	## We have to create the main menu button in the main script because overriding doesn't happen
	##	until after the main menu loads.
	CreateMCMButton()
	
func overrideScript(overrideScriptPath: String):
	var script: Script = load(overrideScriptPath)
	script.reload()
	var parentScript = script.get_base_script()
	script.take_over_path(parentScript.resource_path)
	
func CreateMCMButton():
	mcmMenu = mcmMenuScene.instantiate()
	mcmMenu.uiManager = self
	mcmMenu.hide()
	get_tree().root.add_child(mcmMenu)
		
	for _element in get_parent().get_children():
		if _element.name == "Menu":
			MCMButton = Button.new()
			settingsMenu = _element.find_child("Settings", false).find_child("UI_Settings")
			MCMButton.text = "MCM"

			var _buttonSize = MCMButton.get_minimum_size() + Vector2(5, 5)
			MCMButton.size.x = _buttonSize.x
			MCMButton.size.y = _buttonSize.x

			var _size = DisplayServer.screen_get_size()
			MCMButton.set_position(Vector2((_size.x/2)-_buttonSize.x-10, -((_size.y/2)-(_buttonSize.x*2))))
			settingsMenu.add_child(MCMButton)

			MCMButton.button_down.connect(ToggleMCMMenu)
			createButton = false
			break
			
func ToggleMCMMenu():
	if mcmMenu.visible:
		settingsMenu.show()
		mcmMenu.hide()
	else:
		settingsMenu.hide()
		mcmMenu.show()
