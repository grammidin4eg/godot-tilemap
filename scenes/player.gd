extends CharacterBody2D


const SPEED = 300.0

func _set_animation(action: String):
	if Input.is_action_pressed(action):
		$AnimatedSprite2D.animation = action
		$AnimatedSprite2D.play()

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	if direction.length() == 0:
		$AnimatedSprite2D.animation = 'idle'
		$AnimatedSprite2D.stop()
	else:
		_set_animation('left')
		_set_animation('right')
		_set_animation('up')
		_set_animation('down')

	move_and_slide()
