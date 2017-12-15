extends Node2D
var timer = null

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(2)
	timer.connect("timeout", self, "on_timeout_complete" )
	add_child(timer)
	timer.start() #to start


func on_timeout_complete():
	get_tree().change_scene("res://scenes/World.xml")
