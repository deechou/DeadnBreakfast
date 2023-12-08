extends CharacterBody2D
@export var speed = 35
@export var knockbackPower = 500

@onready var animations = $AnimationPlayer
@onready var hurtBox = $HurtBox
@onready var effects = $Effects
@onready var effectsTimer = $EffectsTimer

var invincible: bool = false

func _ready():
	effects.play("RESET")

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
	handleDamage()
	updateAnimation()

func handleDamage():
	if !invincible:
		for attack in hurtBox.get_overlapping_areas():
			if attack.name == "Hitbox":
				takeDamage(attack)
			
func takeDamage(attack):
#	print_debug(attack.name)
#	print_debug(attack.get_parent().name)
#	var enemy = attack.get_node("..")
	
	Globals.playerCurrHealth -= 1
	knockback(attack.get_parent().velocity)
	blinkRed()
	if Globals.playerCurrHealth <= 0:
		print_debug("YOU DIED")
		Globals.playerCurrHealth = Globals.playerMaxHealth
	else:
		print_debug(Globals.playerCurrHealth)


func knockback(enemyVelocity: Vector2):
	var knockbackDirection = (enemyVelocity-velocity).normalized() * knockbackPower
	velocity = knockbackDirection
	move_and_slide()

func blinkRed():
	invincible = true
	speed = 20
	effects.play("blinkRed")
	effectsTimer.start(0.75)
	await effectsTimer.timeout
	effects.play("RESET")
	invincible = false
	speed = 70

func _on_hurt_box_area_entered(area): 
	if area.has_method("collect"):
		area.collect(Globals.playerInventory)

func _on_hurt_box_area_exited(_area): pass
