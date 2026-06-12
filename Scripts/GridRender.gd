# res://Scripts/GridRenderer.gd
extends Node2D

const CELL_SIZE := Vector2(64, 64)

@export var textures: Dictionary = {
	"empty": null,
	"wall": null,
	"generator": null
}

var _grid_ref: Node = null
var _sprites_by_cell := {}

func _ready() -> void:
	_grid_ref = get_parent().get_node("Grid")
	if _grid_ref and _grid_ref.has_signal("cell_changed"):
		_grid_ref.connect("cell_changed", Callable(self, "_on_cell_changed"))

func _on_cell_changed(x: int, y: int, data) -> void:
	var key = str(x) + "," + str(y)
	_remove_sprite(key)
	if data == null:
		return
	if data.has("type"):
		_draw_sprite(x, y, data.type)

func _draw_sprite(x: int, y: int, build_type: String):
	var sp = Sprite2D.new()
	var tex = textures.get(build_type, null)
	if tex:
		sp.texture = tex
	sp.position = Vector2(x * CELL_SIZE.x + CELL_SIZE.x * 0.5, y * CELL_SIZE.y + CELL_SIZE.y * 0.5)
	add_child(sp)
	var key = str(x) + "," + str(y)
	_sprites_by_cell[key] = sp

func _remove_sprite(key: String):
	if _sprites_by_cell.has(key):
		var sp = _sprites_by_cell[key]
		if is_instance_valid(sp):
			sp.queue_free()
		_sprites_by_cell.erase(key)


func place_room_in_cell_full_image(x: int, y: int, room_tex: Texture2D) -> void:
	# Limpiar la celda existente
	var key = str(x) + "," + str(y)
	_remove_sprite(key)

	
	var room_sprite = Sprite2D.new()
	room_sprite.texture = room_tex
	room_sprite.position = Vector2(x * CELL_SIZE.x + CELL_SIZE.x * 0.5, y * CELL_SIZE.y + CELL_SIZE.y * 0.5)

	add_child(room_sprite)
	_sprites_by_cell[key] = room_sprite
