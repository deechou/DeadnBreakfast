extends Camera2D

@export var tilemap: TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSize = mapRect.size * tileSize
	limit_top = 0
	limit_left = 0
	limit_right = worldSize.x
	limit_bottom = worldSize.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
