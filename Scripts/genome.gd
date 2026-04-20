extends Node
class_name Genome

@export var genes : Dictionary[Enums.Type,Gene]

func modify_stats(stats: Stats):
	for gene in genes.values():
		gene.effect_on_creature(stats)

func _init(stats: Stats,parent_A: Genome = null, parent_B : Genome = null):
	if parent_A == null and parent_B == null:
		genes = random_genes(stats)	
	if parent_A == null:
		genes = parent_A.genes.duplicate()
	if parent_B == null:
		genes = parent_B.genes.duplicate()
	if parent_A != null and parent_B != null:
		genes = select_genes(stats, parent_A, parent_B)
		
	
func random_genes(stats: Stats):
	var genes : Dictionary[Enums.Type,Gene] 
	for type in Enums.Type.values():
		var new_gene = Gene.new(stats[type])
		genes[type] = new_gene
		
func select_genes(stats: Stats,parent_A: Genome, parent_B : Genome):
	var genes : Dictionary[Enums.Type,Gene] 
	for type in Enums.Type.values():
		var new_gene = Gene.new(stats[type],parent_A.genes[type],parent_B.genes[type])
		genes[type] = new_gene 
