extends "res://Scripts/Menu.gd"

var mcmMenuScene = preload("res://ModConfigurationMenu/UI/Doink Oink/UI_MCM.tscn")
var mcmMenu: Control = null

func ToggleMCMMenu():
	if mcmMenu == null:
		mcmMenu = mcmMenuScene.instantiate()
		mcmMenu.uiManager = self
		mcmMenu.hide()
		get_tree().root.add_child(mcmMenu)
		
	if mcmMenu.visible:
		settings.show()
		mcmMenu.hide()
	else:
		settings.hide()
		mcmMenu.show()
		
	PlayClick()
