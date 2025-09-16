extends Resource
class_name MCM_Helpers

var RegisteredMods = {}

var isRemapping = false

var MCMButton
var MCMMenu
var SettingsMenu

const MCM_PATH = "user://MCM/"

func CheckConfigruationHasUpdated(_modId, _newConfig: ConfigFile, _configPath):
	var _newValue = false
	var _currentConfig = ConfigFile.new()
	_currentConfig.load(_configPath)
	
	for _section in _newConfig.get_sections():
		for _key in _newConfig.get_section_keys(_section):
			if !_currentConfig.has_section_key(_section, _key):
				_currentConfig.set_value(_section, _key, _newConfig.get_value(_section, _key))
				_newValue = true
				
	if _newValue:
		print("[MCM] " + _modId + " has updated its config file successfully.")
		_currentConfig.save(_configPath)

func RegisterConfiguration(_modId: String, _modFriendlyName: String, _modFilePath: String, _modDescription: String, _fileOnSaveCallbacks: Dictionary):
	if !RegisteredMods.has(_modId):
		if _modFilePath.substr(-1) != '/':
			_modFilePath += "/"
		
		RegisteredMods[_modId] = {
			id = _modId,
			friendlyName = _modFriendlyName,
			filePath = _modFilePath,
			description = _modDescription,
			fileOnSaveCallbacks = _fileOnSaveCallbacks
		}
		
		print("[MCM] " + _modId + " has been successfully registered")
		
		var _config = ConfigFile.new()
		for _fileId in _fileOnSaveCallbacks:
			_config.load(_modFilePath + _fileId)
			if _config.has_section("Keycode"):
				var _keycodes = _config.get_section_keys("Keycode")
				for _action in _keycodes:
					LoadInput(_modId, _action, _config.get_value("Keycode", _action)["value"])
					
	else:
		push_warning("[MCM] " + _modId + " has failed to register. This ID already exists.")
		
func CallConfigCallback(_modId: String, _fileId: String, data: ConfigFile):
	if RegisteredMods.has(_modId):
		if RegisteredMods[_modId].fileOnSaveCallbacks.has(_fileId):
			if (RegisteredMods[_modId].fileOnSaveCallbacks[_fileId] as Callable).is_valid():
				RegisteredMods[_modId].fileOnSaveCallbacks[_fileId].call(data)

func LoadInputs():
	var _config = ConfigFile.new()
	for _modId in RegisteredMods:
		for _fileName in RegisteredMods[_modId].fileOnSaveCallbacks:
			_config.load(RegisteredMods[_modId].filePath + _fileName)
			
			if _config.has_section("Keycode"):
				var _keycodes = _config.get_section_keys("Keycode")
				for _action in _keycodes:
					LoadInput(_modId, _action, _config.get_value("Keycode", _action)["value"])
					
func LoadInput(_modId: String, _action: String, _keycode):
	var _actionEvent = InputEventKey.new()
	_actionEvent.physical_keycode =_keycode
	
	InputMap.add_action(_action)
	InputMap.action_add_event(_action, _actionEvent)
	
	print("[MCM] " + _modId + " Has successfully added the Input Action: " + _action)
				
func UpdateInputs(_modId: String, _fileId):
	var _config = ConfigFile.new()
	_config.load(RegisteredMods[_modId].filePath + _fileId)
	
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

func GetModConfigFile(_modId: String, _fileId := "") -> ConfigFile:
	var _fileName = RegisteredMods[_modId].fileOnSaveCallbacks.keys()[0] if _fileId == "" else _fileId
	var _config = ConfigFile.new()
	_config.load(RegisteredMods[_modId].filePath + _fileName)
	return _config
	
func ToggleMCMMenu():
	if MCMMenu.visible:
		SettingsMenu.show()
		MCMMenu.hide()
	else:
		SettingsMenu.hide()
		MCMMenu.show()
