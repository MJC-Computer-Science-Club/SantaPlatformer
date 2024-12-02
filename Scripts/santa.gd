extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _snowball_spawner = $"Snowball Spawner"
@onready var snowball_Timer = $"Timer"
var snowball = preload("res://Scenes/Snowball.tscn")


const SPEED = 250.0
const JUMP_VELOCITY = -450.0

var is_throwing_snowball = false
var can_Throw_Snowball = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("Jump")) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpAudio.play()
		
	if (Input.is_action_just_pressed("Interact") || Input.is_action_just_pressed("Throw")) && can_Throw_Snowball:
		can_Throw_Snowball = false
		snowball_Timer.start()
		_animated_sprite.stop()
		_animated_sprite.play("Throw")
		is_throwing_snowball = true

	  # Instantiate snowball in the main scene
		var instance = snowball.instantiate()
		instance.position = _snowball_spawner.global_position

	  # Then add it as a child of the current node
		get_tree().current_scene.add_child(instance)
		
		$SnowballAudio.play()
 		

		
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
				GlobalSingleton.is_Santa_Facing_Left = true
			else:
				_animated_sprite.flip_h = true
				GlobalSingleton.is_Santa_Facing_Left = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_throwing_snowball == false:
			_animated_sprite.play("Idle")

	move_and_slide()


func _on_timer_timeout() -> void:
	can_Throw_Snowball = true
