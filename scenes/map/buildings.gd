extends TileMapLayer


func _on_water_timer_timeout() -> void:
	var water_nodes = get_tree().get_nodes_in_group("water")
	for water in water_nodes:
		water = water as Water
		var current_coords = water.travelled[-1]
