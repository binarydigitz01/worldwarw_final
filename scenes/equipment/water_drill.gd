extends Node2D

@onready var sprite = $AnimatedSprite2D
var map : TileMapLayer
var map_coords : Vector2i
var pipe
@export var RATE = 10

func _ready() -> void:
	map = get_tree().get_nodes_in_group("tilemap")[0] as TileMapLayer
	map_coords = map.local_to_map(global_position - map.global_position)
	sprite.play("default")
	var neighbours = map.get_surrounding_cells(map_coords)
	print(neighbours)
	


func _on_timer_timeout() -> void:
	var water = Water.new(RATE, Vector2i(1,2))
