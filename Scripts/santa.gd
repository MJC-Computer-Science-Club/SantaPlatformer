extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var is_throwing_snowball = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("Interact"):
		_animated_sprite.play("Throw")
		is_throwing_snowball = true
		
	if _animated_sprite.is_playing() == false:
		is_throwing_snowball = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if is_throwing_snowball == false:
			_animated_sprite.play("Run")
			if velocity.x > 0:
				_animated_sprite.flip_h = false
			else:
				_animated_sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_throwing_snowball == false:
			_animated_sprite.play("Idle")

	move_and_slide()
