extends Node

var mcmMenuScene = preload("res://ModConfigurationMenu/UI/Doink Oink/UI_MCM.tscn")
var MCMHelpers = preload("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")
var MCMButtonIcon = load("res://ModConfigurationMenu/Sprites/UI/Doink Oink/MCM-Logo.png")

# In order to not override Settings.gd, which can only be overridden once, we create
#	the button and menu in our main file and store all associated variables in MCM_Helpers.
#	Between each scene the MCMButton is set to be freed so we can just check if
#	it currently exists. If it doesn't then we go ahead and create it again.
func _process(_delta):
    if !MCMHelpers.MCMButton && get_tree().current_scene:
        CreateMCMButton()

func _ready():
    name = "MCM"
    
    var _dir = DirAccess.open("user://MCM")
    if !_dir:
        DirAccess.open("user://").make_dir("user://MCM")
    
    overrideScript("res://ModConfigurationMenu/Scripts/Overrides/Inputs.gd")
    overrideScript("res://ModConfigurationMenu/Scripts/Overrides/UIManager.gd")
    overrideScript("res://ModConfigurationMenu/Scripts/Overrides/Menu.gd")
    
func overrideScript(overrideScriptPath: String):
    var script: Script = load(overrideScriptPath)
    script.reload()
    var parentScript = script.get_base_script()
    script.take_over_path(parentScript.resource_path)
    
func CreateMCMButton():
    # Even though the menu travels between each scene the menu for whatever reason
    #	loses all inputs and buttons can't be pressed. So we have to free the menu
    #	and then instantiate it again.
    if MCMHelpers.MCM_Menu:
        MCMHelpers.MCM_Menu.queue_free()
        
    var _sceneName = get_tree().current_scene.name    
    var _settings = get_tree().root.find_child("UI_Settings", true, false)   
    
    print(_sceneName) 
    
    if (_sceneName == "Death"):
        return
    
    if (_settings):
        MCMHelpers.SettingsMenu = _settings
    else:
        MCMHelpers.SettingsMenu = get_tree().root.find_child("Map", true, false).find_child("Settings", true, false)
    
    # Just incase the settings menu wasn't found break out so we don't cause any issues.
    if (!MCMHelpers.SettingsMenu):
        return
        
    MCMHelpers.MCM_Menu = mcmMenuScene.instantiate()
    MCMHelpers.MCM_Menu.uiManager = self
    MCMHelpers.MCM_Menu.hide()
    
    if _sceneName == "Menu":
        MCMHelpers.SettingsMenu.get_parent().visibility_changed.connect(_on_settings_visibility_changed)
        get_tree().root.add_child(MCMHelpers.MCM_Menu)
    else:
        MCMHelpers.SettingsMenu.get_parent().add_child(MCMHelpers.MCM_Menu)

    var _button = Button.new()
    _button.tooltip_text = "Mod Configuration Menu"
    _button.icon = MCMButtonIcon
    _button.expand_icon = true
    _button.add_theme_constant_override("icon_max_width", 35)
    _button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER

    var _buttonSize = Vector2(55,55)
    _button.size.x = _buttonSize.x
    _button.size.y = _buttonSize.x
        
    _button.set_anchor(SIDE_LEFT, 1)
    _button.set_anchor(SIDE_TOP, 0)
    _button.set_anchor(SIDE_RIGHT, 1)
    _button.set_anchor(SIDE_BOTTOM, 0)
    
    _button.set_position(Vector2(- (_buttonSize.x + 30), 30))
    
    MCMHelpers.MCMButton = _button
    
    if _sceneName == "Menu":
        MCMHelpers.MCMButton.visible = false
        MCMHelpers.SettingsMenu.get_parent().get_parent().add_child(MCMHelpers.MCMButton)
    else:
        MCMHelpers.SettingsMenu.add_child(MCMHelpers.MCMButton)

    MCMHelpers.MCMButton.button_down.connect(MCMHelpers.ToggleMCMMenu)

func _on_settings_visibility_changed():
    if MCMHelpers.SettingsMenu:
        MCMHelpers.MCMButton.visible = MCMHelpers.SettingsMenu.get_parent().visible
