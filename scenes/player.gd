extends CharacterBody2D

const SPEED = 300.0

signal change_health(value)

@export var inventory: Inventory

var health: int = 0: get = _get_health, set = _set_health

func _get_health() -> int:
	return health

func _set_health(value: int) -> void:
	health = value
	change_health.emit(value)
	if health < 1:
		queue_free()

func _ready():
	health = 3;

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
