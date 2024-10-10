extends RigidBody2D

@export var isADoor :bool = false
@export var From :int = 0
@export var To :int = 0

func _on_body_entered(body: Node) -> void:
	if body.name == "Player" and body.currentLevel == From:
		pass
