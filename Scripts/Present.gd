extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Inside")
	if body.is_in_group("Player"):
		GlobalSingleton.presents_collected += 1
		queue_free()
