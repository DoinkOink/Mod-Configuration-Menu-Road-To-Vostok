extends Node

var arrayIndex: int
var arrayCallback: MCM_Array_Value


func _on_delete_button_pressed() -> void:
    arrayCallback.menu.PlayClick()
    arrayCallback.DeleteItem(arrayIndex)
