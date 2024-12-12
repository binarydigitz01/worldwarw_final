extends TileMapLayer

class_name GroundLayer

@export var water_tiles: Array = []
const WATER_TILE_SRC = 1
const WATER_LITRE_TO_LEVEL = 0.001

@onready var pipe_layer = get_tree().get_first_node_in_group("PipeLayer")
func _ready():
	calculate_water_tiles()
	print(water_tiles)
	
func get_water_group(pos : Vector2i):
	var water_group = []
	var queue = [pos]
	while not queue.is_empty():
		var cell = queue.pop_front()
		if get_cell_source_id(cell) == WATER_TILE_SRC and cell not in water_group:
			water_group.append(cell)
			for i in get_surrounding_cells(cell):
				if i not in water_group and i not in queue:
					queue.append(i)
	return water_group

func water_cell_done(pos: Vector2i)->bool:
	for i in water_tiles:
		if pos in i:
			return true
	return false

func calculate_water_tiles():
		var water_cells = get_used_cells_by_id(WATER_TILE_SRC)
		for i in water_cells:
			if not water_cell_done(i):
				water_tiles.append(get_water_group(i))
	
func water_group(pos: Vector2i):
	for i in water_tiles:
		if pos in i:
			return i
	assert(false, "No water tile over here!")

func pump_out_water(quantity: int, pos: Vector2i):
	var wg = water_group(pos)
	var total_tiles = len(wg)
	var decrease = quantity * WATER_LITRE_TO_LEVEL / total_tiles
	var data = get_cell_tile_data(pos)
	var water_level = data.get_custom_data("wl") - decrease
	print(water_level)
	var water_quality = data.get_custom_data("wq")
	for i in wg:
		get_cell_tile_data(i).set_custom_data("wl", water_level)
		
	var rect_coords = map_to_local(pos)
	rect_coords.x += 32
	rect_coords.y += 16 
	rect_coords = pipe_layer.local_to_map(rect_coords)

	Water.new(quantity, rect_coords, water_quality)
	
	
