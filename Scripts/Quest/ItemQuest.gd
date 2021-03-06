extends KinematicBody2D

signal itemFound

const ACCELERATION = 460
const MAX_SPEED = 225
var velocity = Vector2.ZERO
export var item_name = ""

var player = null
var being_picked_up = false

#func _ready():
#	item_name = "Slime Potion"
	
func _physics_process(delta):
	if being_picked_up == true:
		var goto = Vector2(player.global_position.x,player.global_position.y-3)
		var direction = global_position.direction_to(goto)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		
		var distance = global_position.distance_to(player.global_position)
		if distance < 4:
			emit_signal("itemFound")
			queue_free()
	velocity = move_and_slide(velocity, Vector2.UP)

func pick_up_item(body):
	player = body
	being_picked_up = true
