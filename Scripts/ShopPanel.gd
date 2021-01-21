extends Panel

signal callDialog
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var isFirstTime = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func open_shop():
	if isFirstTime:
		isFirstTime = false
		emit_signal("callDialog")
	visible = !visible

func open_quantity():
	$QuantityPanel.visible = !$QuantityPanel.visible
