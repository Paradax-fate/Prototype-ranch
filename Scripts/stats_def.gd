extends Resource
class_name StatsDef

@export var type: Enums.Type

@export var min_value: float = 0.0
@export var max_value: float = 100.0
@export var value: float = 0.0

func set_value(new_value : float):
	value = clamp(new_value,min_value,max_value)
