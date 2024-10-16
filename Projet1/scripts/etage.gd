extends Node2D

@export var Level = 1
var WallColisions
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ground.z_index = Level*3
	$"Border and Walls".z_index = Level*3 + 1
	$Water.z_index = Level*3 + 1
	$"Collectables".z_index = Level*3+2
	$Nature.z_index = Level*3 + 2
	$Props.z_index = Level*3 + 2

	print("--- Etage n°",Level," ---")
	$"Collectables".tile_set.set_physics_layer_collision_layer(0,2**Level)
	print("Walls 1: Layer n°",$"Collectables".z_index,"/ Physics: ",$"Collectables".tile_set.get_physics_layer_collision_layer(0))
	$"Border and Walls".tile_set.set_physics_layer_collision_layer(0,2**Level)
	print("Border: Layer n°",$"Border and Walls".z_index,"/ Physics: ",$"Border and Walls".tile_set.get_physics_layer_collision_layer(0))
	$Props.tile_set.set_physics_layer_collision_layer(0,2**Level)
	print("Props: Layer n°",$Props.z_index,"/ Physics: ",$"Props".tile_set.get_physics_layer_collision_layer(0))
	$Nature.tile_set.set_physics_layer_collision_layer(0,2**Level)
	print("Nature: Layer n°",$Props.z_index,"/ Physics: ",$"Nature".tile_set.get_physics_layer_collision_layer(0))
