extends Panel

func _ready():
	visible = false

func open():
	visible = true
	
func close():
	visible = false
	
func toggle():
	visible = !visible
