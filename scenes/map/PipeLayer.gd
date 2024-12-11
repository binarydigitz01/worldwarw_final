extends TileMapLayer

func _on_water_timer_timeout() -> void:
	var water_nodes = Global.water_array
	for water in water_nodes:
		water = water as Water
		var current_coords = water.travelled[-1]
		print("Water coords: ", current_coords)
		var surrounding_cells = get_surrounding_cells(current_coords)
		print("su", surrounding_cells)
		for sc in surrounding_cells:
			var atlas_coords = get_cell_atlas_coords(sc)
			if atlas_coords.y == 0 and sc not in water.travelled:
				water.travelled.append(sc)
				print(water.travelled)
				break
