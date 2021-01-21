extends Panel

func _process(delta):
	$HealthBar.value = GameManager.currentHealth
	$InfectionBar.value = GameManager.currentInfection
