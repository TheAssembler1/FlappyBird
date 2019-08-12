extends KinematicBody2D

#regular variables
export var jump_power = 400
export var gravity = 15
export var bird_speed = 200
export var rot_speed = 3
export var max_velocity = 40
var can_jump = true
var bird_score = 1
var motion = Vector2()

#keybindings
var up = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#adding flappy bird to flappy bird group
	add_to_group("FlappyBird")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#gets input and moves the player
	Input()
	
	pass

#gets input and moves the player
func Input():
	
	#updates the score on screen
	get_parent().get_node("CanvasLayer").get_node("ScoreLabel").text = "Score = " + str(bird_score)

	#sets the up button
	up = Input.is_action_just_pressed("ui_up")
	
	#apply gravity
	motion.y += gravity
	
	#moving the bird
	motion.x = bird_speed
	
	if position.y <= 0:
		can_jump = false
	
	if up && can_jump:
		motion.y = 0
		motion.y -= jump_power


	if motion.y > 0:
		rotation_degrees += rot_speed
	
	if motion.y < 0:
		rotation_degrees -= rot_speed

	if rotation_degrees >= 40:
		rotation_degrees = 40
	
	if rotation_degrees <= -40:
		rotation_degrees = -40
	
	if motion.y < max_velocity:
		motion.y = max_velocity

	if position.y >  636:
		can_jump = false
		motion.x = 0
		motion.y = 0
	
	if !can_jump:
		motion.x = 0
	
	motion = move_and_slide(motion)

func _on_Button_button_down():
	get_tree().change_scene("res://Scenes/PlayScene.tscn")
	pass # Replace with function body.
