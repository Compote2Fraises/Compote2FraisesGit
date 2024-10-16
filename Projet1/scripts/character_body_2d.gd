extends CharacterBody2D

@export var speed = 200
@export var inventory: Inventory
@export var currentLevel :int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("MoveUp"):
		velocity.y -= 1
	if Input.is_action_pressed("MoveDown"): 
		velocity.y += 1
	if Input.is_action_pressed("MoveLeft"):
		velocity.x -= 1
	if Input.is_action_pressed("MoveRight"):
		velocity.x += 1
	if Input.is_action_just_released("info"):
		print("Z index : ", z_index, " | Collision mask : ", collision_mask)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
		#Annimation
	if velocity.x !=0:
		$AnimatedSprite2D.animation = "Walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "Down"
	elif velocity.y < 0 :
		$AnimatedSprite2D.animation="Up"
	
	move_and_slide()
	
func _on_hurt_box_area_area_entered(area):
	
	#Detection des collectibles
	var emptySlots = inventory.slots.filter(func(slot): return slot.item == null) # Tout les slots vides
	if area.has_method("collect"): # Si l'objet est un collectible
		if  (emptySlots != [] or inventory.slots[-1].amount < area.itemRes.maxAmount): # si il reste des slots vides OU si le dernier slot est incomplet
			area.collect(inventory)
