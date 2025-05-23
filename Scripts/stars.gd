# Script: stars.gd

extends Sprite2D

@export var velocity = Vector2()

func _ready():
	set_process(true)
	
func _process(delta):
	translate(velocity * delta)
	
	if get_position().y >= get_viewport_rect().size.y:
		set_position(Vector2(0, -768))
