extends MCM_Value
class_name MCM_Collection
## The base type for MCM values that hold a collection of inputs
##
## DO NOT USE THIS CLASS[br]Use either [MCM_Array] or [MCM_Dictionary] instead

# Required Properties
## Sets the type of inputs to be displayed to the player when adding items to 
## the array.
var ValueType: MCM_Config.MCM_Collection_Types
## The default value assigned when the player creates a new item in the
## collection.
var DefaultItemValue

# Optional Properties
## How many items the player is able to add to the array. If this property is 
## not set it allows the player to add as many as they wish.
## [br][br]Anything less than or equal to zero = infinite entries
var MaxItems: int = 0
## Sets if the Collection is expanded by default or not
var Expanded: bool = false
## Sets if the player can add and delete items from the collection
var CanDeleteAndAdd: bool = true

# Optional Number Properties
## The minimum value the player is able to set the value to in the configuration
## menu.[br]Only used if the ValueType inherits MCM_Number
var MinRange = null
## The maximum value the player is able to set the value to in the configuration
## menu.[br]Only used if the ValueType inherits MCM_Number
var MaxRange = null
## How much is added per step in both the Slider and SpinBox input. Also controls
## how many decimal places are allowed if it accepts floating point numbers
## [br]Only used if the ValueType inherits MCM_Number
var Step = null

## The accepted variable types a collection type accepts
const AcceptedNumberValueTypes: Dictionary = {
    MCM_Config.MCM_Collection_Types.FLOAT: TYPE_FLOAT,
    MCM_Config.MCM_Collection_Types.INT: TYPE_INT,
    MCM_Config.MCM_Collection_Types.VECTOR2: TYPE_VECTOR2,
    MCM_Config.MCM_Collection_Types.VECTOR3: TYPE_VECTOR3
}

func _init(section: String, id: String, name: String, tooltip: String, default,
            valueType: MCM_Config.MCM_Collection_Types, defaultItemValue
) -> void:
    ValueType = valueType
    DefaultItemValue = defaultItemValue
    
    super(section, id, name, tooltip, default)
    
## Set how many items the player is allowed to enter into the collection.
func setMaxItems(maxItems: int) -> MCM_Collection:
    MaxItems = maxItems
    return self

## Set if the collection should be default expanded in the MCM  
func setExpanded(expanded: bool) -> MCM_Collection:
    Expanded = expanded
    return self
   
## Sets if the player can add and delete items from the collection
func setCanDeleteAndAdd(canDeleteAndAdd: bool) -> MCM_Collection:
    CanDeleteAndAdd = canDeleteAndAdd
    return self
    
# Optional setter functions for Number value types
## Set the minimum value this value can be set to
func setMinRange(minRange) -> MCM_Collection:
    if(ValueType not in AcceptedNumberValueTypes.keys()): return self
    if(typeof(minRange) != AcceptedNumberValueTypes[ValueType]): return self
    
    MinRange = minRange
    return self

## Set the maximum value this value can be set to
func setMaxRange(maxRange) -> MCM_Collection:
    if(ValueType not in AcceptedNumberValueTypes.keys()): return self
    if(typeof(maxRange) != AcceptedNumberValueTypes[ValueType]): return self
    
    MaxRange = maxRange
    return self
   
## Set how much the UI SpinBox/Slider increments/decrements the value.
func setStep(step) -> MCM_Collection:
    if(ValueType not in AcceptedNumberValueTypes.keys()): return self
    if(typeof(step) != AcceptedNumberValueTypes[ValueType]): return self
    
    Step = step
    return self
  
## Internal Use Only. Do [b]not[/b] call this method directly.[br]
## Use [code]MCM_Config.RegisterMod()[/code] instead.  
func createConfigObject() -> Dictionary:
    var _superObject = super()
    
    var _valueType = ""
    match(ValueType):
        MCM_Config.MCM_Collection_Types.STRING:
            _valueType = "String"
        MCM_Config.MCM_Collection_Types.INT:
            _valueType = "Int"
        MCM_Config.MCM_Collection_Types.FLOAT:
            _valueType = "Float"            
        MCM_Config.MCM_Collection_Types.BOOLEAN:
            _valueType = "Bool"
        MCM_Config.MCM_Collection_Types.COLOR:
            _valueType = "Color"
        MCM_Config.MCM_Collection_Types.VECTOR2:
            _valueType = "Vector2"
        MCM_Config.MCM_Collection_Types.VECTOR3:
            _valueType = "Vector3"
    
    _superObject.merge({
        "valueType": _valueType,
        "defaultItemValue": DefaultItemValue,
        "expanded": Expanded,
        "canDeleteAndAdd": CanDeleteAndAdd
    })
    
    if(MaxItems > 0): _superObject["maxItems"] = MaxItems
    if(MinRange != null): _superObject["minRange"] = MinRange
    if(MaxRange != null): _superObject["maxRange"] = MaxRange
    if(Step != null): _superObject["step"] = Step
    
    return _superObject
