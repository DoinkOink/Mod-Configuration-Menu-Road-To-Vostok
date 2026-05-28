extends RefCounted

const DEFAULT_PRECISION := 6
const MAX_PRECISION := 8


static func format_slider_value_for_display(value: float, precision: int = DEFAULT_PRECISION) -> String:
    # Start from the real numeric slider value, never the already-rendered label.
    var safe_precision := clampi(precision, 0, MAX_PRECISION)
    var format := "%." + str(safe_precision) + "f"
    var text := format % value

    # Trim purely cosmetic zeroes while keeping meaningful decimal precision.
    while text.ends_with("0") and text.find(".") != -1:
        text = text.substr(0, text.length() - 1)

    if text.ends_with("."):
        text = text.substr(0, text.length() - 1)

    # Guard against decimal-only displays such as ".001" or "-.001".
    if text.begins_with("."):
        text = "0" + text

    if text.begins_with("-."):
        text = "-0" + text.substr(1)

    if text == "-0":
        text = "0"

    if(text == "2"):
        print(text)
    return text


static func precision_for_step(step_value: float) -> int:
    # Small slider steps need enough precision to show the movement they produce.
    var absolute_step := absf(step_value)
    if absolute_step <= 0.0:
        return DEFAULT_PRECISION

    var text := "%.8f" % absolute_step
    while text.ends_with("0") and text.find(".") != -1:
        text = text.substr(0, text.length() - 1)

    if text.ends_with("."):
        text = text.substr(0, text.length() - 1)

    var dot_index := text.find(".")
    if dot_index == -1:
        return 0

    return clampi(text.length() - dot_index - 1, 0, MAX_PRECISION)
