extends Control

var McmHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

@onready var ModListPanel = find_child("Mods")
@onready var ConfigPanel = find_child("Settings")
@onready var Logo: Control = find_child("Logo")

var modListButton = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Mod_List_Button.tscn")
var sliderValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Slider_Value.tscn")
var boolValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Bool_Value.tscn")
var stringValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_String_Value.tscn")
var keycodeValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Keycode_Value.tscn")

var uiManager
var isRemapping = false

var loadedModId: String = ""
var currentConfigFileId: String = ""
var currentConfig: ConfigFile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ClearConfiguration()
	CreateAllModButtons()
	self.visibility_changed.connect(_on_visibility_changed)
		
func _on_visibility_changed():
	if loadedModId != "":
		SaveConfiguration(loadedModId)
		loadedModId = ""
		
	ClearConfiguration()
	CreateAllModButtons()
	Logo.show()

func CreateAllModButtons():
	for item in ModListPanel.get_children():
		item.queue_free()
		
	for _modId in McmHelpers.RegisteredMods:
		CreateModButton(McmHelpers.RegisteredMods[_modId])
		
func CreateModButton(_mod):
	var _button: Button = modListButton.instantiate()
	_button.text = "    " + _mod.friendlyName
	_button.pressed.connect(_on_mod_button_pressed.bind(_mod.id))
	
	ModListPanel.add_child(_button)
	
func _on_mod_button_pressed(_modId: String):
	if loadedModId != "":
		SaveConfiguration(loadedModId)
	else:
		Logo.hide()
		
	loadedModId = _modId
	LoadConfiguration(loadedModId)
	
func LoadConfiguration(_modId: String):
	ClearConfiguration()
	
	var _configFiles: Dictionary = McmHelpers.RegisteredMods[loadedModId].fileOnSaveCallbacks
	currentConfig = McmHelpers.GetModConfigFile(_modId)
	currentConfigFileId = McmHelpers.RegisteredMods[_modId].fileOnSaveCallbacks.keys()[0]
	
	for _section in currentConfig.get_sections():
		for _valueKey in currentConfig.get_section_keys(_section):
			var _element: Control
			
			if _section == "Int" || _section == "Float":
				_element = sliderValueEditor.instantiate()
				if _section == "Int":
					_element.isInt = true
			elif _section == "Bool":
				_element = boolValueEditor.instantiate()
			elif _section == "String":
				_element = stringValueEditor.instantiate()
			elif _section == "Keycode":
				_element = keycodeValueEditor.instantiate()
			else:
				push_warning("[MCM] " + _modId + " has an unsupported value type [" + _section + "] in config file")
				continue
				
			_element.valueId = _valueKey
			_element.section = _section
			_element.valueData = currentConfig.get_value(_section, _valueKey)
			_element.mcmMenu = self
			
			ConfigPanel.add_child(_element)
	
func SaveConfiguration(_modId: String):
	for _element in ConfigPanel.get_children():
		currentConfig.set_value(_element.section, _element.valueId, _element.GetValueData())
		
	if FileAccess.file_exists(McmHelpers.RegisteredMods[_modId].filePath + currentConfigFileId):
		var _saveStatus = currentConfig.save(McmHelpers.RegisteredMods[_modId].filePath + currentConfigFileId)
		if _saveStatus == 0:
			print("[MCM] " + _modId + ": " + currentConfigFileId + " has been saved.")
			McmHelpers.CallConfigCallback(_modId, currentConfigFileId, currentConfig)
		else:
			print("[MCM] The config file " + currentConfigFileId + " for mod " + _modId + " has not been saved with the status code: " + _saveStatus)
			
	if currentConfig.has_section("Keycode"):
		McmHelpers.UpdateInputs(_modId, currentConfigFileId)
	
func ClearConfiguration():
	for _element in ConfigPanel.get_children():
		_element.queue_free()

func _on_back_pressed() -> void:
	uiManager.ToggleMCMMenu()
