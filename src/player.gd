extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var controlState : String = "flip"
var SPEED : float = 120.0
const ACCELERATION : float = 800.0
const FRICTION : float = 800.0
var changedGravity : bool = false

func _ready() -> void :
	pass

func _physics_process(delta: float) -> void:
	if controlState == "flip":
		_flip_player(delta)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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


func _on_off_screen_h_box_body_entered(body: Node2D) -> void:
	queue_free()
