extends Control

var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

@onready var ModListPanel = find_child("Mods")
@onready var ConfigPanel = find_child("Settings")
@onready var Logo: Control = find_child("Logo")

var modListButton = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Mod_List_Button.tscn")
#var sliderValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Slider_Value.tscn")
#var boolValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Bool_Value.tscn")
#var stringValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_String_Value.tscn")
#var keycodeValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Keycode_Value.tscn")
#var colorValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Color_Value.tscn")
#var dropdownValueEditor = preload("res://ModConfigurationMenu/Resources/Doink Oink/MCM_Dropdown_Value.tscn")

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
var currentConfigFileId: String = ""
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
	Logo.show()
	#MCMHelpers.MCMMenu.get_children()[2].pressed.get_connections()[0].callable.call()

func CreateAllModButtons():
	for item in ModListPanel.get_children():
		item.queue_free()
		
	for _modId in MCMHelpers.RegisteredMods:
		CreateModButton(MCMHelpers.RegisteredMods[_modId])
		
func CreateModButton(mod):
	var _button: Button = modListButton.instantiate()
	_button.text = "    " + mod.friendlyName
	_button.pressed.connect(_on_mod_button_pressed.bind(mod.id))
	
	ModListPanel.add_child(_button)
	
func _on_mod_button_pressed(modId: String):
	if loadedModId != "":
		SaveConfiguration(loadedModId)
	else:
		Logo.hide()
		
	loadedModId = modId
	LoadConfiguration(loadedModId)
	
func LoadConfiguration(modId: String):
	ClearConfiguration()
	
	var _configFiles: Dictionary = MCMHelpers.RegisteredMods[loadedModId].fileOnSaveCallbacks
	currentConfig = MCMHelpers.GetModConfigFile(modId)
	currentConfigFileId = MCMHelpers.RegisteredMods[modId].fileOnSaveCallbacks.keys()[0]
	
	var _properties = SortModProperties(currentConfig)
	
	#for _section in currentConfig.get_sections():
	for _valueKey in _properties:
		var _element: Control
		var _property = _properties[_valueKey]
		var _section = _property["section"]
		
		_property.erase("section")
		_property.erase("key")
		
		#if _section == "Int" || _section == "Float":
			#_element = sliderValueEditor.instantiate()
			#if _section == "Int":
				#_element.isInt = true
		#elif _section == "Bool":
			#_element = boolValueEditor.instantiate()
		#elif _section == "String":
			#_element = stringValueEditor.instantiate()
		#elif _section == "Keycode":
			#_element = keycodeValueEditor.instantiate()
		#elif _section == "Color":
			#_element = colorValueEditor.instantiate()
		if (availableElements.has(_section)):
			_element = availableElements.get(_section).instantiate()
		else:
			push_warning("[MCM] " + modId + " has an unsupported value type [" + _section + "] in config file")
			continue
			
		_element.valueId = _valueKey
		_element.section = _section
		_element.valueData = _property
		
		ConfigPanel.add_child(_element)
	
func SaveConfiguration(modId: String):
	for _element in ConfigPanel.get_children():
		currentConfig.set_value(_element.section, _element.valueId, _element.GetValueData())
		
	if FileAccess.file_exists(MCMHelpers.RegisteredMods[modId].filePath + currentConfigFileId):
		var _saveStatus = currentConfig.save(MCMHelpers.RegisteredMods[modId].filePath + currentConfigFileId)
		if _saveStatus == 0:
			print("[MCM] " + modId + ": " + currentConfigFileId + " has been saved.")
			MCMHelpers.CallConfigCallback(modId, currentConfigFileId, currentConfig)
		else:
			print("[MCM] The config file " + currentConfigFileId + " for mod " + modId + " has not been saved with the status code: " + _saveStatus)
			
	if currentConfig.has_section("Keycode"):
		MCMHelpers.UpdateInputs(modId, currentConfigFileId)
	
func SortModProperties(configFile):
	var _values = []
	var _properties: Dictionary = {}
	
	for _section in configFile.get_sections():
		for _valueKey in configFile.get_section_keys(_section):
			var _data = configFile.get_value(_section, _valueKey)
			_data["section"] = _section
			_data["key"] = _valueKey
			_values.append(_data)
			
	_values.sort_custom(_sort_by_pos_and_name)
	
	for _value in _values:
		_properties[_value["key"]] = _value
			
	return _properties
	
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
	MCMHelpers.ToggleMCMMenu()
