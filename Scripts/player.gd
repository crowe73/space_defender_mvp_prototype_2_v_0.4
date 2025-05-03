# Script: player.gd
extends Area2D

var preload_player_laser := preload("res://Game_Objects/Player/player_laser.tscn")

@onready var default_firing_positions := $Default_Firing_Positions
@onready var fire_delay_timer := $Fire_Delay_Timer

@export var move_speed: float = 0  # Speed player moves at.
@export var fire_delay: float = 0  # Rate lasers fire at.
var velocity := Vector2(0, 0)

func _process(_delta):
	shoot()
	
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

func shoot():
	# Check if player is shooting.
	if Input.is_action_just_pressed("shoot") and fire_delay_timer.is_stopped():
		fire_delay_timer.start(fire_delay)
		# Deffault
		for child in default_firing_positions.get_children():
			var laser := preload_player_laser.instantiate()
			laser.global_position = child.global_position
			get_tree().current_scene.add_child(laser)
