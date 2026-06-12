# res://Scripts/Grid.gd
extends Node

const GRID_SIZE := Vector2i(10, 10)

var grid: Array = []

signal cell_changed(x: int, y: int, data)

func _ready() -> void:
	_init_grid()

func _init_grid() -> void:
	
	grid = []
	for y in range(GRID_SIZE.y):
		var row: Array = []
		for x in range(GRID_SIZE.x):
			row.append(null)
		grid.append(row)

func is_inside(x: int, y: int) -> bool:
	return x >= 0 and y >= 0 and x < GRID_SIZE.x and y < GRID_SIZE.y

func get_cell(x: int, y: int):
	
	if not _is_grid_inited():
		_init_grid()
	if not is_inside(x, y):
		return null
	return grid[y][x]

func set_cell(x: int, y: int, value):
	
	if not _is_grid_inited():
		_init_grid()
	if not is_inside(x, y):
		return
	grid[y][x] = value
	emit_signal("cell_changed", x, y, value)

func _is_grid_inited() -> bool:
	return typeof(grid) != TYPE_NIL and grid.size() > 0
