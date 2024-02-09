extends CanvasLayer

func set_health(value: int):
	$Panel/HealthLabel.text = str(value)
