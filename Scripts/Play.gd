extends Button

export (String,FILE) var scene_path: String




func _on_Play_pressed():
	GameManager.resetStat()
	if get_tree().change_scene(scene_path) != OK:
		print("warning")


func _on_Quit_pressed():
	pass # Replace with function body.
