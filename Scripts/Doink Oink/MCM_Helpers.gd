extends Resource
class_name MCM_Helpers

var RegisteredMods = {}

var isRemapping = false

var MCMButton
var MCM_Menu
var SettingsMenu

const MCM_PATH = "user://MCM/"

func CheckConfigurationHasUpdated(modId, newConfig: ConfigFile, configPath):
    #var _newValue = false
    var _currentConfig = ConfigFile.new()
    var _tempConfig = ConfigFile.new()
    _currentConfig.load(configPath)
    _tempConfig.load(configPath)
    
    for _section in newConfig.get_sections():
        for _key in newConfig.get_section_keys(_section):
            if !_tempConfig.has_section_key(_section, _key):
                _tempConfig.set_value(_section, _key, newConfig.get_value(_section, _key))
                #_newValue = true
            else:
                var _newValues = newConfig.get_value(_section, _key)
                var _currentValues = _tempConfig.get_value(_section, _key)
                
                var _valuesToCheck = ["default", "name", "tooltip", "minRange", "maxRange"]
                var _optionalValuesToCheck = ["menu_pos", "step", "allowAlpha", "default_type"]
                
                for _valueName in _valuesToCheck:
                    if (_newValues.has(_valueName)):
                        if (_newValues[_valueName] != _currentValues[_valueName]):
                            _currentValues[_valueName] = _newValues[_valueName]
                            #_newValue = true
                        
                for _optionalValueName in _optionalValuesToCheck:
                    if (_newValues.has(_optionalValueName)):
                        if (!_currentValues.has(_optionalValueName) || _newValues[_optionalValueName] != _currentValues[_optionalValueName]):
                            _currentValues[_optionalValueName] = _newValues[_optionalValueName]
                            #_newValue = true
                    elif (_currentValues.has(_optionalValueName)):
                        _currentValues.erase(_optionalValueName)
                        #_newValue = true
                
                #if (_newValues["default"] != _currentValues["default"]):
                    #_currentValues["default"] = _newValues["default"]
                    #_newValue = true
                #if (_newValues["name"] != _currentValues["name"]):
                    #_currentValues["name"] = _newValues["name"]
                    #_newValue = true
                #if (_newValues["tooltip"] != _currentValues["tooltip"]):
                    #_currentValues["tooltip"] = _newValues["tooltip"]
                    #_newValue = true
                #if (_newValues.has("menu_pos")):
                    #if (!_currentValues.has("menu_pos") || _newValues["menu_pos"] != _currentValues["menu_pos"]):
                        #_currentValues["menu_pos"] = _newValues["menu_pos"]
                        #_newValue = true
                #if (_newValues.has("step")):
                    #if (!_currentValues.has("step") || _newValues["step"] != _currentValues["menu_pos"]):
                        #_currentValues["step"] = _newValues["step"]
                #if (_newValues.has("allowAlpha")):
                    #if (!_currentValues.has("allowAlpha") || _newValues["allowAlpha"] != _currentValues["allowAlpha"]):
                        #_currentValues["allowAlpha"] = _newValues["allowAlpha"]
                        #_newValue = true
                #elif (_currentValues.has("allowAlpha")):
                    #_currentValues.erase("allowAlpha")
                    #_newValue = true
                    
                _tempConfig.set_value(_section, _key, _currentValues)
                
    # Now check to see if the author has removed any values from the config
    for _section in _tempConfig.get_sections():
        for _key in _tempConfig.get_section_keys(_section):
            if (!newConfig.has_section_key(_section, _key)):
                _tempConfig.erase_section_key(_section, _key)
                #_newValue = true
                
    if ConfigHasChanged(_tempConfig, _currentConfig):
        print("[MCM] " + modId + " has updated its config file successfully.")
        _tempConfig.save(configPath)
        
func ConfigHasChanged(newConfig: ConfigFile, initialConfig: ConfigFile):
    for section in newConfig.get_sections():
        for key in newConfig.get_section_keys(section):
            if newConfig.get_value(section, key) != initialConfig.get_value(section, key):
                return true
    return false

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
                    var _configValues = _config.get_value("Keycode", _action)
                    if ("type" not in _configValues):
                        _configValues["type"] = "Key"
                    
                    LoadInput(modId, _action, _configValues["value"], _configValues["type"])
                    
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
                    var _configValues = _config.get_value("Keycode", _action)
                    if ("type" not in _configValues):
                        _configValues["type"] = "Key"
                    
                    LoadInput(_modId, _action, _configValues["value"], _configValues["type"])
                    
func LoadInput(modId: String, action: String, keycode, type: String):
    var _actionEvent
    
    if (type == "Mouse"):
        _actionEvent = InputEventMouseButton.new()
        _actionEvent.button_index = keycode
    else:
        _actionEvent = InputEventKey.new()
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
                var _configData =  _config.get_value("Keycode", _action)                
                var _originalEvent = (InputMap.action_get_events(_action)[0] as InputEventKey)
                var _originalEventKeycode
                
                if (_originalEvent):
                    _originalEventKeycode = _originalEvent.physical_keycode
                else:
                    _originalEvent = (InputMap.action_get_events(_action)[0] as InputEventMouseButton)
                    _originalEventKeycode = _originalEvent.button_index
                
                if (_originalEventKeycode != _configData["value"]):
                    var _actionEvent
                    
                    if (_configData["type"] == "Mouse"):
                        _actionEvent = InputEventMouseButton.new()
                        _actionEvent.button_index = _configData["value"]
                    else:
                        _actionEvent = InputEventKey.new()
                        _actionEvent.physical_keycode = _configData["value"]
                
                    InputMap.action_erase_events(_action)
                    InputMap.action_add_event(_action, _actionEvent)

func GetModConfigFile(modId: String, fileId := "") -> ConfigFile:
    var _fileName = RegisteredMods[modId].fileOnSaveCallbacks.keys()[0] if fileId == "" else fileId
    var _config = ConfigFile.new()
    _config.load(RegisteredMods[modId].filePath + _fileName)
    return _config
    
func ToggleMCMMenu():
    if MCM_Menu.visible:
        SettingsMenu.show()
        MCM_Menu.hide()
    else:
        SettingsMenu.hide()
        MCM_Menu.show()
