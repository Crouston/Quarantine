extends KinematicBody2D


const ACCELERATION = 300
const MAX_SPEED = 100
var velocity = Vector2.ZERO
var player = null
var attackingPlayer = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if $PlayerDetection.player != null:
		player = $PlayerDetection.player
		attackingPlayer = true
	if attackingPlayer:
		var direction = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		var distance = global_position.distance_to(player.global_position)
		if distance < 4:
			GameManager.player.dec_health(5)
			queue_free()
	velocity = move_and_slide(velocity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
