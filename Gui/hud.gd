extends CanvasLayer

@onready var heartContainer = $HeartContainer
@onready var inventory = $Inventory

signal inventoryOpened
signal inventoryClosed


func _ready():
	heartContainer.setMaxHearts(Globals.playerMaxHealth)
	heartContainer.updateHearts()
	Globals.connect("healthStatChange", heartContainer.updateHearts)
	inventory.close()
	
func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
			inventory.close()
			inventoryClosed.emit()
		else:
			inventory.open()
			inventoryOpened.emit()
