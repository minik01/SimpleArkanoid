extends Node2D

var score = 0 setget set_score
var bricks = 0 setget set_brick
var balls = 0 setget set_balls
#var lives = 3 setget set_lives

func set_score(value):
	score = value
	get_node("Score").set_text("Score: "+str(score))
	
func set_brick(value):
	bricks = value
	#here wins conditioins
	if bricks==0:
			set_balls(0)
		
func set_balls(value):
	balls = value
	print(balls)
	if balls==0:
		if bricks==0:
			get_tree().change_scene("res://scenes/Win.xml")
		else:
			get_tree().change_scene("res://scenes/GameOver.xml")