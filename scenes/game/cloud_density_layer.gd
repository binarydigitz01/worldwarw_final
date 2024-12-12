extends TileMapLayer

func _on_day_cycle_timer_timeout() -> void:
	var ground_water = Global.ground_water
	var threshold=10
	var is_raining = (randi_range(0,100)+33)<ground_water
	var cells = get_used_cells()
	for c in cells:
		print(c)
		var data = get_cell_tile_data(c)
		var this_cloud_density = data.get_custom_data("cloud_density")
		var avg_cells=get_surrounding_cells(c)
		var cloud_density_change: float = 1
		for nc in avg_cells:
			cloud_density_change += nc*ground_water/100
		data.set_custom_data("cloud_density",this_cloud_density+cloud_density_change)
		if get_cell_atlas_coords(c).x==3 and is_raining:
			data.set_custom_data("cloud_density",this_cloud_density/100)
		elif this_cloud_density>threshold*get_cell_atlas_coords(c):
			set_cell(c,0,Vector2i((get_cell_atlas_coords(c).x+1)%3,0))
