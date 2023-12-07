extends Panel

@onready var heartSprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateFill(whole: bool):
	if whole: heartSprite.frame = 0
	else: heartSprite.frame = 4
