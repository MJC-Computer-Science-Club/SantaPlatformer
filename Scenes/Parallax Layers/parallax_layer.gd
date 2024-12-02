extends ParallaxLayer

var SNOW_SPEED = -15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.motion_offset.x += SNOW_SPEED * delta
	self.motion_offset.y += abs(SNOW_SPEED) * delta
