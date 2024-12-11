extends TileMapLayer

@export var RATE = 10

func _on_drill_timer_timeout() -> void:
	var water_tiles = get_used_cells_by_id(0)
	for t in water_tiles:
		var water = Water.new(RATE, t)
