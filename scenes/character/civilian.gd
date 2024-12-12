extends CharacterBody2D

const SPEED = 200.0
#@onready var agent = $NavigationAgent2D
func _ready() -> void:
	$AnimatedSprite2D.play("walk")

func _physics_process(_delta) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity=direction*SPEED
	move_and_slide()
	#agent.target_position = get_global_mouse_position()
	#var dir = to_local(agent.get_next_path_position()).normalized()
	#var new_velocity = dir*SPEED
	#agent.set_velocity_forced(new_velocity)
	#velocity = new_velocity
	#move_and_slide()
	
