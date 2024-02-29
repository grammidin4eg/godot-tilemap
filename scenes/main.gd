extends Node2D


func _on_trap_body_entered(body):
	print("hit")
	# health -= 1
	#$UI.set_health(health)



func _on_player_change_health(value):
	$UI.set_health(value)


func _on_inv_panel_use_item(item: InventoryItem):
	print("use item: ", item.name)
	match item.name:
		'lifepotion':
			$Player.health += 1
		'poison_potion':
			$Player.health -= 1
