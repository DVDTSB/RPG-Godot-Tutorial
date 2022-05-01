extends KinematicBody2D

export(int) var speed = 80
var velocity = Vector2.ZERO

var time = 0

var inventory = []

func _physics_process(delta):
	time += delta
	var x_input = Input.get_axis("left","right")
	var y_input = Input.get_axis("up","down")
	velocity = speed*Vector2(x_input,y_input).normalized()
	move_and_slide(velocity)
	if velocity.length() == 0:
		$Sprite.rotation = sin(time)/8
	else:
		$Sprite.rotation = sin(time*16)/8
