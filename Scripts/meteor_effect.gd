# Script: meteor_effect.gd.
extends CPUParticles2D

func _ready():
	emitting = true
	
func _process(_delta: float):
	if !emitting:
		queue_free()
