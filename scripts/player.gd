extends CharacterBody2D

@onready var player_sprite: Sprite2D = $GFX
@export var speed: float

# sprite variables for width and height
var sprite_width: float
var sprite_height: float
var sprite_scale: float

# get the view port screen size
var screen_size: Vector2

func _ready() -> void:
	# get the sprite width and height and scale to get the correct offsets
	sprite_scale = player_sprite.transform.get_scale().x
	sprite_width = player_sprite.get_rect().size.x * sprite_scale / 2.0
	sprite_height = player_sprite.get_rect().size.y * sprite_scale / 2.0
	
	print("Sprite Width: " + str(sprite_width))
	print("Sprite Height: " + str(sprite_height))

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
		
	clamp_player_to_viewport()
	move_and_slide()


func clamp_player_to_viewport():
	screen_size = get_viewport_rect().size
	## another ay of doing it
	#if global_position.x <= 0.0 + sprite_width:
		#global_position.x = 0.0 + sprite_width
#
	#if global_position.x >= screen_size.x - sprite_width:
		#global_position.x = screen_size.x - sprite_width
#
	#if global_position.y <= 0.0 + sprite_height:
		#global_position.y = 0.0 + sprite_height
#
	#if global_position.y >= screen_size.y - sprite_height:
		#global_position.y = screen_size.y - sprite_height
		
	# Another way of doing this is
	#global_position = global_position.clamp(Vector2.ZERO, screen_size)
	
	# Third way
	global_position.x = clamp(global_position.x, 0.0 + sprite_width, screen_size.x - sprite_width)
	global_position.y = clamp(global_position.y, 0.0 + sprite_height, screen_size.y - sprite_height)
