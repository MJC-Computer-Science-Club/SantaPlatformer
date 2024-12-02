extends Label

var heath_Text = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	heath_Text = ""
	
	for n in range(GlobalSingleton.santa_Health):
		heath_Text += '@'
	
	text = heath_Text
	
