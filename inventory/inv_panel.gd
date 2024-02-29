extends Panel

@onready var inventory: Inventory = preload("res://inventory/inventory_res.tres")
@onready var slots: Array = $GridContainer.get_children()

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func _ready():
	visible = false
	update()
	
func toggle():
	visible = !visible


func _on_item_take_item(item):
	for i in range(inventory.items.size()):
		if !inventory.items[i]:
			inventory.items[i] = item
			slots[i].update(item)
			print('find cell: ', i)
			break
