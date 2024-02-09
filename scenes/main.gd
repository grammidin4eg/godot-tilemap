extends Node2D

var health: int

func _ready():
	health = 3
	$UI.set_health(health)

func _on_item_area_2d_on_pick():
	print("_on_health_pic")
	health += 1
	$UI.set_health(health)
