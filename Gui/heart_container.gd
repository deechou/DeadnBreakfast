extends HBoxContainer

@onready var HeartScene = preload("res://Gui/heart.tscn")

func setMaxHearts(maxHearts: int):
	for i in range(maxHearts):
		var heart = HeartScene.instantiate()
		add_child(heart)

func updateHearts():
	var hearts = get_children()
	
	var dmg = Globals.playerMaxHealth - Globals.playerCurrHealth
	for i in range(dmg):
		hearts[i].updateFill(false)
	
	for i in range(dmg, Globals.playerMaxHealth):
		hearts[i].updateFill(true)
