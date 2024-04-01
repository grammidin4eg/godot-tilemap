extends Area2D

@export var nextSceneName: String

func _on_player_entered(body):
	var nextScene = load("res://scenes/" + nextSceneName + ".tscn")
	get_tree().change_scene_to_packed(nextScene)
