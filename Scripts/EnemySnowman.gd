extends CharacterBody2D


const SPEED = 25.0
const JUMP_VELOCITY = -400.0
var moving_Right = -1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = moving_Right * SPEED

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Turn_Back_Node"):
		moving_Right = moving_Right * -1
