extends Node2D

var lvl = 0

func _ready():
	lvl = get_parent().get_parent().Level

func _on_up_body_entered(body):
	if body.name == "Player" and body.z_index == lvl*3+2:
		body.collision_mask = int(2**(lvl+1)) # mask joueur = etage de l'escalier + 1
		body.z_index = int((lvl+1)*3+2)
		print("Etage Supérieur : ", lvl+1)

func _on_down_body_entered(body):
	if body.name == "Player" and body.z_index == (lvl+1)*3+2:
		body.collision_mask = int(2**lvl) # mask joueur = etage de l'escalier
		body.z_index = int(lvl*3+2)
		print("Etage Inférieur : ",lvl)
