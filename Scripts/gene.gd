extends Resource
class_name Gene

var _parent_A : Allele
var _parent_B : Allele
var type : Enums.Type
func _init(stat : StatsDef, parent_A : Gene = null, parent_B: Gene = null) -> void:
	self.type = stat.type
	self._parent_A = Allele.new(stat) if parent_A == null else parent_A.get_random_allele()
	self._parent_B = Allele.new(stat) if parent_A == null else parent_B.get_random_allele()
	
func get_random_allele():
	return [_parent_A,_parent_B].pick_random()

func effect_on_creature(stats: Stats):
	stats.modify_stat(allele_calculation(),type)
	
func allele_calculation():
	if _parent_A.dominancy == _parent_B.dominancy:
		return (_parent_A.value + _parent_B.value) / 2
	if _parent_A.dominancy == Enums.Dominacy.DOMINANT:
		return _parent_A.value
	if _parent_B.dominancy == Enums.Dominacy.DOMINANT:
		return _parent_B.value
