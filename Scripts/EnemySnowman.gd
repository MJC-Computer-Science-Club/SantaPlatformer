extends CharacterBody2D

@onready var sprite_2D = $"Sprite2D"
@onready var animation_Player = $"AnimationPlayer"
@onready var collisionShapeHitbox = $"CollisionShape2D"
@onready var collisionShapeOther = $"Area2D/CollisionShape2D"


const SPEED = 25.0
const JUMP_VELOCITY = -400.0
var moving_Right = -1
var health = 3


func _physics_process(delta: float) -> void:
	if health <= 0:
		collisionShapeHitbox.disabled = true
		collisionShapeOther.disabled = true
		animation_Player.play("Death")
		moving_Right = 0
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = moving_Right * SPEED

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Turn_Back_Node"):
		moving_Right = moving_Right * -1
		sprite_2D.flip_h = !sprite_2D.flip_h
	if area.is_in_group("Damage"):
		animation_Player.play("Damage")
		health -= 1
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if health <= 0 and str(anim_name) == "Death":
		queue_free()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player_Collision"):
		GlobalSingleton.santa_Health -= 1
