extends Sprite

#getting the flappy bird variable
onready var flappy_bird = get_parent().get_node("FlappyBird")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if position.x <= flappy_bird.position.x - 1000:
		position.x = flappy_bird.position.x + 500

	pass
