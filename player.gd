extends CharacterBody2D
var speed=240
var gravity=20
var jumpspeed=600
var direction=Vector2.ZERO
var Cooldown = true
var health = 3

func _on_cooldown_timeout(): 
	Cooldown = true
func _on_player_spr_attack_animation_finished():
	$PlayerAreaRange/PlayerSprAttack.visible = false
	$PlayerAreaRange/PlayerCollRange.disabled = true

func _ready():
	$PlayerAreaRange/PlayerSprAttack.visible = false
	$PlayerAreaRange/PlayerCollRange.disabled = true

func _physics_process(delta):#this stuff makes the player move
	direction=Vector2.ZERO
	if Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y = -jumpspeed
	if Input.is_action_pressed("move_left"):
		direction.x=-1
	if Input.is_action_pressed("move_right"):
		direction.x=1
	if not is_on_floor():
		velocity.y += gravity 
	velocity.x = direction.x * speed
	#player attack
	if Input.is_action_just_pressed("attack") and Cooldown:
		Cooldown = false
		$Cooldown.start()
		$PlayerAreaRange/PlayerSprAttack.visible = true
		$PlayerAreaRange/PlayerSprAttack.play("attack")
		$PlayerAreaRange/PlayerCollRange.disabled = false
	
	
	move_and_slide()
