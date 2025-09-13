extends "res://Scripts/Inputs.gd"

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

func _ready():
	super ()

	MCMHelpers.LoadInputs()
