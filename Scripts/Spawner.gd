extends Node2D

#preloads the flappy bird scene
onready var pipe_resource = preload("res://Scenes/Pipes.tscn")
#makes sure we havent spawned the first 3 pipes in before
var run_once = false
#distance between each pipe
export onready var pipe_distance = 350
#distance the first pipe is from the flappy bird
export var first_pipe_distance = 700
#holds the current x position of the first two pipes
var xpos = 0
#sets our flappy bird var to the node flappy bird
onready var flappy_bird = get_parent().get_node("FlappyBird")
#lets our pipe script no how many pipes have been summoned
var runinto = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#random y position
	var randomy = rand_range(215, 450)
	
	#this checks and makes sure we have not already summoned the first three pipes before
	if !run_once:
		
		#this is pipe number 1
		var pipes = pipe_resource.instance()
		pipes.position.x = flappy_bird.position.x + first_pipe_distance
		var xpos = pipes.position.x
		pipes.position.y = randomy
		get_parent().add_child(pipes)
		get_parent().get_node("Pipes").get_node("BirdCollision").monitoring = false
		
		#this is pipe number 2
		randomy = rand_range(215, 450)
		pipes = pipe_resource.instance()
		pipes.position.x = xpos + pipe_distance
		xpos = pipes.position.x
		pipes.position.y = randomy
		get_parent().add_child(pipes)
		
		#this is pipe number 3
		randomy = rand_range(215, 450)
		pipes = pipe_resource.instance()
		pipes.position.x = xpos + pipe_distance
		xpos = pipes.position.x
		pipes.position.y = randomy
		get_parent().add_child(pipes)
		run_once = true

