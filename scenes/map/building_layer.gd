extends TileMapLayer

@export var WATER_DRILL_RATE = 10
@onready var ground_layer: GroundLayer = get_tree().get_first_node_in_group("tilemap")
const WATER_DRILL_SOURCE = 0
func _on_drill_timer_timeout() -> void:
	var water_drill_tiles = get_used_cells_by_id(WATER_DRILL_SOURCE)
	for t in water_drill_tiles:
		ground_layer.pump_out_water(WATER_DRILL_RATE, t)
		
