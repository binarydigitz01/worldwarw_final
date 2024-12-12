extends CharacterBody2D

const SPEED = 200.0
#@onready var agent = $NavigationAgent2D
func _ready() -> void:
	$AnimatedSprite2D.play("walk")

func _physics_process(_delta) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity=direction*SPEED
	move_and_slide()	
