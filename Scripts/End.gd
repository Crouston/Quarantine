extends Panel

export (String,FILE) var scene_path: String
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func SucessOn():
	$Success.play()
	$End.play()

func FailOn():
	$Fail.play()
	$End.play()

func _on_Button_pressed():
	$First.visible = !$First.visible
	$Second.visible = !$Second.visible


func _on_Exit_pressed():
	if get_tree().change_scene(scene_path) != OK:
		print("warning")
