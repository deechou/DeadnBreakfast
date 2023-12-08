extends Control

@onready var inventory: Inventory = Globals.playerInventory
@onready var gridContainer: GridContainer = $NinePatchRect/GridContainer
@onready var inventorySlotScene: PackedScene = preload("res://Gui/inventory_slot.tscn")

var isOpen: bool = false

func _ready():
	inventory.inventoryChanged.connect(update)
	generateSlots()
	update()

func update():
	var slots = gridContainer.get_children()
	for i in range(Globals.inventorySize):
		slots[i].update(Globals.playerInventory.items[i])

func open():
	visible = true
	isOpen = true
	
func close():
	visible = false
	isOpen = false

func generateSlots():
	for i in range(Globals.inventorySize):
		gridContainer.add_child(inventorySlotScene.instantiate())
