extends Control
class_name MCMMenu

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var audioLibrary = preload("res://Resources/AudioLibrary.tres")
var audioInstance2D = preload("res://Resources/AudioInstance2D.tscn")

@onready var ModListPanel = find_child("Mods")
@onready var ConfigPanel = find_child("Settings")
@onready var Logo: Control = find_child("Logo")
@onready var SettingsLabel: Label = find_child("Settings_Label", true, false)

var modListButton = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Mod_List_Button.tscn")
var categoryHeader = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Header_String.tscn")

var availableElements = {
    "Int": preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Slider_Value.tscn"),
    # The float element will be added in _ready() since it is the same as int
    # "FLoat": preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Slider_Value.tscn"),
    "Bool": preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Bool_Value.tscn"),
    "String": preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_String_Value.tscn"),
    "Keycode": preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Keycode_Value.tscn"),
    "Color": preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Color_Value.tscn"),
    "Dropdown": preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Dropdown_Value.tscn")
}

var uiManager
var isRemapping = false

var loadedModId: String = ""
var loadedButton: Button
var currentConfig: ConfigFile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    availableElements["Float"] = availableElements["Int"]
    
    ClearConfiguration()
    CreateAllModButtons()
    self.visibility_changed.connect(_on_visibility_changed)
        
func _on_visibility_changed():
    if loadedModId != "":
        SaveConfiguration(loadedModId)
        loadedModId = ""
        
    ClearConfiguration()
    CreateAllModButtons()
    PlayClick()
    #Logo.show()
    #MCMHelpers.MCMMenu.get_children()[2].pressed.get_connections()[0].callable.call()

func CreateAllModButtons():
    for item in ModListPanel.get_children():
        item.queue_free()
        
    for _modId in MCMHelpers.RegisteredMods:
        CreateModButton(MCMHelpers.RegisteredMods[_modId])
        
func CreateModButton(mod):
    var _button: Button = modListButton.instantiate()
    _button.text = "    " + mod.friendlyName
    _button.pressed.connect(_on_mod_button_pressed.bind(mod.id, _button))
    
    ModListPanel.add_child(_button)
    
func _on_mod_button_pressed(modId: String, button: Button):
    if loadedModId != "":
        SaveConfiguration(loadedModId)
        loadedButton.button_pressed = false
    else:
        Logo.hide()
        
    loadedModId = modId
    loadedButton = button
    loadedButton.button_pressed = true
    LoadConfiguration(loadedModId)
    PlayClick()
    
func LoadConfiguration(modId: String):
    ClearConfiguration()
    
    currentConfig = MCMHelpers.GetModConfigFile(modId)    
    
    var _callbackObject = MCMHelpers.RegisteredMods[modId].callbackObject
    
    SettingsLabel.text = MCMHelpers.RegisteredMods[loadedModId].friendlyName + " Settings"
    
    var _sortedCategories = GetModCategoryData(currentConfig)    
    var _noCategoriesSet = (_sortedCategories.size() == 1)
    
    for _categoryName in _sortedCategories:
        if (!_noCategoriesSet):
            var _header = categoryHeader.instantiate()
            _header.headerText = _categoryName
            ConfigPanel.add_child(_header)
            
        for _property in _sortedCategories.get(_categoryName):
            var _element: Control
            var _section = _property["section"]
            var _valueKey = _property["key"]
            
            _property.erase("section")
            _property.erase("key")
            
            if (availableElements.has(_section)):
                _element = availableElements.get(_section).instantiate()
            else:
                push_warning("[MCM] " + modId + " has an unsupported value type [" + _section + "] in config file")
                continue
                
            _element.valueId = _valueKey
            _element.section = _section
            _element.valueData = _property
            _element.menu = self
            _element.callbackObject = _callbackObject
            
            ConfigPanel.add_child(_element)
    
func SaveConfiguration(modId: String):
    for _element in ConfigPanel.get_children():
        if (_element is not MCM_Header):
            currentConfig.set_value(_element.section, _element.valueId, _element.GetValueData())
            
    var _fileName = MCMHelpers.GetModConfigFileName(modId)
        
    if FileAccess.file_exists(MCMHelpers.RegisteredMods[modId].filePath + _fileName):
        var _saveStatus = currentConfig.save(MCMHelpers.RegisteredMods[modId].filePath + _fileName)
        if _saveStatus == 0:
            print("[MCM] " + modId + ": " + _fileName + " has been saved.")
            MCMHelpers.CallConfigCallback(modId, _fileName, currentConfig)
        else:
            print("[MCM] The config file " + _fileName + " for mod " + modId + " has not been saved with the status code: " + _saveStatus)
            
    if currentConfig.has_section("Keycode"):
        MCMHelpers.UpdateInputs(modId, _fileName)

func GetElements() -> Dictionary:
    var elements = {}
    for _element in ConfigPanel.get_children():
        if _element.has_method("SetValue"):
            elements[_element.valueId] = _element
    return elements

    
func GetModCategoryData(configFile):
    var _sortedCategories: Dictionary = {}
    var _categories: Dictionary = {"Uncategorized": []}
    var _categoryData = [{
        "name": "Uncategorized",
        "menu_pos": 2000000
    }]
    
    for _section in configFile.get_sections():
        for _valueKey in configFile.get_section_keys(_section):
            var _data = configFile.get_value(_section, _valueKey)
            
            if (_section == "Category"):
                _data["name"] = _valueKey
                _categoryData.append(_data)
            else:
                _data["section"] = _section
                _data["key"] = _valueKey
                
                if ("category" in _data):
                    if (_data["category"] not in _categories.keys()):
                        _categories[_data["category"]] = []
                        
                    _categories[_data["category"]].append(_data)
                else:
                    _categories["Uncategorized"].append(_data)
                    
    for _categoryKey in _categories.keys():
        var _isInArray = false
        for _category in _categoryData:
            if (_category["name"] == _categoryKey):
                _isInArray = true
                break
                
        if (!_isInArray):
            _categoryData.append({ "name": _categoryKey })
                    
    _categoryData.sort_custom(_sort_by_pos_and_name)
    
    for _category in _categoryData:
        var _categorySort = _categories.get(_category["name"])
        _categorySort.sort_custom(_sort_by_pos_and_name)
        
        _sortedCategories[_category["name"]] = _categorySort
        
    if (_sortedCategories.get("Uncategorized").size() == 0):
        _sortedCategories.erase("Uncategorized")
        
    return _sortedCategories

func ClearConfiguration():
    for _element in ConfigPanel.get_children():
        _element.queue_free()
        
func _sort_by_pos_and_name(a, b):
    var _aPos = 1000000 if !a.has("menu_pos") else a["menu_pos"]
    var _bPos = 1000000 if !b.has("menu_pos") else b["menu_pos"]
    
    if (_aPos == _bPos):
        return a["name"] < b["name"]
    else:
        return _aPos < _bPos

func _on_back_pressed() -> void:
    SettingsLabel.text = "Settings"
    MCMHelpers.ToggleMCMMenu()

func PlayClick():
    var click = audioInstance2D.instantiate()
    add_child(click)
    click.PlayInstance(audioLibrary.UIClick)
