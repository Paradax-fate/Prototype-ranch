class_name grid

var width = 10
var height = 10
var base = []

func _init():
	create_matrix()

func create_matrix():
	base.clear()
	
	for y in range(height):
		var row = []
		for x in range(width):
			row.append(null)
		base.append(row)


func can_place(room, pos_x, pos_y):
	
	if pos_x + room.width > width:
		return false
		
	if pos_y + room.height > height:
		return false
	
	for y in range(room.height):
		for x in range(room.width):
			if base[pos_y + y][pos_x + x] != null:
				return false
	
	return true


func place(room, pos_x, pos_y):
	for y in range(room.height):
		for x in range(room.width):
			base[pos_y + y][pos_x + x] = room
