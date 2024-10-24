extends Node2D


func _ready():
	var player_instance = preload("res://scenes/Player.tscn").instantiate()
	add_child(player_instance)  # Ajouter le joueur dans la nouvelle scène
	player_instance.position = Vector2(460, 300)
	player_instance.z_index = 2
	player_instance.collision_layer = 1
	player_instance.collision_mask = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
