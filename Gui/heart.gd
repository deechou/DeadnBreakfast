extends Panel

@onready var heartSprite = $Sprite2D

func updateFill(whole: bool):
	if whole: heartSprite.frame = 0
	else: heartSprite.frame = 4
