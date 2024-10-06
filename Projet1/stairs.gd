extends Node2D


func _on_up_body_entered(body):
	if body.name == "Player":
		print("Up Ok")


func _on_down_body_entered(body):
	if body.name == "Player":
		print("Down Ok")
