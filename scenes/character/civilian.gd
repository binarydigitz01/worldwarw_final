extends CharacterBody2D

const SPEED = 300.0
#@onready var agent = $NavigationAgent2D
func _ready() -> void:
	$AnimatedSprite2D.play("walk")

func _physics_process(delta: float) -> void:
	pass
	#agent.target_position = get_global_mouse_position()
	#var dir = to_local(agent.get_next_path_position()).normalized()
	#var new_velocity = dir*SPEED
	#agent.set_velocity_forced(new_velocity)
	#velocity = new_velocity
	#move_and_slide()
	
