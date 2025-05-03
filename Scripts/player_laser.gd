extends Area2D

@export var speed: float = 500  # Speed lasers move at.

func _physics_process(delta):
	move_player_laser_projectile(delta)

func move_player_laser_projectile(delta):
	position.y -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	# If laser exit the game screen, remove from game screen.
	queue_free()
