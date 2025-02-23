extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var camera_2d: Camera2D = $"../Camera2D"

enum control_state {
	FLIP,
	JUMP,
}

@export var controlState1 = control_state.FLIP
@export var SPEED : float = 120.0
const ACCELERATION : float = 800.0
const FRICTION : float = 800.0
var changedGravity : bool = false



func _ready() -> void :
	pass

func _physics_process(delta: float) -> void:
	_flip_player(delta)
	
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("player1_left", "player1_right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	
	
	
	if Input.is_action_pressed("player1_crouch"): 
		SPEED = 60.0
	elif Input.is_action_just_released("player1_crouch"):
		SPEED = 120.0

	move_and_slide()

func _flip_player(delta):
	if controlState1 == control_state.FLIP:
		if not is_on_floor() or not is_on_ceiling():
			if changedGravity == false:
				velocity += get_gravity() * delta
			if changedGravity == true:
				velocity -= get_gravity() * delta
		if velocity.y >= 700 :
			velocity.y = 700
	
	# Handle flipping.
	if Input.is_action_just_pressed("player1_mainAction"):
		sprite_2d.flip_v = not sprite_2d.flip_v
		changedGravity = not changedGravity
