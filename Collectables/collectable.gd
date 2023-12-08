extends Area2D
class_name Collectable

@export var itemResource: InventoryItem

func collect(inventory: Inventory):
	inventory.addItem(itemResource)
	queue_free()
