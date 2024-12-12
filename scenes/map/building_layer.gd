extends TileMapLayer

@export var WATER_DRILL_RATE = 10
@onready var ground_layer: GroundLayer = get_tree().get_first_node_in_group("tilemap")
@onready var pipe_layer: TileMapLayer = get_tree().get_first_node_in_group("PipeLayer")
@onready var water_redstone_timer : Timer = get_tree().get_first_node_in_group("water_redstone_timer")
const WATER_DRILL_SOURCE = 0
const WATER_TANK_SOURCE = 4
const WATER_TANK_LIMIT = 100
func _ready() -> void:
	water_redstone_timer.timeout.connect(_on_water_tank_timer_timeout)

func is_tile_enabled(coords: Vector2i):
	#return get_cell_tile_data(coords).get_custom_data("is_enabled")
	return true

func _on_drill_timer_timeout() -> void:
	var water_drill_tiles = get_used_cells_by_id(WATER_DRILL_SOURCE)
	for t in water_drill_tiles:
		if not is_tile_enabled(t):
			continue
		if Global.water_currency < Global.CURRENCY_THRESHOLD:
			Global.add_water_currency(WATER_DRILL_RATE)
			ground_layer.pump_out_water(WATER_DRILL_RATE, t, false, false)
		else:
			ground_layer.pump_out_water(WATER_DRILL_RATE, t)
	var hand_pumps = get_used_cells_by_id(2)
	for t in hand_pumps:
		if Global.water_currency < Global.CURRENCY_THRESHOLD:
			Global.add_water_currency(WATER_DRILL_RATE)
			ground_layer.pump_out_water(WATER_DRILL_RATE, t,true,false)
		else:
			ground_layer.pump_out_water(WATER_DRILL_RATE,t,true)

func _on_water_tank_timer_timeout() -> void:
	var water_tanks = get_used_cells_by_id(WATER_TANK_SOURCE)
	for i in water_tanks:
		if not is_tile_enabled(i):
			continue
		var tile_data = get_cell_tile_data(i)
		if tile_data.get_custom_data("water_tank") == WATER_TANK_LIMIT:
			continue
		for j in range(0,len(Global.water_array)):
			if len(Global.water_array) <= j:
				break
			if i == Global.water_array[j].travelled[-1]:
				var w = Global.water_array[j] as Water
				Global.water_array.remove_at(j)
				var w_stored = tile_data.get_custom_data("water_tank")
				w_stored = clamp(w_stored + w.quantity,0,WATER_TANK_LIMIT)
				if w_stored < WATER_TANK_LIMIT/3:
					set_cell(i, WATER_TANK_SOURCE,Vector2i(0,0))
				elif w_stored < WATER_TANK_LIMIT*0.66:
					set_cell(i, WATER_TANK_SOURCE, Vector2i(1,0))
				elif w_stored < WATER_TANK_LIMIT:
					set_cell(i, WATER_TANK_SOURCE, Vector2i(2,0))
				tile_data = get_cell_tile_data(i)
				tile_data.set_custom_data("water_tank", w_stored)


func _on_ice_drill_timer_timeout() -> void:
	var ground_layer : TileMapLayer = get_tree().get_first_node_in_group("tilemap")
	var ice_drills = get_used_cells_by_id(3)
	var i = 0
	for j in ice_drills:
		var atlas_coords = ground_layer.get_cell_atlas_coords(j)
		var source_id = ground_layer.get_cell_source_id(j)
		if ground_layer.get_cell_atlas_coords(j) == Vector2i(7,0) and is_tile_enabled(j):
			i+=1
	Global.add_ice_currency(2*i)


func _on_condenser_timer_timeout() -> void:
	var condensors = get_used_cells_by_id(8)
	var count = 0
	for i in condensors:
		if is_tile_enabled(i):
			count+=1
	Global.add_water_currency(5*count)
	Global.add_ice_currency(-count)
