extends Node2D

@onready var hud = $HUD

func _ready():
	hud.inventoryOpened.connect(pause)
	hud.inventoryClosed.connect(unpause)
	
func pause():
	get_tree().paused = true
	
func unpause():
	get_tree().paused = false
