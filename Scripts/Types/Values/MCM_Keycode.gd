extends MCM_Value
class_name MCM_Keycode
## Allows players the input a custom keybind as a value.

# Required Properties
## The input type the default key is set to.
var DefaultType: MCM_Config.MCM_Key_Types

# Optional Properties
## The default modifier keys that need to be pressed alongside the default key
## to register as an input.
var DefaultModifiers: Array[MCM_Config.MCM_Modifiers] = []

func _init(id: String, name: String, tooltip: String, default: Key, 
            defaultType: MCM_Config.MCM_Key_Types
) -> void:
    DefaultType = defaultType
    
    super(
        "Keycode",
        id, name, tooltip, default
    )

## Set the default modifiers that need to be pressed alongside the assigned
## keycode. Will also validate a modifier isn't being added that is the same
## as the assigned default key.
func setDefaultModifiers(defaultModifiers: Array[MCM_Config.MCM_Modifiers]) -> MCM_Keycode:
    if(MCM_Config.MCM_Modifiers.ALT in defaultModifiers && Default == KEY_ALT):
        defaultModifiers.erase(MCM_Config.MCM_Modifiers.ALT)
        
    if(MCM_Config.MCM_Modifiers.CONTROL in defaultModifiers && Default == KEY_CTRL):
        defaultModifiers.erase(MCM_Config.MCM_Modifiers.CONTROL)
        
    if(MCM_Config.MCM_Modifiers.META in defaultModifiers && Default == KEY_META):
        defaultModifiers.erase(MCM_Config.MCM_Modifiers.META)
        
    if(MCM_Config.MCM_Modifiers.SHIFT in defaultModifiers && Default == KEY_SHIFT):
        defaultModifiers.erase(MCM_Config.MCM_Modifiers.SHIFT)
    
    DefaultModifiers = defaultModifiers
    return self

## Add the alt key to be pressed as a modifier alongside the assigned keycode. 
## Will also validate a modifier isn't being added that is the same as the 
## assigned default key.
func addAltModifier() -> MCM_Keycode:
    if(MCM_Config.MCM_Modifiers.ALT not in DefaultModifiers && Default != KEY_ALT):
        DefaultModifiers.append(MCM_Config.MCM_Modifiers.ALT)
        
    return self
    
## Add the control key to be pressed as a modifier alongside the assigned
## keycode. ill also validate a modifier isn't being added that is the same as
## the assigned default key.
func addControlModifier() -> MCM_Keycode:
    if(MCM_Config.MCM_Modifiers.CONTROL not in DefaultModifiers && Default != KEY_CTRL):
        DefaultModifiers.append(MCM_Config.MCM_Modifiers.CONTROL)
        
    return self
    
## Add the meta/windows key to be pressed as a modifier alongside the assigned 
## keycode. Will also validate a modifier isn't being added that is the same
## as the assigned default key.
func addMetaModifier() -> MCM_Keycode:
    if(MCM_Config.MCM_Modifiers.META not in DefaultModifiers && Default != KEY_META):
        DefaultModifiers.append(MCM_Config.MCM_Modifiers.META)
        
    return self
    
## Add the shift key to be pressed as a modifier alongside the assigned keycode.
## Will also validate a modifier isn't being added that is the same as the 
## assigned default key.
func addShiftModifier() -> MCM_Keycode:
    if(MCM_Config.MCM_Modifiers.SHIFT not in DefaultModifiers && Default != KEY_SHIFT):
        DefaultModifiers.append(MCM_Config.MCM_Modifiers.SHIFT)
        
    return self
    
## Internal Use Only. Do [b]not[/b] call this method directly.[br]
## Use [code]MCM_Config.RegisterMod()[/code] instead.
func createConfigObject() -> Dictionary:
    var _superObject = super()
    
    var _defaultType = ""
    match (DefaultType):
        MCM_Config.MCM_Key_Types.KEY:
            _defaultType = "Key"
        MCM_Config.MCM_Key_Types.MOUSE:
            _defaultType = "Mouse"
            
    var _defaultModifiers = {
        "alt": MCM_Config.MCM_Modifiers.ALT in DefaultModifiers,
        "control": MCM_Config.MCM_Modifiers.CONTROL in DefaultModifiers,
        "meta": MCM_Config.MCM_Modifiers.META in DefaultModifiers,
        "shift": MCM_Config.MCM_Modifiers.SHIFT in DefaultModifiers
    }
    
    _superObject["altPressed"] = _defaultModifiers["alt"]
    _superObject["controlPressed"] = _defaultModifiers["control"]
    _superObject["metaPressed"] = _defaultModifiers["meta"]
    _superObject["shiftPressed"] = _defaultModifiers["shift"]
    
    _superObject.merge({
        "default_type": _defaultType,
        "default_modifiers": _defaultModifiers
    })
    
    return _superObject
