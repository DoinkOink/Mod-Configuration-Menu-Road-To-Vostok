extends Node

@onready var nameLabel : Label = find_child("Name Label")
@onready var countLabel : Label = find_child("Count Label")
@onready var itemContainer : HBoxContainer = find_child("Item Container")
@onready var panelDivider : Panel = find_child("Panel Divider")
@onready var valueContainer : VBoxContainer = find_child("Value Container")
@onready var expandButton : Button = find_child("Expand Button")
@onready var newItemButton : Button = find_child("New Item Button")
@onready var defaultRevertButton : Button = find_child("MCM_Revert_Button")
@onready var keyLabel : Label = find_child("KeyLabel")
@onready var valueLabel : Label = find_child("ValueLabel")

const deleteButtonElement = preload("res://ModConfigurationMenu/UI/Elements/MCM_Array_Delete_Button.tscn")
const dictionaryKeyInput = preload("res://ModConfigurationMenu/UI/Elements/MCM_Dictionary_Key_Input.tscn")
const elementSeparatorScene = preload("res://ModConfigurationMenu/UI/Elements/MCM_Array_Entry_Separator.tscn")
const expandButtonIcon = preload("res://ModConfigurationMenu/UI/Sprites/Icons/Icon_Keyboard_Arrow_Down.svg")
const collapseButtonIcon = preload("res://ModConfigurationMenu/UI/Sprites/Icons/Icon_Keyboard_Arrow_Up.svg")

var valueId: String
var section: String
var valueData
var menu: MCM_Menu
var callbackObject: Object

var value: Dictionary
var defaultValue: Dictionary
var valueType: String
var defaultItemValue
var elementDict: Dictionary

var hasChanged = false

func _ready():
    if !valueId:
        return

    valueType = valueData["valueType"]
    defaultItemValue = valueData["defaultItemValue"]

    nameLabel.text = valueData["name"]
    nameLabel.tooltip_text = valueData["tooltip"]

    value = valueData["value"].duplicate_deep()
    defaultValue = valueData["default"].duplicate_deep()

    if ("keyLabel" in valueData):
        keyLabel.text = valueData["keyLabel"]
    if ("valueLabel" in valueData):
        valueLabel.text = valueData["valueLabel"]

    ResetLayout()

    CreateElementsFromValue()

    CheckIsDefault(value)
    UpdateAddItemButton()
    UpdateCountLabel()

    if("canDeleteAndAdd" in valueData and !valueData["canDeleteAndAdd"]):
        newItemButton.visible = false

    if ("expanded" in valueData and valueData["expanded"]):
            ToggleExpand()

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
    valueData["value"] = value.duplicate_deep()
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

    value = newValue.duplicate_deep()
    CreateElementsFromValue()
    CheckIsDefault(value)
    UpdateAddItemButton()
    UpdateCountLabel()

func OnValueChanged(newValue):
    if ("on_value_changed" in valueData && callbackObject):
        var _callable = Callable(callbackObject, valueData["on_value_changed"])
        _callable.call(valueId, newValue.duplicate_deep(), menu)

func CreateElementsFromValue():
    if("maxItems" in valueData):
        if(value.size() > valueData["maxItems"]):
            push_warning("[MCM] There were too many items being added to " + menu.loadedModId + " " + valueId + " Array. Reverting to default.")
            value = defaultValue.duplicate_deep()

    if(!elementDict.is_empty()):
        for _element in elementDict.values():
            valueContainer.remove_child(_element)
            _element.queue_free()

        elementDict.clear()

    for _key in value.keys():
        CreateNewElement(value[_key], _key)

