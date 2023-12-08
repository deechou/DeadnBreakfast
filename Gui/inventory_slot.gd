extends Panel

#This is the Script that handles the Inventory Slot GUI - NOT the resource!
@onready var backgroundSprite: Sprite2D = $Background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item
@onready var amountLabel: Label = $CenterContainer/Panel/Label

func update(inventorySlot: InventorySlot):
	if !inventorySlot.item:
		backgroundSprite.frame = 0
		itemSprite.visible = false
		amountLabel.visible = false
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = inventorySlot.item.texture
		if inventorySlot.amount > 1:
			amountLabel.visible = true
			amountLabel.text = str(inventorySlot.amount)
			
		
