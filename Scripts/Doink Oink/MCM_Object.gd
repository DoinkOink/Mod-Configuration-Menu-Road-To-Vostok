extends Node

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

var value: Dictionary
var defaultValue: Dictionary
var valueType: String
var defaultItemValue
var elements: Dictionary

var hasChanged = false
var isArray = true

func _ready():	
    if !valueId:
        return
        
    valueType = valueData["valueType"]
    defaultItemValue = valueData["defaultItemValue"]
        
    variableLabel.text = valueData["name"]
    variableLabel.tooltip_text = valueData["tooltip"]
    
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
        if(isArray):
            _callable.call(valueId, newValue.values(), menu)
        else:
            _callable.call(valueId, newValue, menu)
        
func CreateElementsFromValue():
    if("maxItems" in valueData):
        if(value.size() > valueData["maxItems"]):
            push_warning("[MCM] There were too many items being added to " + menu.loadedModId + " " + valueId + " Array. Reverting to default.")
            value = defaultValue
            
    if(!elements.is_empty()):
        for _element in elements:
            valueContainer.remove_child(_element)
            _element.queue_free()
            
        elements.clear()
    
    var _keys = value.keys()
    for _index in value.size():
        var _key = _keys[_index]
        CreateNewElement(value[_key], _key, _index)
    
func CreateNewElement(valueToAdd, size, key):
    if("maxItems" in valueData):
        if (size+1 > valueData["maxItems"]):
            return
    
    var _element = menu.availableElements.get(valueType).instantiate()
    var _deleteButtonElement = deleteButtonElement.instantiate()
    
    _deleteButtonElement.valueKey = key
    _deleteButtonElement.arrayCallback = self
    
    _element.valueId = key
    _element.valueData = {
        "name": key,
        "tooltip": "",
        "value": valueToAdd[key],
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
    
    elements[key] = _element
    
    var _childCount = valueContainer.get_child_count()
    valueContainer.add_child(_element)
    valueContainer.move_child(_element, _childCount-1)

func AddElementSeparator(element) -> void:
    var separator: MarginContainer = elementSeparatorScene.instantiate()
    element.add_child(separator)
    
func DeleteItem(key):
    value.erase(key)
    var _removedElement: Node = elements[key]
    
    valueContainer.remove_child(_removedElement)
    _removedElement.queue_free()
    
    if(isArray):
        var _tempValues = {}
        var _tempElements = {}
        
        for _index in value.size():
            var _oldKey = value.keys()[_index]
            _tempValues[str(_index)] = value[_oldKey]
            _tempElements[str(_index)] = elements[_oldKey]
        
        for _elementIndex in _tempElements.size():
            var _element: Node = _tempElements[_elementIndex]
            _element.valueData["deleteButton"].arrayIndex = _elementIndex
            _element.valueId = str(_elementIndex)
            _element.valueData["name"] = str(_elementIndex)
            _element.UpdateNameLabel()
            
        elements.clear()
        value.clear()
        
        elements = _tempElements.duplicate()
        value = _tempValues.duplicate()
        
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
        
func AddItemToValue(valueToAdd, key = ""):
    if(key.is_empty()):
        key = "" if isArray else "Value Key "
        key += str(value.size()-1)
        
        if(!isArray):
            var _duplicateRecord = 1
            var _origKey = key
            while(value.has(key)):
                key = _origKey + "(" + str(_duplicateRecord) + ")"
                _duplicateRecord += 1
        
    value[key] = valueToAdd
    return key

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
    var _key = AddItemToValue(defaultItemValue)
    CreateNewElement(defaultItemValue, value.size(), _key)
    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()
    menu.PlayClick()
    
func _on_list_item_updated(updatedValueId, newValue, _menu):
    value[updatedValueId] = newValue
    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()
