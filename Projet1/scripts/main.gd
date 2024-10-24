extends Node

func _ready():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	



func _on_inventory_gui_closed() -> void:
	get_tree().paused = false
	
func _on_inventory_gui_opened() -> void:
	get_tree().paused = true
