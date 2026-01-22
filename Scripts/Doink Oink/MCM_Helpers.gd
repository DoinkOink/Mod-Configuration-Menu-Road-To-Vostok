extends Resource
class_name MCM_Helpers

var RegisteredMods = {}

var isRemapping = false

var MCMButton
var MCMMenu
var SettingsMenu

const MCM_PATH = "user://MCM/"

func CheckConfigurationHasUpdated(modId, newConfig: ConfigFile, configPath):
	var _newValue = false
	var _currentConfig = ConfigFile.new()
	_currentConfig.load(configPath)
	
	for _section in newConfig.get_sections():
		for _key in newConfig.get_section_keys(_section):
			if !_currentConfig.has_section_key(_section, _key):
				_currentConfig.set_value(_section, _key, newConfig.get_value(_section, _key))
				_newValue = true
			else:
				var _newValues = newConfig.get_value(_section, _key)
				var _currentValues = _currentConfig.get_value(_section, _key)
				
				if (_newValues["default"] != _currentValues["default"]):
					_currentValues["default"] = _newValues["default"]
					_newValue = true
				if (_newValues["name"] != _currentValues["name"]):
					_currentValues["name"] = _newValues["name"]
					_newValue = true
				if (_newValues["tooltip"] != _currentValues["tooltip"]):
					_currentValues["tooltip"] = _newValues["tooltip"]
					_newValue = true
				if (_newValues.has("menu_pos")):
					if (!_currentValues.has("menu_pos") || _newValues["menu_pos"] != _currentValues["menu_pos"]):
						_currentValues["menu_pos"] = _newValues["menu_pos"]
						_newValue = true
					
				_currentConfig.set_value(_section, _key, _currentValues)
				
	if _newValue:
		print("[MCM] " + modId + " has updated its config file successfully.")
		_currentConfig.save(configPath)

func RegisterConfiguration(modId: String, modFriendlyName: String, modFilePath: String, modDescription: String, fileOnSaveCallbacks: Dictionary):
	if !RegisteredMods.has(modId):
		if modFilePath.substr(-1) != '/':
			modFilePath += "/"
		
		RegisteredMods[modId] = {
			id = modId,
			friendlyName = modFriendlyName,
			filePath = modFilePath,
			description = modDescription,
			fileOnSaveCallbacks = fileOnSaveCallbacks
		}
		
		print("[MCM] " + modId + " has been successfully registered")
		
		var _config = ConfigFile.new()
		for _fileId in fileOnSaveCallbacks:
			_config.load(modFilePath + _fileId)
			if _config.has_section("Keycode"):
				var _keycodes = _config.get_section_keys("Keycode")
				for _action in _keycodes:
					LoadInput(modId, _action, _config.get_value("Keycode", _action)["value"])
					
	else:
		push_warning("[MCM] " + modId + " has failed to register. This ID already exists.")
		
func CallConfigCallback(modId: String, fileId: String, data: ConfigFile):
	if RegisteredMods.has(modId):
		if RegisteredMods[modId].fileOnSaveCallbacks.has(fileId):
			if (RegisteredMods[modId].fileOnSaveCallbacks[fileId] as Callable).is_valid():
				RegisteredMods[modId].fileOnSaveCallbacks[fileId].call(data)

func LoadInputs():
	var _config = ConfigFile.new()
	for _modId in RegisteredMods:
		for _fileName in RegisteredMods[_modId].fileOnSaveCallbacks:
			_config.load(RegisteredMods[_modId].filePath + _fileName)
			
			if _config.has_section("Keycode"):
				var _keycodes = _config.get_section_keys("Keycode")
				for _action in _keycodes:
					LoadInput(_modId, _action, _config.get_value("Keycode", _action)["value"])
					
func LoadInput(modId: String, action: String, keycode):
	var _actionEvent = InputEventKey.new()
	_actionEvent.physical_keycode = keycode
	
	InputMap.add_action(action)
	InputMap.action_add_event(action, _actionEvent)
	
	print("[MCM] " + modId + " Has successfully added the Input Action: " + action)
				
func UpdateInputs(modId: String, fileId):
	var _config = ConfigFile.new()
	_config.load(RegisteredMods[modId].filePath + fileId)
	
	if _config.has_section("Keycode"):
		var _keycodes = _config.get_section_keys("Keycode")
		for _action in _keycodes:
			if InputMap.has_action(_action):
				var _originalEvent = (InputMap.action_get_events(_action)[0] as InputEventKey)
				if _originalEvent.physical_keycode != _config.get_value("Keycode", _action)["value"]:
					var _actionEvent = InputEventKey.new()
					_actionEvent.physical_keycode = _config.get_value("Keycode", _action)["value"]
				
					InputMap.action_erase_events(_action)
					InputMap.action_add_event(_action, _actionEvent)

func GetModConfigFile(modId: String, fileId := "") -> ConfigFile:
	var _fileName = RegisteredMods[modId].fileOnSaveCallbacks.keys()[0] if fileId == "" else fileId
	var _config = ConfigFile.new()
	_config.load(RegisteredMods[modId].filePath + _fileName)
	return _config
	
func ToggleMCMMenu():
	if MCMMenu.visible:
		SettingsMenu.show()
		MCMMenu.hide()
	else:
		SettingsMenu.hide()
		MCMMenu.show()
