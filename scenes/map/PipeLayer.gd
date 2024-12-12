extends TileMapLayer

func _on_water_timer_timeout() -> void:
	var water_nodes = Global.water_array
	for water in water_nodes:
		water = water as Water
		var current_coords = water.travelled[-1]
		print("Water coords: ", current_coords)
		var current_atlas = get_cell_atlas_coords(current_coords)
		if current_atlas.x==2:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y+1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y-1))
			if (n1_cell.x == 2 or n1_cell.x == 13 or n1_cell.x == 12) and Vector2i(current_coords.x,current_coords.y+1) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x,current_coords.y+1))
				break
			if (n2_cell.x == 2 or n2_cell.x == 14 or n2_cell.x == 15) and Vector2i(current_coords.x,current_coords.y-1) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x,current_coords.y-1))
				break
		if current_atlas.x==8:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x-1,current_coords.y))
			if (n1_cell.x == 8 or n1_cell.x == 13 or n1_cell.x == 15) and Vector2i(current_coords.x+1,current_coords.y) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x+1,current_coords.y))
				break
			if (n2_cell.x == 8 or n2_cell.x == 12 or n2_cell.x == 14) and Vector2i(current_coords.x-1,current_coords.y) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x-1,current_coords.y))
				break
		if current_atlas.x==12:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y-1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			if (n1_cell.x == 2 or n1_cell.x == 14 or n1_cell.x == 15) and Vector2i(current_coords.x,current_coords.y-1) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x,current_coords.y-1))
				break
			if (n2_cell.x == 8 or n2_cell.x == 13 or n2_cell.x == 15) and Vector2i(current_coords.x+1,current_coords.y) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x+1,current_coords.y))
				break
		if current_atlas.x==13:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y-1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			if (n1_cell.x == 2 or n1_cell.x == 14 or n1_cell.x == 15) and Vector2i(current_coords.x,current_coords.y-1) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x,current_coords.y-1))
				break
			if (n2_cell.x == 8 or n2_cell.x == 13 or n2_cell.x == 15) and Vector2i(current_coords.x+1,current_coords.y) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x+1,current_coords.y))
				break
		if current_atlas.x==14:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y+1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x+1,current_coords.y))
			if (n1_cell.x == 2 or n1_cell.x == 13 or n1_cell.x == 12) and Vector2i(current_coords.x,current_coords.y+1) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x,current_coords.y+1))
				break
			if (n2_cell.x == 8 or n2_cell.x == 13 or n2_cell.x == 15) and Vector2i(current_coords.x+1,current_coords.y) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x+1,current_coords.y))
				break
		if current_atlas.x==15:
			var n1_cell=get_cell_atlas_coords(Vector2i(current_coords.x,current_coords.y+1))
			var n2_cell=get_cell_atlas_coords(Vector2i(current_coords.x-1,current_coords.y))
			if (n1_cell.x == 2 or n1_cell.x == 12 or n1_cell.x == 13) and Vector2i(current_coords.x,current_coords.y+1) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x,current_coords.y+1))
				break
			if (n2_cell.x == 8 or n2_cell.x == 12 or n2_cell.x == 14) and Vector2i(current_coords.x-1,current_coords.y) not in water.travelled:
				water.travelled.append(Vector2i(current_coords.x-1,current_coords.y))
				break
