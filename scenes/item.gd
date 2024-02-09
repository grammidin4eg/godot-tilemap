extends Area2D

signal on_pick

func _on_body_entered(body):
	queue_free()
	on_pick.emit()