func CreateNewElement(valueToAdd, key):
    if("maxItems" in valueData):
        if (value.size() > valueData["maxItems"]):
            return

    var _element = menu.availableElements.get(valueType).instantiate()
    var _deleteButtonElement = deleteButtonElement.instantiate()
    var _dictionaryKeyInput = dictionaryKeyInput.instantiate()

    _deleteButtonElement.valueKey = key
    _deleteButtonElement.callback = self

    _dictionaryKeyInput.valueKey = key
    _dictionaryKeyInput.callback = self
    _dictionaryKeyInput.editable = "canEditKeys" not in valueData or valueData["canEditKeys"]

    _element.valueId = key
    _element.valueData = {
        "name": key,
        "tooltip": "",
        "value": valueToAdd,
        "default": defaultItemValue.values()[0],
        "on_value_changed": "_on_list_item_updated",
        "deleteButton": _deleteButtonElement,
        "keyInput": _dictionaryKeyInput,

        "minRange": 0 if !valueData.has("minRange") else valueData["minRange"],
        "maxRange": 100 if !valueData.has("maxRange") else valueData["maxRange"],
        "step": 1 if !valueData.has("step") else valueData["step"]
    }
    _element.menu = menu
    _element.callbackObject = self

    if("canDeleteAndAdd" not in valueData or valueData["canDeleteAndAdd"]):
        _element.find_child("Input Container").add_sibling(_deleteButtonElement)

    _element.find_child("Name Label").add_sibling(_dictionaryKeyInput)
    _element.find_child("Name Label").visible = false

    AddElementSeparator(_element)

    elementDict[key] = _element

    var _childCount = valueContainer.get_child_count()
    valueContainer.add_child(_element)
    valueContainer.move_child(_element, _childCount-1)

func AddElementSeparator(element) -> void:
    var separator: MarginContainer = elementSeparatorScene.instantiate()
    element.add_child(separator)

func DeleteItem(key):
    var _removedElement: Node = elementDict[key]
    valueContainer.remove_child(_removedElement)
    _removedElement.queue_free()

    value.erase(key)
    elementDict.erase(key)

    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()

func ValueKeyChanged(oldKey, newKey):
    value[newKey] = value[oldKey]
    value.erase(oldKey)

    elementDict[newKey] = elementDict[oldKey]
    elementDict[newKey].valueData["deleteButton"].valueKey = newKey
    elementDict[newKey].valueData["name"] = newKey
    elementDict[newKey].valueId = newKey

func CheckHasKey(keyToCheck):
    return value.has(keyToCheck)

func UpdateAddItemButton():
    if("maxItems" in valueData):
        newItemButton.disabled = value.size() >= valueData["maxItems"]

func UpdateCountLabel():
    countLabel.text = "Size: " + str(value.size())
    if ("maxItems" in valueData):
        countLabel.text += "/" + str(valueData["maxItems"])

func AddItemToValue(valueToAdd, key = ""):
    if(key.is_empty()):
        key = defaultItemValue.keys()[0]

        var _duplicateRecord = 1
        var _origKey = key
        while(value.has(key)):
            key = _origKey + " " + str(_duplicateRecord)
            _duplicateRecord += 1

    value[key] = valueToAdd
    return key

func ToggleExpand():
    itemContainer.visible = !itemContainer.visible
    panelDivider.visible = itemContainer.visible
    expandButton.icon = collapseButtonIcon if itemContainer.visible else expandButtonIcon
    expandButton.text = "Collapse" if itemContainer.visible else "Expand"
    expandButton.tooltip_text = "Collapse array list" if itemContainer.visible else "Expand array list"

func _on_revert_button_pressed() -> void:
    value = defaultValue.duplicate_deep()
    CreateElementsFromValue()
    CheckIsDefault(value)
    OnValueChanged(value)
    UpdateAddItemButton()
    UpdateCountLabel()
    menu.PlayClick()

func _on_expand_button_pressed() -> void:
    ToggleExpand()
    menu.PlayClick()

func _on_new_item_button_pressed() -> void:
    var _key = AddItemToValue(defaultItemValue.values()[0])
    CreateNewElement(value[_key], _key)
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
