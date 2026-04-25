extends Resource
class_name Allele

var dominancy : Enums.Dominacy
var value : float

func _init(stat : StatsDef) -> void:
	value = randf_range(stat.min_value,stat.max_value)
	dominancy = Enums.Dominacy.values().pick_random()
