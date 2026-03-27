extends Node2D
class_name Creature

enum genders { FEMALE, MALE, NONE}

@export var kind: PackedScene
@export var sprite: Texture2D
var gender : genders  = genders.NONE
var genes : Array[Gen]

@export var life = 100
@export var attack = 25
@export var defense = 5.0
@export var speed = 1.5
@export var energy = 100

func modify_defaults():
	for gen in genes:
		gen.effect_on_creature(self)

func create_baby(partner: Creature):
	if gender != genders.MALE:
		var child = kind.instantiate()
		get_tree().add_child(child)
		child.modify_defaults
		
func add_genes(parent_one, parent_two, child):
	pass
