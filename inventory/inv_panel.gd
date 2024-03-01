extends Panel

@onready var inventory: Inventory = preload("res://inventory/inventory_res.tres")
@onready var slots: Array = $GridContainer.get_children()

signal use_item(item: InventoryItem)

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func _ready():
	visible = false
	update()
	
func toggle():
	visible = !visible


func _update_item(index, newItem):
	inventory.items[index] = newItem
	slots[index].update(newItem)

func _on_item_take_item(item):
	for i in range(inventory.items.size()):
		if !inventory.items[i]:
			_update_item(i, item)
			print('find cell: ', i)
			break

func _input(event):
	if Input.is_action_pressed("use_item") && visible:
		var finded_index = _find_clicked_item_index(event.position)
		if (finded_index >= 0) and inventory.items[finded_index]:
			use_item.emit(inventory.items[finded_index])
			_update_item(finded_index, null)

func _find_clicked_item_index(position) -> int:
	for i in range(slots.size()):
		if slots[i].get_global_rect().has_point(position):
			return i
	return -1
