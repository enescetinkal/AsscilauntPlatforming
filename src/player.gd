extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var controlState = "flip"
const SPEED = 120.0
var changedGravity = false

func _physics_process(delta: float) -> void:
	if controlState == "flip":
		_flip_player(delta)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("player1_left", "player1_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	

	move_and_slide()

func _flip_player(delta): 
	if changedGravity == false:
		velocity += get_gravity() * delta
	if changedGravity == true:
		velocity -= get_gravity() * delta
	
	# Handle flipping.
	if Input.is_action_just_pressed("player1_mainAction"):
		sprite_2d.flip_v = not sprite_2d.flip_v
		changedGravity = not changedGravity
