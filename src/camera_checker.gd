extends Node2D

var camera_trigger_left : bool = false
var camera_trigger_right : bool = false
var camera_trigger_up : bool  = false
var camera_trigger_down : bool = false

@onready var camera_2d: Camera2D = $"../Camera2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_left == false :
		camera_trigger_left = true
		position.x -= 640
		camera_2d.position.x -= 640
		print("camera moved!")


func _on_area_2d_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_right == false :
		camera_trigger_right = true
		position.x += 640
		camera_2d.position.x += 640
		print("camera moved!")


func _on_area_2d_up_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_up == false :
		camera_trigger_up = true
		position.y += 480
		camera_2d.position.y += 480
		print("camera moved!")


func _on_area_2d_down_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_down == false :
		camera_trigger_down = true
		position.y -= 480
		camera_2d.position.y -= 480
		print("camera moved!")


func _on_area_2d_left_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_left == true :
		camera_trigger_left = false


func _on_area_2d_right_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_right == true :
		camera_trigger_right = false


func _on_area_2d_up_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_up == true :
		camera_trigger_up = false

func _on_area_2d_down_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and camera_trigger_down == true :
		camera_trigger_down = false
