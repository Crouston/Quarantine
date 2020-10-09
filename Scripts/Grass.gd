extends StaticBody2D


func call_grass_effect():
		var GrassEffect = load("res://Prefabs/GrassEffect.tscn")
		var grassEffect = GrassEffect.instance()
		var world = get_tree().current_scene
		world.add_child(grassEffect)
		grassEffect.global_position = global_position

func _on_HurtBox_area_entered(area):
	call_grass_effect()
	queue_free()
