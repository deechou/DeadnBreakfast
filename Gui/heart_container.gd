extends HBoxContainer

@onready var HeartScene = preload("res://Gui/heart.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setMaxHearts(max: int):
	for i in range(max):
		var heart = HeartScene.instantiate()
		add_child(heart)

func updateHearts():
	var hearts = get_children()
	
	var dmg = Globals.playerMaxHealth - Globals.playerCurrHealth
	for i in range(dmg):
		hearts[i].updateFill(false)
	
	for i in range(dmg, Globals.playerMaxHealth):
		hearts[i].updateFill(true)
