extends RigidBody2D

signal locationChanged
@export_group("Properties")
@export var From :int = 0
@export var To :int = 0
@export var collidingLayers :int = 0
@export var renderingLayer :int = 0
@export_group("Path as a door")
@export var isADoor :bool = false
@export var targetScene :PackedScene 

func _on_body_entered(body: Node) -> void:
	if body.name == "Player" and body.currentLevel == From:
		body.currentLevel = To
		locationChanged.emit()
		
	
