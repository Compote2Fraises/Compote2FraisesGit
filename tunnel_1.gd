extends Area2D

func _on_area_entered(area):
	if area.name == "Player":
		$Player.set_collision_layer_value(2, false)

func _on_area_exited(area):
	pass # Replace with function body.
