extends Node
class_name Stats

@export var stats : Dictionary[Enums.Type,StatsDef]

func modify_stat (value: float, type: Enums.Type):
	var new_value = stats[type].value + value
	stats[type].set_value(new_value)
