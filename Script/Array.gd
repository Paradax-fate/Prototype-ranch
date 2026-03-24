class_name Colon

var width = 10
var height = 10
var BASE = []

func _init():
	crear_matriz()

func crear_matriz():
	BASE.clear()
	
	for y in range(height):
		var fila = []
		for x in range(width):
			fila.append(null)
		BASE.append(fila)


func puede_colocar(habitacion, pos_x, pos_y):
	
	if pos_x + habitacion.width > width:
		return false
		
	if pos_y + habitacion.height > height:
		return false
	
	for y in range(habitacion.height):
		for x in range(habitacion.width):
			if BASE[pos_y + y][pos_x + x] != null:
				return false
	
	return true

func colocar(habitacion, pos_x, pos_y):
	for y in range(habitacion.height):
		for x in range(habitacion.width):
			BASE[pos_y + y][pos_x + x] = habitacion
