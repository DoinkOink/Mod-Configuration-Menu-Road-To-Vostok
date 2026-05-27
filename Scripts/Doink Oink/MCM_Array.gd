extends Node
class_name MCM_Array_Value

@onready var variableLabel : Label = find_child("Name Label")
@onready var countLabel : Label = find_child("Count Label")
@onready var itemContainer : HBoxContainer = find_child("Item Container")
@onready var panelDivider : Panel = find_child("Panel Divider")
@onready var valueContainer : VBoxContainer = find_child("Value Container")
@onready var expandButton : Button = find_child("Expand Button")
@onready var newItemButton : Button = find_child("New Item Button")
@onready var defaultRevertButton : Button = find_child("MCM_Revert_Button")

const deleteButtonElement = preload("res://ModConfigurationMenu/UI/Elements/MCM_Array_Delete_Button.tscn")
const elementSeparatorScene = preload("res://ModConfigurationMenu/UI/Elements/MCM_Array_Entry_Separator.tscn")
const expandButtonIcon = preload("res://ModConfigurationMenu/UI/Sprites/Icons/Icon_Keyboard_Arrow_Down.svg")
const collapseButtonIcon = preload("res://ModConfigurationMenu/UI/Sprites/Icons/Icon_Keyboard_Arrow_Up.svg")

var valueId: String
var section: String
var valueData
var menu: MCMMenu
var callbackObject: Object

var value: Array
var defaultValue: Array
var arrayType: String
var defaultItemValue
var elementArray: Array

var hasChanged = false

func _ready():	
    if !valueId:
        return
        
    arrayType = valueData["arrayType"]
    defaultItemValue = valueData["defaultItemValue"]
        
    variableLabel.text = valueData["name"]
    variableLabel.tooltip_text = valueData["tooltip"]
    
    value = valueData["value"]
    defaultValue = valueData["default"]
    
    ResetLayout()

    CreateElementsFromValue()
    
    CheckIsDefault(value)
    UpdateAddItemButton()
    UpdateCountLabel()

func ResetLayout() -> void:
    itemContainer.visible = false
    panelDivider.visible = false
    expandButton.icon = expandButtonIcon
    expandButton.text = "Expand"
    expandButton.tooltip_text = "Expand array list"

    for child in valueContainer.get_children().duplicate():
        if not child is Button:
            child.queue_free()

func GetValueData():
    valueData["value"] = value
    return valueData
    
func CheckIsDefault(checkValue):
    hasChanged = defaultValue != checkValue
    defaultRevertButton.disabled = !hasChanged
    defaultRevertButton.modulate = Color.TRANSPARENT if defaultRevertButton.disabled else Color.WHITE
    
func SetValue(newValue) -> void:
    if("maxItems" in valueData):
        if(newValue.size() > valueData["maxItems"]):
            push_warning("[MCM] " + menu.loadedModId + " tried adding too many items to the " + valueId + " Array.")
            return
            
    value = newValue
    CreateElementsFromValue()
    CheckIsDefault(value)
    UpdateAddItemButton()
    UpdateCountLabel()

func OnValueChanged(newValue):
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue, menu)
        
func CreateElementsFromValue():
    if("maxItems" in valueData):
        if(value.size() > valueData["maxItems"]):
            push_warning("[MCM] There were too many items being added to " + menu.loadedModId + " " + valueId + " Array. Reverting to default.")
            value = defaultValue
            
    if(!elementArray.is_empty()):
        for _element in elementArray:
            valueContainer.remove_child(_element)
            _element.queue_free()
            
        elementArray.clear()
    
    for _index in value.size():
        CreateNewElement(value[_index], _index)
    
func CreateNewElement(valueToAdd, index):
    if("maxItems" in valueData):
        if (index+1 > valueData["maxItems"]):
            return
    
    var _element = menu.availableElements.get(arrayType).instantiate()
    var _deleteButtonElement = deleteButtonElement.instantiate()
    _deleteButtonElement.tooltip_text = "Delete entry"
    
    _deleteButtonElement.arrayIndex = index
    _deleteButtonElement.arrayCallback = self
    
    _element.valueId = str(index)
    _element.valueData = {
        "name": str(index),
        "tooltip": "",
        "value": valueToAdd,
        "default": defaultItemValue,
        "on_value_changed": "_on_list_item_updated",
        "deleteButton": _deleteButtonElement,
        
        "minRange": 0 if !valueData.has("minRange") else valueData["minRange"],
        "maxRange": 0 if !valueData.has("maxRange") else valueData["maxRange"],
        "step": 1 if !valueData.has("step") else valueData["step"]
    }
    _element.menu = menu
    _element.callbackObject = self
    _element.find_child("Input Container").add_sibling(_deleteButtonElement)

    AddElementSeparator(_element)
    
    elementArray.append(_element)
    
    var _childCount = valueContainer.get_child_count()
    valueContainer.add_child(_element)
    valueContainer.move_child(_element, _childCount-1)

func AddElementSeparator(element) -> void:
    var separator: HSeparator = elementSeparatorScene.instantiate()
    element.add_child(separator)
    
func DeleteItem(index):
    value.pop_at(index)
    var _removedElement: Node = elementArray.pop_at(index)
    
    valueContainer.remove_child(_removedElement)
    _removedElement.queue_free()
    
    for _elementIndex in elementArray.size():
        var _element: Node = elementArray[_elementIndex]
        _element.valueData["deleteButton"].arrayIndex = _elementIndex
        _element.valueId = str(_elementIndex)
        _element.valueData["name"] = str(_elementIndex)
        _element.UpdateNameLabel()
        
    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()
    
func UpdateAddItemButton():
    if("maxItems" in valueData):
        newItemButton.disabled = value.size() >= valueData["maxItems"]
        
func UpdateCountLabel():
    countLabel.text = "Size: " + str(value.size())
    if ("maxItems" in valueData):
        countLabel.text += "/" + str(valueData["maxItems"])

func _on_revert_button_pressed() -> void:
    value = defaultValue
    CreateElementsFromValue()
    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()
    menu.PlayClick()

func _on_expand_button_pressed() -> void:
    itemContainer.visible = !itemContainer.visible
    panelDivider.visible = itemContainer.visible
    expandButton.icon = collapseButtonIcon if itemContainer.visible else expandButtonIcon
    expandButton.text = "Collapse" if itemContainer.visible else "Expand"
    expandButton.tooltip_text = "Collapse array list" if itemContainer.visible else "Expand array list"
    menu.PlayClick()

func _on_new_item_button_pressed() -> void:
    value.append(defaultItemValue)
    CreateNewElement(defaultItemValue, value.size()-1)
    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()
    menu.PlayClick()
    
func _on_list_item_updated(updatedValueId, newValue, _menu):
    value[int(updatedValueId)] = newValue
    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()
