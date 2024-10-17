extends Node2D

@export var Level :int = 1
@export var collidingLayers :int = 0
@export var numberOfLayers :int = 3
@export var playerRenderingLayer :int = 2
@export var etageSuivant :Node2D

var WallColisions
 #Called when the node enters the scene tree for the first time.
func _ready() -> void:

	$Ground.z_index = Level*numberOfLayers
	$Border.z_index = Level*numberOfLayers + 1
	$Water.z_index = Level*numberOfLayers + 1
	#$Collectables.z_index = Level*numberOfLayers+playerRenderingLayer
	$Nature.z_index = Level*numberOfLayers + playerRenderingLayer
	$Props.z_index = Level*numberOfLayers + playerRenderingLayer

	print("--- Etage n°",Level," ---")
	#$Collectables.tile_set.set_physics_layer_collision_layer(0,2**collidingLayers)
	#print("Walls 1: Layer n°",$Collectables.z_index,"/ Physics: ",$Collectables.tile_set.get_physics_layer_collision_layer(0))
	$"Border".tile_set.set_physics_layer_collision_layer(0,2**collidingLayers)
	print("Border: Layer n°",$"Border".z_index,"/ Physics: ",$"Border".tile_set.get_physics_layer_collision_layer(0))
	$Props.tile_set.set_physics_layer_collision_layer(0,2**collidingLayers)
	print("Props: Layer n°",$Props.z_index,"/ Physics: ",$"Props".tile_set.get_physics_layer_collision_layer(0))
	$Nature.tile_set.set_physics_layer_collision_layer(0,2**collidingLayers)
	print("Nature: Layer n°",$Props.z_index,"/ Physics: ",$"Nature".tile_set.get_physics_layer_collision_layer(0))
