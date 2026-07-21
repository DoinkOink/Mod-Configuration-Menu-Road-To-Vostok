extends Resource
class_name MCM_Helpers

const ValidationData = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Validation.gd")

var RegisteredMods = {}
var RegisteredModKeybinds = {}

var isRemapping = false

var MCMButton
var MCMMenu
var SettingsMenu
var LastOpenedModId: String = ""

var DefaultConfigFileName: String = "config"
var CurrentModLoaderProfile: String # This will be used as the config file name when saving/loading 

const MCM_PATH = "user://MCM/"

func CheckConfigurationHasUpdated(modId, newConfig: ConfigFile, configPath=""):
    configPath = MCM_PATH + modId + "/" + CurrentModLoaderProfile + ".ini"
    
    var _configUpdated = false
    var _currentConfig = ConfigFile.new()
    var _tempConfig = ConfigFile.new()
    _currentConfig.load(configPath)
    _tempConfig.load(configPath)
    
    for _section in newConfig.get_sections():
        var _requiredValueProperties = ValidationData.GetRequiredProperties(_section)
        var _optionalValueProperties = ValidationData.GetOptionalProperties(_section)
        
        for _key in newConfig.get_section_keys(_section):
            var _newValues = newConfig.get_value(_section, _key)
            
            if !_tempConfig.has_section_key(_section, _key):
                # First let's make sure the value type has all the required properties
                var _missingProperty = false
                for _property in _requiredValueProperties:
                    if(_property not in _newValues.keys()):
                        push_warning("[MCM] " + modId + " tried creating a " + _section + " value with the id " + _key + " but is missing the required '" + _property + "' property. Value has been skipped.")
                        _missingProperty = true
                        break
                        
                if(_missingProperty):
                    continue
                    
                # Lastly let's check if the dev has set the 'value' property. If not set it to the defaultValue
                if('value' not in _newValues.keys() && 'default' in _newValues.keys()):
                    _newValues['value'] = _newValues['default']
                    
                if(_section == "Keycode"):
                    if("altPressed" not in _newValues.keys()): 
                        _newValues["altPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["alt"]
                    if("controlPressed" not in _newValues.keys()): 
                        _newValues["controlPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["control"]
                    if("metaPressed" not in _newValues.keys()): 
                        _newValues["metaPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["meta"]
                    if("shiftPressed" not in _newValues.keys()): 
                        _newValues["shiftPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["shift"]
                
                # Finally insert the new values in the config that will be saved
                _tempConfig.set_value(_section, _key, _newValues)
                _configUpdated = true
            else:
                var _currentValues = _tempConfig.get_value(_section, _key)
                
                for _valueName in _requiredValueProperties:
                    if (_newValues.has(_valueName)):
                        if (typeof(_newValues[_valueName]) != typeof(_currentValues[_valueName]) || _newValues[_valueName] != _currentValues[_valueName]):
                            _currentValues[_valueName] = _newValues[_valueName]
                            _configUpdated = true
                        
                for _optionalValueName in _optionalValueProperties:
                    if (_newValues.has(_optionalValueName)):
                        if (!_currentValues.has(_optionalValueName) || typeof(_newValues[_optionalValueName]) != typeof(_currentValues[_optionalValueName]) || _newValues[_optionalValueName] != _currentValues[_optionalValueName]):
                            _currentValues[_optionalValueName] = _newValues[_optionalValueName]
                            _configUpdated = true
                    elif (_currentValues.has(_optionalValueName)):
                        _currentValues.erase(_optionalValueName)
                        _configUpdated = true

                if (_section == "Dropdown"):
                    if (_newValues["options"] is Dictionary):
                        if (!_newValues["options"].has(_currentValues["value"])):
                            _currentValues["value"] = _newValues["default"]
                            _configUpdated = true
                    else:
                        if (typeof(_newValues["value"]) != typeof(_currentValues["value"]) || _currentValues["value"] > _newValues["options"].size()):
                            _currentValues["value"] = _newValues["default"]
                            _configUpdated = true
                            
                if(_section == "Keycode"):
                    if("altPressed" not in _currentValues.keys()):
                        _currentValues["altPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["alt"]
                        _configUpdated = true
                    if("controlPressed" not in _currentValues.keys()):
                        _currentValues["controlPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["control"]
                        _configUpdated = true
                    if("metaPressed" not in _currentValues.keys()):
                        _currentValues["metaPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["meta"]
                        _configUpdated = true
                    if("shiftPressed" not in _currentValues.keys()):
                        _currentValues["shiftPressed"] = false if "default_modifiers" not in _newValues.keys() else _newValues["default_modifiers"]["shift"]
                        _configUpdated = true
                    
                _tempConfig.set_value(_section, _key, _currentValues)
                
    # Now check to see if the author has removed any values from the config
    for _section in _tempConfig.get_sections():
        for _key in _tempConfig.get_section_keys(_section):
            if (!newConfig.has_section_key(_section, _key)):
                _tempConfig.erase_section_key(_section, _key)
                _configUpdated = true
                
    if _configUpdated:
        print("[MCM] " + modId + " has updated its config file successfully.")
        _tempConfig.save(configPath)
        
func ConfigHasChanged(newConfig: ConfigFile, initialConfig: ConfigFile):
    for section in newConfig.get_sections():
        for key in newConfig.get_section_keys(section):
            if newConfig.get_value(section, key) != initialConfig.get_value(section, key):
                return true
    return false

func RegisterConfiguration(modId: String, modFriendlyName: String, modFilePath: String, modDescription: String, fileOnSaveCallbacks, callbackObject: Object = null):
    modFilePath = MCM_PATH + modId
    if !RegisteredMods.has(modId):
        if modFilePath.substr(-1) != '/':
            modFilePath += "/"
        
        RegisteredMods[modId] = {
            id = modId,
            friendlyName = modFriendlyName,
            filePath = modFilePath,
            description = modDescription,
            fileOnSaveCallbacks = fileOnSaveCallbacks,
            callbackObject = callbackObject
        }
        
        print("[MCM] " + modId + " has been successfully registered")
        
        var _config = GetModConfigFile(modId)
        #for _fileId in fileOnSaveCallbacks:
            #_config.load(modFilePath + _fileId)
        if _config.has_section("Keycode"):
            var _keycodes = _config.get_section_keys("Keycode")
            for _action in _keycodes:
                var _configValues = _config.get_value("Keycode", _action)
                if ("type" not in _configValues || _configValues["type"] == null):
                    _configValues["type"] = "Key"
                
                LoadInput(modId, _action, _configValues)
                    
    else:
        push_warning("[MCM] " + modId + " has failed to register. This ID already exists.")
        
func CallConfigCallback(modId: String, fileId: String, data: ConfigFile):
    if RegisteredMods.has(modId):
        if (RegisteredMods[modId].fileOnSaveCallbacks is Dictionary):
            if ((RegisteredMods[modId].fileOnSaveCallbacks.values()[0] as Callable).is_valid()):
                RegisteredMods[modId].fileOnSaveCallbacks.values()[0].call(data)
        else:
            if ((RegisteredMods[modId].fileOnSaveCallbacks as Callable).is_valid()):
                RegisteredMods[modId].fileOnSaveCallbacks.call(data)

func LoadInputs():
    for _modId in RegisteredMods:
        var _config = GetModConfigFile(_modId)
        if _config.has_section("Keycode"):
            var _keycodes = _config.get_section_keys("Keycode")
            for _action in _keycodes:
                var _configValues = _config.get_value("Keycode", _action)
                if ("type" not in _configValues):
                    _configValues["type"] = "Key"
                
                # Check to see if the keybind has either been added by another mod or already added to
                #   the input map already. Give a warning if a different mod already added it
                #   and just skip if the same mod has already added it to the inputmap already.
                if (RegisteredModKeybinds.has(_action)):
                    if (RegisteredModKeybinds.get(_action) != _modId):
                        push_warning("[MCM] " + _modId + " has tried registering the action " + _action + " and failed. This action name is already being used by the mod: " + RegisteredModKeybinds.get(_action))
                        continue
                    elif (InputMap.has_action(_action)):
                        continue
                    elif (!InputMap.has_action(_action)):
                        RegisteredModKeybinds.erase(_action)
                
                LoadInput(_modId, _action, _configValues)
                    
func LoadInput(modId: String, action: String, configValues: Dictionary):    
    var _actionEvent
    var _type = configValues["type"]
    var _keycode = configValues["value"]
    
    if (_type == "Mouse"):
        _actionEvent = InputEventMouseButton.new()
        _actionEvent.button_index = _keycode
    else:
        _actionEvent = InputEventKey.new()
        _actionEvent.physical_keycode = _keycode
        
    if("altPressed" not in configValues.keys()): 
        configValues["altPressed"] = false if "default_modifiers" not in configValues.keys() else configValues["default_modifiers"]["alt"]
    if("controlPressed" not in configValues.keys()):
        configValues["controlPressed"] = false if "default_modifiers" not in configValues.keys() else configValues["default_modifiers"]["control"]
    if("metaPressed" not in configValues.keys()):
        configValues["metaPressed"] = false if "default_modifiers" not in configValues.keys() else configValues["default_modifiers"]["meta"]
    if("shiftPressed" not in configValues.keys()):
        configValues["shiftPressed"] = false if "default_modifiers" not in configValues.keys() else configValues["default_modifiers"]["shift"]
        
    _actionEvent.alt_pressed = configValues["altPressed"]
    _actionEvent.ctrl_pressed = configValues["controlPressed"]
    _actionEvent.meta_pressed = configValues["metaPressed"]
    _actionEvent.shift_pressed = configValues["shiftPressed"]
    
    InputMap.add_action(action)
    InputMap.action_add_event(action, _actionEvent)
    
    RegisteredModKeybinds[action] = modId
    
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
                
                if (_originalEventKeycode != _configData["value"]
                || _originalEvent.alt_pressed != _configData["altPressed"]
                || _originalEvent.ctrl_pressed != _configData["controlPressed"]
                || _originalEvent.meta_pressed != _configData["metaPressed"]
                || _originalEvent.shift_pressed != _configData["shiftPressed"]):                        
                    var _actionEvent
                    
                    if (_configData["type"] == "Mouse"):
                        _actionEvent = InputEventMouseButton.new()
                        _actionEvent.button_index = _configData["value"]
                    else:
                        _actionEvent = InputEventKey.new()
                        _actionEvent.physical_keycode = _configData["value"]
                        
                    _actionEvent.alt_pressed = _configData["altPressed"]
                    _actionEvent.ctrl_pressed = _configData["controlPressed"]
                    _actionEvent.meta_pressed = _configData["metaPressed"]
                    _actionEvent.shift_pressed = _configData["shiftPressed"]
                
                    InputMap.action_erase_events(_action)
                    InputMap.action_add_event(_action, _actionEvent)

func GetModConfigFile(modId: String) -> ConfigFile:
    var _fileName = GetModConfigFileName(modId)
    
    # For backwards compatibility we need to check if any mods that aren't
    #   checking for profiles has a profile specific config file
    if CurrentModLoaderProfile != DefaultConfigFileName:
        if !FileAccess.file_exists(RegisteredMods[modId].filePath + _fileName):
            var _defaultConfig = ConfigFile.new()
            # Load the already created default config file
            _defaultConfig.load(RegisteredMods[modId].filePath + GetDefaultConfigFileName(modId))
            # Now resave the default config as the new profile config file
            _defaultConfig.save(RegisteredMods[modId].filePath + _fileName)
        
    var _config = ConfigFile.new()
    _config.load(RegisteredMods[modId].filePath + _fileName)
    return _config
    
func GetModConfigFileName(modId: String) -> String:
    var _fileName = CurrentModLoaderProfile + ".ini"
    
    if (CurrentModLoaderProfile == DefaultConfigFileName and RegisteredMods[modId].fileOnSaveCallbacks is Dictionary):
        _fileName = RegisteredMods[modId].fileOnSaveCallbacks.keys()[0]
        
    return _fileName

func GetDefaultConfigFileName(modId: String) -> String:
    var _fileName = DefaultConfigFileName + ".ini"
    
    if (RegisteredMods[modId].fileOnSaveCallbacks is Dictionary):
        _fileName = RegisteredMods[modId].fileOnSaveCallbacks.keys()[0]
        
    return _fileName
    
func GetModConfigFilePath(modId: String) -> String:
    var _fileName = GetModConfigFileName(modId)
    return RegisteredMods[modId].filePath + _fileName
    
func ToggleMCMMenu():
    if MCMMenu.visible:
        SettingsMenu.show()
        MCMMenu.hide()
    else:
        SettingsMenu.hide()
        MCMMenu.show()
