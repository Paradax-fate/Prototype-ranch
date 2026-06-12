# res://Scripts/RoomDemoUI.gd
extends Control

@export var base_grid_node_path: NodePath       
@export var grid_renderer_node_path: NodePath    
@export var room_texture_path: String = "res://Sprite/Reference/Cuadrado rojo.jpg"

@export var target_x: int = 0  
@export var target_y: int = 0

func _ready():
	
	pass

func _on_place_button_pressed():
	var base = get_node(base_grid_node_path) as Node
	if not base:
		print("BaseGrid no encontrado")
		return
	var grid_renderer = get_node(grid_renderer_node_path) if grid_renderer_node_path else base.get_node("GridRenderer")
	if not grid_renderer:
		print("GridRenderer no encontrado")
		return
	var tex = load(room_texture_path)
	if tex is Texture2D:
		grid_renderer.call("place_room_in_cell_full_image", target_x, target_y, tex)
