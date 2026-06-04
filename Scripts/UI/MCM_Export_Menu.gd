extends Control

@onready var windowContainer : PanelContainer = find_child("Window Container")
@onready var modContainer : VBoxContainer = find_child("Mod Container")
@onready var openOnSave : CheckBox = find_child("Open On Save")
@onready var selectAll : CheckBox = find_child("Select All")

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var modButton = preload("res://ModConfigurationMenu/UI/Elements/MCM_Import_Export_Mod_List_Button.tscn")

var menu : MCM_Menu
var modButtons = {}
var fileMenu : FileDialog

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    ClearTemplateButtons()
    
    for _modData in MCMHelpers.RegisteredMods:
        CreateModButton(MCMHelpers.RegisteredMods[_modData])
        
    UpdateSelectAll()
    
func CreateModButton(modData):
    var _button = modButton.instantiate()
    
    _button.modFriendlyName = modData["friendlyName"]
    _button.parentMenu = self
    
    modButtons[modData["id"]] = _button
    modContainer.add_child(_button)
    
func ClearTemplateButtons():
    for _element in modContainer.get_children():
        _element.queue_free()
        
func CreateFileDialog():
    fileMenu = FileDialog.new()
    
    fileMenu.file_mode = FileDialog.FILE_MODE_SAVE_FILE
    fileMenu.access = FileDialog.ACCESS_FILESYSTEM
    fileMenu.unresizable = true
    
    fileMenu.filters = [ "*.ini ; Config" ]
    fileMenu.current_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/Exported Mod Config.ini"
    
    fileMenu.size = windowContainer.size
    fileMenu.title = "Select where to save the exported config file."
    
    fileMenu.file_selected.connect(_on_file_menu_confirmed)
    fileMenu.visibility_changed.connect(_on_file_menu_visibility_changed)
    
    add_child(fileMenu)
    
func RemoveFileDialog():
    if (fileMenu):
        fileMenu.queue_free()
        
func CreateAndSaveExportedFile(path):
    var _exportedConfig = ConfigFile.new()
    
    for _modId in modButtons:
        if(modButtons[_modId].isChecked):
            var _modConfig = MCMHelpers.GetModConfigFile(_modId)
            
            _exportedConfig.set_value(_modId, "ImportModData", {
                "friendlyName": MCMHelpers.RegisteredMods[_modId]["friendlyName"]
            })
            
            for _section in _modConfig.get_sections():                
                for _key in _modConfig.get_section_keys(_section):
                    var _data = _modConfig.get_value(_section,_key)
                    
                    _data["import_data"] = {
                        "section": _section
                    }
                    
                    _exportedConfig.set_value(_modId, _key, _data)
                    
    _exportedConfig.save(path)
    
    if(openOnSave.button_pressed):
        OS.shell_open(fileMenu.current_dir)
        
    menu.ToggleExportScreen()
        
func UpdateSelectAll():
    var _allSelected = true
    for _button in modButtons.values():
        if(!_button.isChecked):
            _allSelected = false
            break
    
    selectAll.tooltip_text = "Deselect All" if _allSelected else "Select All"
    selectAll.set_pressed_no_signal(_allSelected)

func _on_export_pressed() -> void:
    menu.PlayClick()
    fileMenu.popup_centered()

func _on_close_pressed() -> void:
    menu.PlayClick()
    menu.ToggleExportScreen()
    
func _on_visibility_changed() -> void:
    if (visible):
        CreateFileDialog()
    else:
        RemoveFileDialog()

func _on_file_menu_confirmed(path):
    CreateAndSaveExportedFile(path)

func _on_file_menu_visibility_changed():
    menu.PlayClick()
    windowContainer.visible = !fileMenu.visible
    
func _on_select_all_pressed() -> void:
    menu.PlayClick()
    selectAll.tooltip_text = "Deselect All" if selectAll.button_pressed else "Select All"    
    for _button in modButtons.values():
        _button.SetCheckBox(selectAll.button_pressed)


func _on_open_on_save_pressed() -> void:
    menu.PlayClick()
