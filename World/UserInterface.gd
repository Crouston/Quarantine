extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(event):
	if event.is_action_pressed("Inventory"):
		$Inventory.visible = !$Inventory.visible
		$Inventory.initialize_inventory()
	if event.is_action_pressed("Shop"):
		$ShopPanel.visible = !$ShopPanel.visible
	if event.is_action_pressed("Quest"):
		$QuestUI.visible = !$QuestUI.visible


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
