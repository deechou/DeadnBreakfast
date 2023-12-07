extends CharacterBody2D

@export var speed = 35
@onready var animations = $AnimationPlayer
var rng = RandomNumberGenerator.new()
var moveDirection: Vector2 = Vector2.DOWN

func _ready():
	updateVelocity()

func updateVelocity():
	var dir = rng.randi_range(0,3)
	if dir == 0:
		moveDirection = Vector2.LEFT
	elif dir == 1:
		moveDirection = Vector2.RIGHT
	elif dir == 2:
		moveDirection = Vector2.UP
	elif dir == 3:
		moveDirection = Vector2.DOWN
		
	velocity = moveDirection * speed

func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		if velocity.x < 0: animations.current_animation = "walkLeft"
		elif velocity.x > 0: animations.current_animation = "walkRight"
		elif velocity.y > 0: animations.current_animation = "walkDown"
		else: animations.current_animation = "walkUp"
		
func _physics_process(_delta):
	updateAnimation()
	move_and_slide()
#	handleCollision()
	
#func handleCollision():
#	for i in get_slide_collision_count():
#		var collision = get_slide_collision(i)
#		var collider = collision.get_collider()
#

func _on_timer_timeout():
	updateVelocity()
	$Timer.start(4)
