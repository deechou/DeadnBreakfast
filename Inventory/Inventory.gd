extends Resource
class_name Inventory

signal inventoryChanged

@export var inventorySlots: Array[InventorySlot]

func addItem(item: InventoryItem):
	for slot in inventorySlots:
		if slot.item == item:
			slot.amount += 1
			inventoryChanged.emit()
			return
	
	for i in range(inventorySlots.size()):
		if !inventorySlots[i].item:
			inventorySlots[i].item = item
			inventorySlots[i].amount += 1
			inventoryChanged.emit()
			return
	
