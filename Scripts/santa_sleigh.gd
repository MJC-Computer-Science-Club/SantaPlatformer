extends Sprite2D

@onready var controller_Sprite2D = $"Sprite2D"
@onready var animationPlayer = $"AnimationPlayer"
var currentlyFlying = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if currentlyFlying == false && GlobalSingleton.flying_Away == true:
		animationPlayer.play("Flying_Away")
		currentlyFlying = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GlobalSingleton.is_Touching_Sleight = true
		controller_Sprite2D.visible = true
		print("Touching Sleigh")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		controller_Sprite2D.visible = false
		GlobalSingleton.is_Touching_Sleight = false
		print("Not Touching Sleigh")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	GlobalSingleton.flew_Away = true
