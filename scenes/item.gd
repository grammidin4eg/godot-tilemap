extends Area2D

func _on_body_entered(player):
	queue_free()
	player.health += 1
