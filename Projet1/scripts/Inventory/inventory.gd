extends Resource

class_name Inventory
signal updated
@export var slots: Array[InventorySlot]

func insert(item: InventoryItem):
	var itemSlots = slots.filter(func(slot): return slot.item == item and slot.amount < item.maxAmount) #liste des slots avec l'item
	if !itemSlots.is_empty() and itemSlots[0].amount < item.maxAmount:
		itemSlots[0].amount +=1 
	else:
		var emptySlots = slots.filter(func(slot): return slot.item == null) #liste des slots vides
		if !emptySlots.is_empty(): #on verif qu'il reste des slots de libre
			emptySlots[0].item = item # On affecte un type d'item au slot
			emptySlots[0].amount = 1

	updated.emit() # On envoie au GUI qu'il faut qu'il update

	
	
