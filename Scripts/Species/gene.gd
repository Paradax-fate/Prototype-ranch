extends Resource
class_name Gene

var _parent_A : Allele
var _parent_B : Allele
var type : Enums.Type

var value : float
var stability : float

func _init(istat : StatsDef, iparent_A : Gene = null, iparent_B: Gene = null) -> void:
	self.type = istat.type
	self._parent_A = Allele.new(istat) if iparent_A == null else iparent_A.get_allele()
	self._parent_B = Allele.new(istat) if iparent_A == null else iparent_B.get_allele()
	
func get_allele():
	return [_parent_A,_parent_B].pick_random()

func effect_on_creature(stats: Stats):
	stats.modify_stat(allele_calculation(),type)
	
func allele_calculation():
	if _parent_A.dominancy == _parent_B.dominancy:
		value = (_parent_A.value + _parent_B.value) / 2
		stability =  (_parent_A.stability + _parent_B.stability) / 2
		return value
	if _parent_A.dominancy == Enums.Dominacy.DOMINANT:
		value = _parent_A.value
		stability = _parent_A.stability
		return value
	if _parent_B.dominancy == Enums.Dominacy.DOMINANT:
		value = _parent_B.value
		stability = _parent_B.stability
		return value
		
func mutate(istability: float, istat: StatsDef):
	var mutation_change : float = lerp(Const.MAX_MUTATION_CHANCE, Const.MIN_MUTATION_CHANCE, istability)
	if(randf() < mutation_change):
		_parent_A = Allele.new(istat)
	if(randf() < mutation_change):
		_parent_B = Allele.new(istat)
