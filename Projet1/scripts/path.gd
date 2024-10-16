extends Node2D

@export_group("Properties")
@export var From :int = 0
@export var To :int = 0
@export var renderingLayer :int = 0
@export_group("Next Floor Properties")
@export var numberOfLayers :int =0 
@export var playerRenderingLayer :int = 0
@export_group("Path as a door")
@export var isADoor :bool = false
@export var targetScene :PackedScene 
@export_group("Path as a tunnel")
@export var isATunnel :bool = false
@export var roof :TileMapLayer
@export var isInside : bool = false


func _on_trigger_body_entered(body: Node2D) -> void:
	
	if body.name == "Player" and body.currentLevel == From:
		body.currentLevel = To
		body.collision_mask = int(2**(To)) # mask joueur = etage de l'escalier + 1
		body.z_index = int((To)*numberOfLayers+playerRenderingLayer)
		print("Passage de : ",From," à : ", To)
		
		if isADoor:
			pass
		elif isATunnel:
			isInside = !isInside
			if isInside:
				print("IN")
				roof.enabled = false
			else:
				print("out")
				roof.enabled = true
