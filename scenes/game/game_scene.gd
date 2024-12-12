extends Node2D

@onready var bl = $BuildingLayer

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if Global.pause_mode:
			var coords = bl.local_to_map(get_global_mouse_position())
			var tile_data : TileData = bl.get_cell_tile_data(coords)
			var is_enabled = tile_data.get_custom_data("is_enabled")
			tile_data.set_custom_data("is_enabled", not is_enabled)
		if Global.current_tile != null:
			var coords = bl.local_to_map(get_global_mouse_position() - bl.global_position)
			bl.set_cell(coords, Global.current_tile.x, Vector2i(Global.current_tile.y, Global.current_tile.z))
			Global.current_tile = null
