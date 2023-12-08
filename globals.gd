extends Node

signal healthStatChange
signal utilityStatChange

@onready var playerInventory: Inventory = preload("res://Inventory/player_inventory.tres")

var playerMaxHealth: int = 10:
	set(value):
		playerMaxHealth = value
		healthStatChange.emit()
		
var playerCurrHealth: int = playerMaxHealth:
	set(value):
		playerCurrHealth = value
		healthStatChange.emit()
		
var fasterRunWalk: float = 1.0:
	set(value):
		fasterRunWalk = value
		utilityStatChange.emit()

var inventorySize = 15:
	set(value):
		inventorySize = value
		utilityStatChange.emit()
