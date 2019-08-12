extends Node2D

func _on_Button3_button_down():
	
	#quitting the game
	get_tree().quit()



func _on_Button_button_down():
	
	#changing to the main scene
	get_tree().change_scene("res://Scenes/MainScene.tscn")
