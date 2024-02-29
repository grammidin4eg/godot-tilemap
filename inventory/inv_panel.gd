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


func _updateItem(index, newItem):
	inventory.items[index] = newItem
	slots[index].update(newItem)

func _on_item_take_item(item):
	for i in range(inventory.items.size()):
		if !inventory.items[i]:
			_updateItem(i, item)
			print('find cell: ', i)
			break

func _input(event):
	if Input.is_action_pressed("use_item") && visible:
		var findedIndex = _findClickedItemIndex(event.position)
		print('findedIndex: ', findedIndex)
		if (findedIndex >= 0) and inventory.items[findedIndex]:
			use_item.emit(inventory.items[findedIndex])
			_updateItem(findedIndex, null)

func _findClickedItemIndex(position) -> int:
	for i in range(slots.size()):
		if slots[i].get_global_rect().has_point(position):
			return i
	return -1
