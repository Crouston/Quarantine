extends CanvasLayer
class_name UserInterface


func _input(event):
	if event.is_action_pressed("Inventory"):
		$Inventory.visible = !$Inventory.visible
		$Inventory.initialize_inventory()
	if event.is_action_pressed("Pause"):
		$PausePanel.visible = !$PausePanel.visible
#	if event.is_action_pressed("Shop"):
#		$ShopPanel.visible = !$ShopPanel.visible
#	if event.is_action_pressed("Quest"):
#		$QuestUI.visible = !$QuestUI.visible

func close_inventory():
	$Inventory.visible = !$Inventory.visible
	$Inventory.initialize_inventory()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Pause():
	$PausePanel.visible = !$PausePanel.visible
