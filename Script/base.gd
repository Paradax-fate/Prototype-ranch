extends Node2D

var grid_data
var cell_size = 64

@onready var debug_label = $DebugLabel


func matrix_to_text():
	var text = ""
	
	for row in grid_data.base:
		text += str(row) + "\n"
	
	return text


func _ready():
	grid_data = grid.new()
	
	debug_label.text = matrix_to_text()
	
	draw_grid()


func draw_grid():
	for y in range(10):
		for x in range(10):
			
			var cell = ColorRect.new()
			cell.size = Vector2(cell_size, cell_size)
			cell.color = Color(0.2, 0.2, 0.2)
			
			cell.position = Vector2(
				x * cell_size,
				y * cell_size
			)
						
			add_child(cell)
