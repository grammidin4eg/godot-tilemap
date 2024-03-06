extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = %item

func update(item: InventoryItem):
	if !item:
		backgroundSprite.frame = 0
		itemSprite.visible = false
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture

func set_drag(drag: bool):
	%item.is_drag = drag
	if !drag:
		canсel_drag()

func canсel_drag():
	%item.position = Vector2(0,0)



func _on_mouse_entered():
	%select.visible = true


func _on_mouse_exited():
	%select.visible = false
