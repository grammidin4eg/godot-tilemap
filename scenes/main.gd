extends Node2D


func _on_trap_body_entered(body):
	print("hit")
	# health -= 1
	#$UI.set_health(health)



func _on_player_change_health(value):
	$UI.set_health(value)
