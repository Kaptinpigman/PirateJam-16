extends CharacterBody2D
const SPEED = 100
var health = 2
var player_there = true
var playerpos
var target_pos

@onready var player = get_parent().get_parent().get_node("Player")

func _on_enemy_hitbox_area_entered(area):
	if area.name == "PlayerAreaRange":
		health -= 1
func _on_enemy_area_sight_body_entered(body):
	if body.name == "Player":
		player_there = true		
func _on_enemy_area_sight_body_exited(body):
	if body.name == "Player":
		player_there = false

func _ready():
	pass

func _physics_process(delta):
	playerpos = Vector2.ZERO
	playerpos = player.position
	target_pos = (player.position - position).normalized()	
	
	if player_there:
		velocity = target_pos * SPEED
	else:
		velocity = Vector2.ZERO
		
	if health < 1:
		self.queue_free()
		
	move_and_slide()


