extends Node

var valueKey
var callback

func _on_delete_button_pressed() -> void:
    callback.menu.PlayClick()
    callback.DeleteItem(valueKey)
