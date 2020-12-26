extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	self.set_text(str(ShopManager.Quantity))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	if ShopManager.Quantity > 0:
		ShopManager.Quantity -= 1


func _on_Button_pressed():
	ShopManager.Quantity += 1
