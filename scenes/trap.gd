extends Area2D

const ANGULAR_SPEED = PI * 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += ANGULAR_SPEED * delta


func _on_body_entered(player):
	player.health -= 1
