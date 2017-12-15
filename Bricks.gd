extends Node2D
var cnt_brick = 0	
func _ready():

	for child in get_children():
    	child.add_to_group("Bricks")
	for child in get_children():
		cnt_brick += 1
		
	get_node("/root/World").bricks = cnt_brick
