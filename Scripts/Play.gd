extends Button

export (String,FILE) var scene_path: String




func _on_Play_pressed():
	if get_tree().change_scene(scene_path) != OK:
		print("warning")
