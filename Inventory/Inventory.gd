extends Resource
class_name Inventory

signal inventoryChanged

@export var items: Array[InventoryItem]

func addItem(item: InventoryItem):
	for i in range(items.size()):
		if !items[i]:
			items[i] = item
			break
	inventoryChanged.emit()
	
