extends Node

var RegisteredMods = {}

const MCM_PATH = "user://MCM/"

func _ready():
	print("Hello world")

func RegisterConfiguration(_modId: String, _modFriendlyName: String, _modDescription: String, _fileOnSaveCallbacks: Dictionary):
	if !RegisteredMods.has(_modId):
		RegisteredMods[_modId] = {
			id = _modId,
			friendlyName = _modFriendlyName,
			description = _modDescription,
			fileOnSaveCallbacks = _fileOnSaveCallbacks
		}
		
		print("[MCM] " + _modId + " has been successfully registered")
	else:
		push_warning("[MCM] " + _modId + " has failed to register. This ID already exists.")
		
func CallConfigCallback(_modId: String, _fileId: String, data: ConfigFile):
	if RegisteredMods.has(_modId):
		if RegisteredMods[_modId].fileOnSaveCallbacks.has(_fileId):
			RegisteredMods[_modId].fileOnSaveCallbacks[_fileId].call(data)

func LoadInputs():
	for _modId in RegisteredMods:
		for _fileName in RegisteredMods[_modId].fileOnSaveCallbacks:
			var _config = ConfigFile.new()
			_config.load(MCM_PATH + _modId + "/" + _fileName)
			
			if _config.has_section("Keycode"):
				var _keycodes = _config.get_section_keys("Keycode")
				for _action in _keycodes:
					var _actionEvent = InputEventKey.new()
					_actionEvent.physical_keycode = _config.get_value("Keycode", _action)["value"]
					
					InputMap.add_action(_action)
					InputMap.action_add_event(_action, _actionEvent)
					
					print("[MCM] " + _modId + " Has successfully added the Input Action: " + _action)
				
func UpdateInputs(_modId: String, _fileId):
	var _config = ConfigFile.new()
	_config.load(MCM_PATH + _modId + "/" + _fileId)
	
	if _config.has_section("Keycode"):
		var _keycodes = _config.get_section_keys("Keycode")
		for _action in _keycodes:
			var _originalEvent = (InputMap.action_get_events(_action)[0] as InputEventKey)
			if _originalEvent.physical_keycode != _config.get_value("Keycode", _action)["value"]:
				var _actionEvent = InputEventKey.new()
				_actionEvent.physical_keycode = _config.get_value("Keycode", _action)["value"]
			
				InputMap.action_erase_events(_action)
				InputMap.action_add_event(_action, _actionEvent)

func GetModConfigFile(_modId: String, _fileId := "") -> ConfigFile:
	var _fileName = RegisteredMods[_modId].fileOnSaveCallbacks.keys()[0] if _fileId == "" else _fileId
	var _config = ConfigFile.new()
	_config.load(MCM_PATH + _modId + "/" + _fileName)
	return _config
