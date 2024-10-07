extends Node2D

@export var Level = 1
var WallColisions
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ground.z_index = Level-1
	$Water.z_index = Level
	$"Walls 1".z_index = Level+1
	$Nature.z_index = Level+1
	$Props.z_index = Level+1
#prout
	print("--- Etage n°",Level," ---")
	$"Walls 1".tile_set.set_physics_layer_collision_layer(0,Level+1 | Level+2)
	print("Walls 1: Layer n°",$"Walls 1".z_index,"/ Physics: ",$"Walls 1".tile_set.get_physics_layer_collision_layer(0))
	$Props.tile_set.set_physics_layer_collision_layer(0,Level+1)
	print("Props: Layer n°",$Props.z_index,"/ Physics: ",$"Props".tile_set.get_physics_layer_collision_layer(0))
	$Nature.tile_set.set_physics_layer_collision_layer(0,Level+1)
	print("Nature: Layer n°",$Props.z_index,"/ Physics: ",$"Nature".tile_set.get_physics_layer_collision_layer(0))
