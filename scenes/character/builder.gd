extends CharacterBody2D

var workshop_coords

const WORKSHOP_SOURCE = 1
@onready var building_layer: TileMapLayer = get_tree().get_first_node_in_group("BuildingLayer")
@onready var agent : NavigationAgent2D = $NavigationAgent2D

enum BuilderState {GOTO_WORKSHOP, BUILD}
var state: BuilderState = BuilderState.GOTO_WORKSHOP

const SPEED = 150

func _ready() -> void:
	workshop_coords = building_layer.get_used_cells_by_id(WORKSHOP_SOURCE)[0]
	agent.target_position = building_layer.map_to_local(workshop_coords) + building_layer.global_position
	
func _physics_process(delta: float) -> void:
	if state == BuilderState.GOTO_WORKSHOP and not agent.is_navigation_finished():
		var dir = to_local(agent.get_next_path_position()).normalized()
		var new_velocity = dir*SPEED
		agent.set_velocity_forced(new_velocity)
		velocity = new_velocity
		move_and_slide()

	
