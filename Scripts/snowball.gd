extends Node2D


@onready var _animated_sprite = $AnimatedSprite2D
const SPEED = 350
var is_Going_Left = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !GlobalSingleton.is_Santa_Facing_Left:
		is_Going_Left = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = position.x + SPEED * delta * is_Going_Left
	_animated_sprite.play("Rotating")
	
