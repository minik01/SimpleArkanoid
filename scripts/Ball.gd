extends RigidBody2D

const SPEEDUP = 400
const MAXSPEED = 30000

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score += 10
			get_node("/root/World").bricks -= 1
			body.queue_free()
	
		if body.get_name() == ("Paddle"):
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Position2D").get_global_pos()
			var velocity = direction.normalized()*min(speed+SPEEDUP*delta, MAXSPEED*delta)
			set_linear_velocity(velocity)
	if get_pos().y > get_viewport_rect().end.y:
		if get_node("/root").has_node("World"):
			get_node("/root/World").balls -= 1
			queue_free()
	#print ("END")