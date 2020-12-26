extends TextureProgress

onready var health_bar = $HealthBar

func _on_health_updated(health,amount):
	health_bar.value = Player.health

func _on_max_health_updated(health,amount):
	health_bar.max_value = Player.max_health
