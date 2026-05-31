extends Control

@onready var windowContainer : PanelContainer = find_child("Window Container")
@onready var modContainer : VBoxContainer = find_child("Mod Container")
@onready var selectAll : CheckBox = find_child("Select All")

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var modButton = preload("res://ModConfigurationMenu/UI/Elements/MCM_Import_Export_Mod_List_Button.tscn")

var menu : MCM_Menu

var importConfigFile : ConfigFile
var modButtons = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    ClearTemplateButtons()
    
func LoadImportFile(path):
    ClearTemplateButtons()
    
    importConfigFile = ConfigFile.new()
    importConfigFile.load(path)
    
    for _modId in importConfigFile.get_sections():
        var _modFriendlyName = importConfigFile.get_value(_modId, "ImportModData")["friendlyName"]
        CreateModButton(_modId, _modFriendlyName)
        
    UpdateSelectAll()
    
func CreateModButton(modId, modFriendlyName):
    var _button = modButton.instantiate()
    
    _button.modFriendlyName = modFriendlyName
    _button.exportMenu = self
    _button.isModPresent = modId in MCMHelpers.RegisteredMods.keys()
    
    modButtons[modId] = _button
    modContainer.add_child(_button)
    
func ClearTemplateButtons():
    for _element in modContainer.get_children():
        _element.queue_free()
        
func UpdateSelectAll():
    var _allSelected = true
    for _button in modButtons.values():
        if(!_button.isChecked && _button.isModPresent):
            _allSelected = false
            break
    
    selectAll.tooltip_text = "Deselect All" if _allSelected else "Select All"
    selectAll.set_pressed_no_signal(_allSelected)
    
func ImportSettings():
    for _modId in modButtons:
        var _button = modButtons.get(_modId)
        if(_button.isChecked):
            var _modConfigFile = MCMHelpers.GetModConfigFile(_modId)
            
            for _valueKey in importConfigFile.get_section_keys(_modId):
                if(_valueKey == "ImportModData"):
                    continue
                    
                var _valueData = importConfigFile.get_value(_modId, _valueKey)
                var _importData = _valueData.get("import_data")
                var _requiredValueProperties = MCMHelpers.ValidationData.GetRequiredProperties(_importData["section"])
                _valueData.erase("import_data")
                
                var _hasProperties = true
                var _missingPropertyName = ""
                for _property in _requiredValueProperties:
                    if(_property not in _valueData):
                        _missingPropertyName = _property
                        _hasProperties = false
                        break
                        
                if(!_hasProperties):
                    print("[MCM] Skipped importing value " + _valueKey + " from mod " + _modId + " because it didn't have the requried property " + _missingPropertyName)
                    continue
                    
                _modConfigFile.set_value(_importData["section"], _valueKey, _valueData)
                
            _modConfigFile.save(MCMHelpers.GetModConfigFilePath(_modId))

func _on_import_pressed() -> void:
    ImportSettings()
    
    if(menu.loadedModId != ""):
        menu.LoadConfiguration(menu.loadedModId)
        
    menu.ToggleImportScreen()

func _on_close_pressed() -> void:
    menu.ToggleImportScreen()
    
func _on_select_all_pressed() -> void:
    selectAll.tooltip_text = "Deselect All" if selectAll.button_pressed else "Select All"    
    for _button in modButtons.values():
        if(_button.isModPresent):
            _button.SetCheckBox(selectAll.button_pressed)
