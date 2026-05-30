class_name FormatSpinBox extends SpinBox
## A format field for numbers that allows for more control than [SpinBox].
##
## This can be used to, for example, always display values with a specific precision.
## [code]%.2f[/code] will display floats with two decimal places.

var precision: int = 0
var originalSize: Vector2
const Formatter = preload("res://ModConfigurationMenu/Scripts/SliderFormatter.gd")

# Connect the signal handlers required to make this work seamlessly.
func _ready() -> void:
    value_changed.connect(_on_value_changed, CONNECT_DEFERRED)
    get_line_edit().focus_entered.connect(_on_focus_entered, CONNECT_DEFERRED)
    get_line_edit().focus_exited.connect(_on_focus_exited, CONNECT_DEFERRED)
    
    originalSize = Vector2(get_line_edit().size.x, get_line_edit().size.y)

# This handler ensures the format is maintained while editing the field.
func _on_value_changed(newValue: float) -> void:
    # For some reason the SpinBox will switch to their minimum values on init. 
    #   This stops it from doing that. ¯\_(ツ)_/¯
    if (newValue != value):
        return
        
    var _text = Formatter.format_slider_value_for_display(newValue, precision)
    get_line_edit().text = Formatter.format_slider_value_for_display(newValue, precision)

# This handler ensures the format is retained when entering the field.
func _on_focus_entered() -> void:
    get_line_edit().text = Formatter.format_slider_value_for_display(value, precision)#

# This handler ensures the format is retained when exiting the field.
func _on_focus_exited() -> void:
    get_line_edit().text = Formatter.format_slider_value_for_display(value, precision)
    
    UpdateCarret()
    
func UpdatePrecision():
    precision = Formatter.precision_for_step(step)
    get_line_edit().text = Formatter.format_slider_value_for_display(value, precision)
    
func UpdateWidth():
    var _font = get_theme_font("font")
    var _fontSize = get_theme_font_size("font_size")
    var _textWidth = _font.get_string_size(str(value), HORIZONTAL_ALIGNMENT_LEFT, -1, _fontSize)
    var _width = max(_textWidth.x + 30, originalSize.x)
    custom_minimum_size = Vector2(_width, originalSize.y)
    
func UpdateCarret():
    # Keep the whole-number side visible when the field is too narrow for every digit.
    if get_line_edit().text.find(".") != -1:
        get_line_edit().caret_column = 0
    else:
        get_line_edit().caret_column = get_line_edit().text.length()
