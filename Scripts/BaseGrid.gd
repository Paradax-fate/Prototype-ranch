
# res://Scripts/BaseGrid.gd
extends Node2D

# Ruta al GridRenderer en la escena
@export var grid_renderer_path: NodePath
@export var room_texture_path: String = "res://Sprite/Reference/Cuadrado rojo.jpg"
@export var target_cell: Vector2i = Vector2i(0, 0) 


@export var enable_runtime_place: bool = true

func _ready() -> void:
	var grid_renderer = get_node(grid_renderer_path) as Node
	if grid_renderer:
		_place_in_target(grid_renderer)
	else:
		print("GridRenderer no encontrado en la ruta: ", grid_renderer_path)

func _place_in_target(grid_renderer: Node) -> void:
	var room_tex = load(room_texture_path)
	if room_tex is Texture2D:
		grid_renderer.call("place_room_in_cell_full_image", target_cell.x, target_cell.y, room_tex)
	else:
		print("No se pudo cargar la textura de habitación desde: ", room_texture_path)

func _unhandled_input(event):
	
	if event is InputEventKey and event.pressed		match event.scancode:
			KEY_Q:
				_place_at(0, 0)
			KEY_W:
				_place_at(1, 0)
			KEY_E:
				_place_at(0, 1)
			KEY_R:
				_place_at(1, 1)
			KEY_A:
				_place_at(2, 2)
			KEY_S:
				_place_at(3, 2)
			_:
				pass

func _place_at(x: int, y: int) -> void:
	var grid_renderer = get_node(grid_renderer_path)
	if grid_renderer:
		var tex = load(room_texture_path)
		if tex is Texture2D:
			grid_renderer.call("place_room_in_cell_full_image", x, y, tex)
