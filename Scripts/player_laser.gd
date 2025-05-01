extends Area2D

@export var speed: float = 500

func _physics_process(delta):
	move_player_laser_projectile(delta)

func move_player_laser_projectile(delta):
	position.y -= speed * delta
