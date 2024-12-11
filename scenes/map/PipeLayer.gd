extends TileMapLayer

func _on_water_timer_timeout() -> void:
	var water_nodes = Global.water_array
	for water in water_nodes:
		water = water as Water
		var current_coords = water.travelled[-1]
		print("Water coords: ", current_coords)
		var current_atlas = get_cell_atlas_coords(current_coords)
		if current_atlas.y==2:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y+1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y-1))
			if (n1_cell.y == 2 or n1_cell.y == 13 or n1_cell.y == 12) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
			if (n2_cell.y == 2 or n1_cell.y == 14 or n1_cell.y == 15) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
		if current_atlas.y==8:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x-1,current_coords.y))
			if (n1_cell.y == 8 or n1_cell.y == 13 or n1_cell.y == 15) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
			if (n2_cell.y == 8 or n2_cell.y == 12 or n2_cell.y == 14) and n2_cell not in water.travelled:
				water.travelled.append(n2_cell)
				print(water.travelled)
		if current_atlas.y==12:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y-1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			if (n1_cell.y == 2 or n1_cell.y == 14 or n1_cell.y == 15) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
			if (n2_cell.y == 8 or n2_cell.y == 13 or n2_cell.y == 15) and n2_cell not in water.travelled:
				water.travelled.append(n2_cell)
				print(water.travelled)
		if current_atlas.y==13:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y-1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			if (n1_cell.y == 2 or n1_cell.y == 14 or n1_cell.y == 15) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
			if (n2_cell.y == 8 or n1_cell.y == 13 or n1_cell.y == 15) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
		if current_atlas.y==14:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y+1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			if (n1_cell.y == 2 or n1_cell.y == 13 or n1_cell.y == 12) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
			if (n2_cell.y == 8 or n1_cell.y == 13 or n1_cell.y == 15) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
		if current_atlas.y==15:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y+1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x-1,current_coords.y))
			if (n1_cell.y == 2 or n1_cell.y == 12 or n1_cell.y == 13) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
			if (n2_cell.y == 8 or n1_cell.y == 12 or n1_cell.y == 14) and n1_cell not in water.travelled:
				water.travelled.append(n1_cell)
				print(water.travelled)
