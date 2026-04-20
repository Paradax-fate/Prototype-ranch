extends Resource
class_name Allele

var dominancy : Enums.Dominacy
var value : float
var stability : float

func _init(istat : StatsDef) -> void:
	value = randf_range(istat.min_value,istat.max_value)
	stability = _new_stability(value, istat.min_value, istat.max_value)
	dominancy = Enums.Dominacy.values().pick_random()

func _new_stability(ivalue: float, imin: float, imax: float):
	var normal : float = (ivalue - imin) / (imax - imin)
	
	var stability_min : float = lerp(0.0,Const.MIN_STABILITY,normal)
	var stability_max : float = lerp(Const.MAX_STABILITY,0.0,normal)
	
	return randf_range(stability_min, stability_max)
