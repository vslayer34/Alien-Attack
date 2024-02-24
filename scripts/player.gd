extends CharacterBody2D

var speed: float = 100.0

func _physics_process(_delta: float) -> void:
	# Reset the velocity vector when the player stop inout actions
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	
	move_and_slide()
