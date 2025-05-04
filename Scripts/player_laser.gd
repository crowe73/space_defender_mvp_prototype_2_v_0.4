extends Area2D

@export var speed: float = 500  # Speed lasers move at.

func _physics_process(delta):
	move_player_laser_projectile(delta)

func move_player_laser_projectile(delta):
	position.y -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	# If laser exit the game screen, remove from game screen.
	queue_free()

func _on_area_entered(area: Area2D):
	# If player's laser hits meteor, subtract 1 from meteor's hit points.
	if area.is_in_group("meteor"):
		area.meteor_damage(1)
		queue_free()
