extends Node2D


@onready var _animated_sprite = $AnimatedSprite2D
const SPEED = 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = position.x + SPEED * delta
	_animated_sprite.play("Rotating")
	
