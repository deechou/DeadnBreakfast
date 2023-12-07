extends CanvasLayer

@onready var heartContainer = $HeartContainer

func _ready():
	heartContainer.setMaxHearts(Globals.playerMaxHealth)
	heartContainer.updateHearts()
	Globals.connect("healthStatChange", heartContainer.updateHearts)
	
