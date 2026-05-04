# Script: meteor.gd.
extends Area2D

var preload_meteor_effect            = preload("res://Game_Objects/Meteor/meteor_effect.tscn")

@export var min_speed: float         = 0.0  # Minimum meteor speed.
@export var max_speed: float         = 0.0  # maximum meteor speed.
@export var min_rotation_rate: float = 0.0  # minimum rotation rate.
@export var max_rotation_rate: float = 0.0  # maximum rotation rate.
@export var hit_points: int          = 10   # Hits required to destroy meteor.

var speed: float                     = 0.0  # speed meteor moves at.
var rotation_rate: float             = 0.0  # rate meteor rotates at.

func _ready():
	speed = randf_range(min_speed, max_speed)
	rotation_rate = randf_range(min_rotation_rate, max_rotation_rate)
	
func _physics_process(delta: float):
	move_meteor(delta)
	rotate_meteor(delta)

func move_meteor(delta):
	position.y += speed * delta

func rotate_meteor(delta):
	rotation_degrees += rotation_rate * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func meteor_damage(amount: int):
	hit_points -= amount
	if hit_points <= 0:
		play_meteor_effect()
		queue_free()

func _on_Meteor_area_entered(area: Area2D) -> void:
	if area is Player:
		area.player_damage(1)
		
func play_meteor_effect():
	var effect = preload_meteor_effect.instantiate()
	effect.position = position
	get_parent().add_child(effect)
