extends Area2D

@export var move_speed: float = 100  # Speed player moves at.
var velocity := Vector2(0, 0)

func _process(_delta):
	pass
	
func _physics_process(delta):
	move_player(delta)
	constrain_player()

func move_player(delta):
	# Check for player input.
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	# Move the player.
	velocity = velocity.normalized() * move_speed
	position += velocity * delta

func constrain_player():
	# Constrains the player to within the viewport screen.
	var viewRect = get_viewport_rect()
	position.x = clamp(position.x, 0 + 40, viewRect.size.x - 40)
