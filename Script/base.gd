extends Node2D
var colonia
var cell_size = 64

func _ready():
	colonia = Colon.new()
	dibujar_colonia()


func dibujar_colonia():
	for y in range(10):
		for x in range(10):
			
			var celda = ColorRect.new()
			celda.size = Vector2(cell_size, cell_size)
			celda.color = Color(0.2, 0.2, 0.2)
			
			celda.position = Vector2(
				x * cell_size,
				y * cell_size
			)
						
			add_child(celda)
