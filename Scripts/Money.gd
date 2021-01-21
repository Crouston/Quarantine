extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _process(delta):
	$Label.text = String(GameManager.money)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
