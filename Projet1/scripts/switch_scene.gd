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
	if body.name == "Player" and true : 				# A la place de true, vérifier qu'il est au bon étage pour intéragire avec le switch Scene
		get_tree().change_scene_to_packed(targetScene) 	# Change de scène
		body.position = entry_position 					# Met le joueur à la bonne position
		body.z_index = zIndex 							# Met le joueur au bon z_index
		
		if cinematic:
			pass # Gérer le système d'animationPlayer
		
		if sound:
			var sound_player = AudioStreamPlayer.new()  # Crée un nouveau player audio
			sound_player.stream = sound                 # Associe le son
			add_child(sound_player)                     # Ajoute le player à la scène
			sound_player.play()                         # Joue le son
		
		# Si on veut changer le collision layer
		if collisionLayer:
			body.collision_layer = 0 # Efface tout les collision layer du joueur
			for layer in collisionLayer:
				body.collision_layer |= 2**(layer - 1) # Active chaque bit de collision voulu
		# Meme chose si on veut changer le collision mask
		if collisionMask:
			body.collision_mask = 0
			for mask in collisionMask:
				body.collision_mask |= 2**(mask - 1)
		# Si on veut changer la vitesse
		if speed != -1:
			body.speed = speed
