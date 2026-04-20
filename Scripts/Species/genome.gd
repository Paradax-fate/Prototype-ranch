extends StatsContainer
class_name Genome

@export var genes : Dictionary[Enums.Type,Gene]
var parent_A : Genome
var parent_B : Genome
var stability : float


func modify_stats(istats: Stats):
	for gene in genes.values():
		gene.effect_on_creature(istats)

func _init(istats: Stats,iparent_A: Genome = null, iparent_B : Genome = null):
	parent_A = iparent_A
	parent_B = iparent_B
	genes = _generate_genes(istats, iparent_A, iparent_B)
	genes = _apply_mutation(istats)
		
func _generate_genes(istats: Stats,iparent_A: Genome = null, iparent_B : Genome = null):
	var new_genes : Dictionary[Enums.Type,Gene]
	if iparent_A == null:
		new_genes = _random_genes(istats)
		return new_genes
	if iparent_B == null:
		new_genes = iparent_A.genes.duplicate()
		return new_genes
	if iparent_A != null and iparent_B != null:
		new_genes = _select_genes(istats, iparent_A, iparent_B)
		return new_genes
		
func _random_genes(istats: Stats):
	var new_genes : Dictionary[Enums.Type,Gene] 
	for type in Enums.Type.values():
		var new_gene = Gene.new(istats[type])
		new_genes[type] = new_gene
	return new_genes
		
func _select_genes(istats: Stats,iparent_A: Genome, iparent_B : Genome):
	var new_genes : Dictionary[Enums.Type,Gene] 
	for type in Enums.Type.values():
		var new_gene = Gene.new(istats[type],iparent_A.genes[type],iparent_B.genes[type])
		new_genes[type] = new_gene 
	return new_genes

func _apply_mutation(istats: Stats):
	_calculate_stability()
	for gene in genes.values():
		gene.mutate(stability, istats[gene.type])
	_calculate_stability()
	return genes
	
func _calculate_stability():
	var new_stability : float = 0
	for gene in genes.values():
		new_stability += gene.stability
		
	var min_possible: float = genes.size() * Const.MIN_STABILITY
	var max_possible: float = genes.size() * Const.MAX_STABILITY
	stability = (new_stability - min_possible) / (max_possible - min_possible) 
