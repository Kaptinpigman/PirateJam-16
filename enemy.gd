extends CharacterBody2D
const SPEED = 300.0
var direction = Vector2.ZERO
var health = 2
func _ready():
	pass
func _physics_process(delta):
	
	velocity = direction * SPEED
	if health < 1:
		hide()
	move_and_slide()

func _on_enemy_hitbox_area_entered(area):
	if area.name == "PlayerAreaRange":
		health -= 1
