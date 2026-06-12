# res://Scripts/RoomDemoUI.gd
extends Control

# Rutas hacia los nodos relevantes (ajusta si cambias nombres)
@export var base_grid_node_path: NodePath
@export var grid_renderer_node_path: NodePath
@export var room_texture_path: String = "res://Sprite/Reference/Cuadrado rojo.jpg"

@onready var type_selector: OptionButton = $"VBoxContainer/TypeSelector"
@onready var target_x_spin: SpinBox = $"VBoxContainer/Coords/TargetX"
@onready var target_y_spin: SpinBox = $"VBoxContainer/Coords/TargetY"
@onready var preview_texture: TextureRect = $"VBoxContainer/PreviewTexture"
@onready var place_btn: Button = $"VBoxContainer/Actions/PlaceButton"
@onready var undo_btn: Button = $"VBoxContainer/Actions/UndoButton"
@onready var save_btn: Button = $"VBoxContainer/Actions/SaveButton"
@onready var load_btn: Button = $"VBoxContainer/Actions/LoadButton"

func _ready():
	# Configurar valores por defecto si se quiere
	place_btn.connect("pressed", self, "_on_place_pressed")
	undo_btn.connect("pressed", self, "_on_undo_pressed")
	save_btn.connect("pressed", self, "_on_save_pressed")
	load_btn.connect("pressed", self, "_on_load_pressed")

	# Actualizar previsualización inicial
	_update_preview()

func _update_preview():
	var tex = load(room_texture_path)
	if tex is Texture2D:
		preview_texture.texture = tex

func _on_place_pressed():
	var base = get_node(base_grid_node_path) as Node
	if not base:
		push_error("BaseGrid no encontrado")
		return
	var grid_renderer = get_node(grid_renderer_node_path) if grid_renderer_node_path != null else base.get_node("Render")
	if not grid_renderer:
		push_error("GridRenderer no encontrado")
		return

	# Obtener coordenadas objetivo
	var tx = int(target_x_spin.value)
	var ty = int(target_y_spin.value)

	# Usamos la textura actual para la habitación
	var tex = load(room_texture_path)
	if tex is Texture2D:
		grid_renderer.call("place_room_in_cell_full_image", tx, ty, tex)
	else:
		push_error("La textura de habitación no es válida")

func _on_undo_pressed():
	# Implementa lógica de undo si la tienes
	pass

func _on_save_pressed():
	# Implementa guardado (JSON/scene) si quieres
	pass

func _on_load_pressed():
	# Implementa carga
	pass
