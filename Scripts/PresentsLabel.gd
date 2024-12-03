extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = str(GlobalSingleton.presents_collected) + " presents"


func _on_killzone_body_entered(body: Node2D) -> void:
	GlobalSingleton.presents_collected = 0
	text = str(GlobalSingleton.presents_collected) + " presents"
