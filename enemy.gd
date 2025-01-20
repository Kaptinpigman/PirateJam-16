extends CharacterBody2D
const SPEED = 300.0
var direction = Vector2.ZERO

func _ready():
	pass
func _physics_process(delta):
	
	velocity = direction * SPEED
	
	move_and_slide()




func _on_area_2d_body_entered(body):
	if body.name == "player":
		print("hi")

func _on_area_2d_body_exited(body):
	print("body")
