extends Node2D

@onready var bl = $BuildingLayer

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if Global.current_tile != null:
			var coords = bl.local_to_map(get_global_mouse_position() - bl.global_position)
			bl.set_cell(coords, Global.current_tile.x, Vector2i(Global.current_tile.y, Global.current_tile.z))
			Global.current_tile = null
