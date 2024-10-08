extends Node2D

"""
Explication du script :
Quand le joueur passe sur le haut de l'escalier son collision mask est mis à numero de l'étage + 1 (Car il monte à l'etage supérieur)
Quand le joueur passe sur le bas de l'escalier son collision mask est mis à numero de l'étage (Car il descend sur l'etage actuel)

Commandes utilisée :
	
get_parent().get_parent():
	retourne le parent du parent 
	Dans l'architecture d'un etage le parent d'un escalier s'appel toujours "Stairs or Bridge and tunnel"
	Le parent de ce dernier s'appel toujours "Etage n" avec n appartenant à Z (Tout pour l'analyse)

name.split(" "):
	sépare le nom du noeud ciblé en fonction des espaces et le met dans un tableau, dans notre cas : "Etage n" devient ["Etage", "n"]

[1]:
	renvoie l'élément d'indice 1 de la liste, dans notre cas : "n"

int(toutes_les_commandes_precedentes):
	transforme le resultat en entier, dans notre cas "n" -> n
	
Nous avons donc le numero de l'étage nous permettant de poser nos escaliers n'importe ou tout en restant fonctionnel simplement en les rangeant correctement dans l'arbre
"""
var lvl = 0

func _ready() -> void:
	lvl = get_parent().get_parent().Level

func _on_up_body_entered(body):
	if body.name == "Player" and body.z_index == lvl+1:
		body.collision_mask = int(lvl) + 1 # mask joueur = etage de l'escalier + 1
		body.z_index = int(lvl + 2)
		print("Etage Supérieur : ", lvl+1)

func _on_down_body_entered(body):
	if body.name == "Player" and body.z_index == lvl+2:
		body.collision_mask = int(lvl) # mask joueur = etage de l'escalier
		body.z_index = int(lvl+1)
		print("Etage Inférieur : ", lvl)
