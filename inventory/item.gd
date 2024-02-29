extends Area2D

@export var item: InventoryItem;
signal take_item(item)

func _ready():
	$sprite.texture = item.texture


func _on_player_entered(player):
	queue_free()
	take_item.emit(item)
