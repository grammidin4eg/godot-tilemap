extends Panel

@onready var inventory: Inventory = preload("res://inventory/inventory_res.tres")
@onready var slots: Array = $GridContainer.get_children()

var dragged_slot_index

signal use_item(item: InventoryItem)

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func _ready():
	visible = false
	dragged_slot_index = -1
	update()
	
func toggle():
	visible = !visible


func _update_item(index, newItem):
	inventory.items[index] = newItem
	slots[index].update(newItem)

func _reverse_item(index1: int, index2: int):
	if index1 > -1 and index2 > -1 and index1 != index2:
		var firstItem = inventory.items[index1]
		var secondItem = inventory.items[index2]
		_update_item(index1, secondItem)
		_update_item(index2, firstItem)

func _on_item_take_item(item):
	for i in range(inventory.items.size()):
		if !inventory.items[i]:
			_update_item(i, item)
			print('find cell: ', i)
			break

func _is_drag() -> bool:
	return dragged_slot_index > -1

func _canсel_drag():
	slots[dragged_slot_index].set_drag(false)
	dragged_slot_index = -1

func _input(event):
	if Input.is_action_pressed("use_item") && visible:
		var finded_index = _find_clicked_item_index(event.position)
		if (finded_index >= 0) and inventory.items[finded_index]:
			use_item.emit(inventory.items[finded_index])
			_update_item(finded_index, null)

	if _is_drag() and (Input.is_action_pressed("use_item") or Input.is_action_pressed("ui_cancel") or Input.is_action_pressed("inventory")):
		_canсel_drag()
		return

	if _is_drag() and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
		var finded_index = _find_clicked_item_index(event.position)
		print('release: ', finded_index)
		if (finded_index >= 0):
			_reverse_item(finded_index, dragged_slot_index)
		_canсel_drag()

	if visible and !_is_drag() and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var finded_index = _find_clicked_item_index(event.position)
		if (finded_index >= 0) and slots[finded_index]:
			print('click: ', finded_index)
			dragged_slot_index = finded_index
			slots[dragged_slot_index].set_drag(true)

func _find_clicked_item_index(position) -> int:
	for i in range(slots.size()):
		if slots[i].get_global_rect().has_point(position):
			return i
	return -1
