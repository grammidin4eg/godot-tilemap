extends Panel

@onready var inventory: Inventory = preload("res://inventory/inventory_res.tres")
@onready var slots: Array = $GridContainer.get_children()

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func _ready():
	visible = false
	update()

func open():
	visible = true
	
func close():
	visible = false
	
func toggle():
	visible = !visible
