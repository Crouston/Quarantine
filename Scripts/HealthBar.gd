extends Control

onready var health_bar = $HealthBar
onready var infection_bar = $InfectionRate
var health

func _process(delta):
	GameManager.healthbar = health_bar
	health_bar.value = GameManager.currentHealth
	infection_bar.value = GameManager.currentInfection

func _on_Player_change_health(amount:int) -> void:
	print(amount)
	health_bar.value = amount


func _on_Player_change_max_health(amount):
	health_bar.max_value = amount
