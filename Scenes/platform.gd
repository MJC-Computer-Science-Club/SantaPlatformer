extends AnimatableBody2D

@export var height : int
@export var dropping : bool = true
@onready var _animation_Player = $"AnimationPlayer"
var anim_lib = AnimationLibrary.new()

var is_dropping = 1
var animation_a = Animation.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if !dropping:
		is_dropping = -1
		
	animation_a.length = 5.0
	animation_a.loop_mode = true
	
	var track_sprite_index = animation_a.add_track(Animation.TYPE_VALUE)
	var track_hitbox_index = animation_a.add_track(Animation.TYPE_VALUE)

	animation_a.track_set_path(track_sprite_index, "Sprite2D:position")
	animation_a.track_insert_key(track_sprite_index, 0.0, Vector2(0, 0))
	animation_a.track_insert_key(track_sprite_index, 2.5, Vector2(0, height * is_dropping))
	animation_a.track_insert_key(track_sprite_index, 5, Vector2(0, 0))
	
	animation_a.track_set_path(track_hitbox_index, "CollisionShape2D:position")
	animation_a.track_insert_key(track_hitbox_index, 0.0, Vector2(0, 0))
	animation_a.track_insert_key(track_hitbox_index, 2.5, Vector2(0, height * is_dropping))
	animation_a.track_insert_key(track_hitbox_index, 5, Vector2(0, 0))
	
	anim_lib.add_animation("new_vert", animation_a)
	
	
	_animation_Player.add_animation_library("new_vert", anim_lib)
	print(_animation_Player.get_animation_library_list())
	_animation_Player.play("new_vert/" + "new_vert")
#	vertical.track_set_key_value(0, 1, Vector2(0, height * is_dropping))
#	vertical.track_set_key_value(1, 1, Vector2(0, height * is_dropping))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print('DONE')
