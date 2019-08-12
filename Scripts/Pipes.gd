extends StaticBody2D

#settings flappy bird var to actual flappy bird node
onready var flappybird = get_parent().get_node("FlappyBird")
#random y var for summoning pipes
var randomy = 0
#its going to hold our pipe instance
var pipes = null
#holds teh score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#freeing up the pipes we can no longer see
	if position.x < flappybird.position.x - 350:
		queue_free()
		pass

#bird entered pipe collision box
func _on_BirdCollision_body_entered(body):
	
	#making sure we only spawn pipes after the first three
	get_parent().get_node("Spawner").runinto += 1
	
	#making sure we are hitting the flappy bird
	if body.is_in_group("FlappyBird"):
		get_parent().get_node("FlappyBird").bird_score += 1
		if get_parent().get_node("Spawner").runinto > 1:
				
			#loading in pipes when we enter the pipe area 2d box
			var pipe_resource = load("res://Scenes/Pipes.tscn")
			#getting the distance between 2 pipes
			var pipe_distance = get_parent().get_node("Spawner").pipe_distance
			#setting the xpos of our new pipe
			var xpos = position.x + pipe_distance
			#giving it a random y
			randomy = rand_range(215, 450)
			#actually making an instance of it
			pipes = pipe_resource.instance()
			#setting its x and y
			pipes.position.x = xpos
			pipes.position.y = randomy
			#adding it as a child
			get_parent().add_child(pipes)

func _on_Area2D2_body_entered(body):
	if body.is_in_group("FlappyBird"):
		body.can_jump = false

func _on_Area2D3_body_entered(body):
	if body.is_in_group("FlappyBird"):
		body.can_jump = false