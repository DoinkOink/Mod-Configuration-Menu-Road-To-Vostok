class_name MCM_Category
extends MCM_Type
## The type that handles creation of a named header within the MCM Menu
##
## Internal Use Only. Do [b]not[/b] call this class directly.[br]
## Use [code]MCM_Config.CreateCategoryHeader()[/code] instead.

func _init(id: String, name: String) -> void:
    super("Category", id, name)
