extends Node

#resorce stats (this stats are not part of the other stats since they are resources) 
# for example the current_health which is related to the stat health

var current_health : float
var current_energy : float

var base : Stats = $Base.stats
var final : Stats = $Final.stats
var genes : Genome = $Genome.genome

var parent_A : Genome = null
var parent_B : Genome = null

func modify_defaults():
	final.stats = base.stats.duplicate(true)
	genes.modify_stats(final)

func start():
	new_creature()
	start_resources()

func new_creature():
	pass

func start_resources():
	modify_defaults()
	current_health = final.stats[Enums.Type.HEALTH].value
	current_energy = final.stats[Enums.Type.ENERGY].value
	
	
