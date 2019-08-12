extends Camera2D

#setting variables to instane of the bird
onready var flappybird = get_parent().get_node("FlappyBird")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#setting camera x pos to bird x pos
	position.x = flappybird.position.x
