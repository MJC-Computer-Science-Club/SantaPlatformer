extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed_scale = 0.5
	play("bouncing")
	print("START")


func _on_animation_finished(anim_name: StringName) -> void:
	print("DONE")
