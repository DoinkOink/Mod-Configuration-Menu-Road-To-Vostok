extends "res://Scripts/UIManager.gd"

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

func _input(event):
	if MCMHelpers.MCMMenu.visible:
		if event.is_action_pressed("settings") && !MCMHelpers.isRemapping:
			MCMHelpers.ToggleMCMMenu()

		return

	super (event)
