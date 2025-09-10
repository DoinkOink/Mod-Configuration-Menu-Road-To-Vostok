extends "res://Scripts/Inputs.gd"

var McmHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

func _ready():
	super ()

	McmHelpers.LoadInputs()
