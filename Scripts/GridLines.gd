# res://Scripts/GridLines.gd
extends Node2D

@export var grid_size := Vector2i(10, 10)
@export var cell_size := Vector2(64, 64)
@export var line_color: Color = Color8(180, 180, 180)
@export var line_thickness := 2.0

func _draw():
	var w = grid_size.x * cell_size.x
	var h = grid_size.y * cell_size.y
	
	for x in range(grid_size.x + 1):
		var px = x * cell_size.x
		draw_line(Vector2(px, 0), Vector2(px, h), line_color, line_thickness)
	
	for y in range(grid_size.y + 1):
		var py = y * cell_size.y
		draw_line(Vector2(0, py), Vector2(w, py), line_color, line_thickness)

func _ready():
	
	self.call_deferred("update")

func _notification(what):
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		
		self.call_deferred("update")
