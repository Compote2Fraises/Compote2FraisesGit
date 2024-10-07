extends Node2D

@export var Level = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Water.z_index = Level
	$"Walls 1".z_index = Level+2
	$Nature.z_index = Level+2
	$Props.z_index = Level+2
	$"Stairs or Bridge and tunnel".z_index=Level+1
	z_index = 0
	
	
