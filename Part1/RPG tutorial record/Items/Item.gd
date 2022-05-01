extends Node2D

export(Resource) var item = preload("res://Items/Hat.tres")
var offset
var time = 0
func _ready():
	$Sprite.texture = item.texture
	name = item.name
	randomize()
	offset = randf()

func _physics_process(delta):
	
	if not Engine.editor_hint:
		time += delta
		$Sprite.position.y = sin(time+offset)*2
		$Sprite.rotation = cos((time+offset)*2)/8

func _process(delta):
	if Engine.editor_hint:
		$Sprite.texture = item.texture
		name = item.name
		
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.inventory.append(item)
		print(item.name)
		queue_free()
