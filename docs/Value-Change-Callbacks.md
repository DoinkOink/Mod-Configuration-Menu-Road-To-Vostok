## MCM Value Change Callbacks

### Overview

MCM supports real-time callbacks when a user changes a setting in the MCM UI. Callbacks fire immediately as the user interacts — not just on save. This enables linked settings, live previews, and cross-element validation.

### Setup

**1. Pass your config node as `callbackObject` when registering:**

```gdscript
McmHelpers.RegisterConfiguration(
    "my-mod",
    "My Mod",
    FILE_PATH,
    "Description",
    { "config.ini" = _on_config_updated },
    self  # <-- callbackObject
)
```

**2. Add `"on_value_changed"` to any setting's config dict:**

```gdscript
config.set_value("Int", "my_slider", {
    "name" = "My Slider",
    "tooltip" = "...",
    "default" = 50,
    "value" = 50,
    "minRange" = 0,
    "maxRange" = 100,
    "on_value_changed" = "on_my_slider_changed"  # method name as string
})
```

**3. Define the callback method on your config node:**

```gdscript
func on_my_slider_changed(valueId: String, newValue, menu: MCMMenu):
    pass
```

### Callback Signature

```gdscript
func callback_name(valueId: String, newValue, menu: MCMMenu)
```

| Parameter | Type | Description |
|---|---|---|
| `valueId` | String | The config key that changed (e.g. `"my_slider"`) |
| `newValue` | Variant | The new value (int/float for sliders, int for dropdowns, bool for toggles, String for text, Color for color pickers) |
| `menu` | MCMMenu | The menu instance — call `menu.GetElements()` to access sibling settings |

### Accessing Other Settings

`menu.GetElements()` returns a `Dictionary` of `{ valueId: element_node }`. Each element has a `SetValue(newValue)` method to programmatically update it.

```gdscript
func on_something_changed(valueId: String, newValue, menu: MCMMenu):
    var elements = menu.GetElements()
    if elements.has("other_setting"):
        elements["other_setting"].SetValue(42)
```

`SetValue()` updates the UI without triggering callbacks, preventing infinite recursion.

### Supported Element Types

All MCM element types support `on_value_changed` and `SetValue()`:

| Type | `newValue` type | `SetValue()` accepts |
|---|---|---|
| Int | float (cast to int) | int/float |
| Float | float | float |
| Bool | bool | bool |
| String | String | String |
| Dropdown | int (selected index) | int (index) |
| Color | Color | Color |
| Keycode | InputEvent | int (keycode/button_index) |

### Examples

**Linked min/max sliders** — max can never be lower than min:

```gdscript
config.set_value("Int", "min_range", {
    "name" = "Minimum Range", "tooltip" = "...",
    "default" = 10, "value" = 10,
    "minRange" = 0, "maxRange" = 100,
    "on_value_changed" = "on_range_changed"
})
config.set_value("Int", "max_range", {
    "name" = "Maximum Range", "tooltip" = "...",
    "default" = 50, "value" = 50,
    "minRange" = 0, "maxRange" = 100,
    "on_value_changed" = "on_range_changed"
})

func on_range_changed(valueId: String, newValue, menu: MCMMenu):
    var elements = menu.GetElements()
    if valueId == "min_range":
        if elements.has("max_range") and int(elements["max_range"].sliderInput.value) < int(newValue):
            elements["max_range"].SetValue(int(newValue))
    elif valueId == "max_range":
        if elements.has("min_range") and int(elements["min_range"].sliderInput.value) > int(newValue):
            elements["min_range"].SetValue(int(newValue))
```

**Dropdown disables/enables a slider:**

```gdscript
config.set_value("Dropdown", "mode", {
    "name" = "Mode", "tooltip" = "...",
    "default" = 0, "value" = 0,
    "options" = ["Simple", "Advanced"],
    "on_value_changed" = "on_mode_changed"
})
config.set_value("Int", "advanced_param", {
    "name" = "Advanced Parameter", "tooltip" = "Only used in Advanced mode",
    "default" = 50, "value" = 50,
    "minRange" = 0, "maxRange" = 100
})

func on_mode_changed(valueId: String, newValue, menu: MCMMenu):
    var elements = menu.GetElements()
    if elements.has("advanced_param"):
        # Visually indicate disabled state
        elements["advanced_param"].modulate.a = 1.0 if newValue == 1 else 0.4
```

**Boolean toggle resets a value:**

```gdscript
config.set_value("Bool", "use_custom", {
    "name" = "Use Custom Value", "tooltip" = "...",
    "default" = false, "value" = false,
    "on_value_changed" = "on_use_custom_changed"
})
config.set_value("Int", "custom_value", {
    "name" = "Custom Value", "tooltip" = "...",
    "default" = 100, "value" = 100,
    "minRange" = 1, "maxRange" = 500
})

func on_use_custom_changed(valueId: String, newValue, menu: MCMMenu):
    var elements = menu.GetElements()
    if !newValue and elements.has("custom_value"):
        elements["custom_value"].SetValue(100)  # reset to default when toggled off
```

**Cascading tiers** (what Trader Improvements uses):

```gdscript
# Register 5 tier sliders with the same callback
for i in 5:
    config.set_value("Int", "tier" + str(i + 1), {
        "name" = "Tier " + str(i + 1),
        "tooltip" = "...",
        "default" = defaults[i],
        "value" = defaults[i],
        "minRange" = 1, "maxRange" = 1000,
        "on_value_changed" = "on_tier_changed"
    })

func on_tier_changed(valueId: String, newValue, menu: MCMMenu):
    var elements = menu.GetElements()
    var tier = int(valueId.split("tier")[1])
    # Push higher tiers up
    var prev = int(newValue)
    for i in range(tier + 1, 6):
        var key = "tier" + str(i)
        if elements.has(key) and int(elements[key].sliderInput.value) <= prev:
            elements[key].SetValue(prev + 1)
            prev += 1
        else:
            break
```
