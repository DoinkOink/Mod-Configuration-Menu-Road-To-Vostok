extends Node
class_name MCM_Header

@onready var headerLabel: Label = find_child("Header_Label")

var headerText: String

func _ready():
    headerLabel.text = headerText
