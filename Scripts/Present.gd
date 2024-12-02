extends Node2D

@onready var audio_Stream_Player = $"AudioStreamPlayer"
@onready var sprite_2D = $"Sprite2D"

var is_Collected = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") && !is_Collected:
		is_Collected = true
		GlobalSingleton.presents_collected += 1
		audio_Stream_Player.play()
		sprite_2D.visible = false
	



func _on_audio_stream_player_finished() -> void:
	queue_free()
