extends Node2D


func _on_start_button_pressed():
	var mainScene = load("res://scenes/main.tscn")
	get_tree().change_scene_to_packed(mainScene)
	#var loadingScreen
