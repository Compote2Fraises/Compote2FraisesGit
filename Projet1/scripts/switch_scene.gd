extends Node2D

@export_group("Target")
@export var targetScene : PackedScene
@export var cinematic : Resource
@export var sound : AudioStream

@export_group("Player in target")
@export var entry_position : Vector2
@export var zIndex : int = 0
@export var collisionLayer : Array[int]		# [1, 2, 4] Collision layer 1, 2 et 4
@export var collisionMask : Array[int]

func _on_trigger_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.z_index == self.z_index:
		body.queue_free() # Suppression du joueur actuel
		get_tree().change_scene_to_packed(targetScene) # Changement de scene
