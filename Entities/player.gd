extends CharacterBody2D
@export var speed = 35
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
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
	handleInput()
	move_and_slide()
	updateAnimation()
