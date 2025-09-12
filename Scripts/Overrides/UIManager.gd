extends "res://Scripts/UIManager.gd"

var mcmMenuScene = preload("res://ModConfigurationMenu/UI/Doink Oink/UI_MCM.tscn")
var mcmMenu: Control = null

func ToggleMCMMenu():
	if !mcmMenu.visible:
		gameData.settings = false
		settings.hide()
		mcmMenu.show()
	else:
		gameData.settings = true
		settings.show()
		mcmMenu.hide()

func _ready():
	super ()

	mcmMenu = mcmMenuScene.instantiate()
	mcmMenu.uiManager = self
	mcmMenu.hide()
	get_tree().root.add_child(mcmMenu)

func _input(event):
	if mcmMenu.visible:
		if event.is_action_pressed("settings") && !mcmMenu.isRemapping:
			ToggleMCMMenu()

		return

	super (event)
