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
@export var speed : int = -1 # -1 signifie que la vitesse ne change pas

func _on_trigger_body_entered(body: Node2D) -> void:
	pass
