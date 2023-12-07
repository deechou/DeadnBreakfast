extends Node

signal healthStatChange
signal utilityStatChange

var playerMaxHealth: int = 8:
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


