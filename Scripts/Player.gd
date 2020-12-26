extends KinematicBody2D
class_name Player

signal change_health(amount)
signal change_max_health(amount)
var velocity = Vector2.ZERO
const accelerator = 1000
export var speed = 0

var health = 50
var max_health = 100
enum{
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			pass
		ATTACK:
			attack_state(delta)

func move_state(delta):
	var inputMove = Vector2.ZERO
	inputMove.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputMove.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputMove = inputMove.normalized() 
	
	if inputMove != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position",inputMove)
		animationTree.set("parameters/Walk/blend_position",inputMove)
		animationTree.set("parameters/Attack/blend_position",inputMove)
		animationState.travel("Walk")
		velocity = velocity.move_toward(inputMove * speed,accelerator * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO,accelerator * delta)
	
	velocity =  move_and_slide(velocity)
	
#	if Input.is_action_just_pressed("attack"):
#		state = ATTACK

func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE

func _input(event):
	if event.is_action_pressed("pickup"):
		if $PickupZone.items_in_range.size() > 0:
			var pickup_item = $PickupZone.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$PickupZone.items_in_range.erase(pickup_item)

func set_health(amount):
	health += amount
	health = clamp(health,0,max_health)
	GameManager.healthbar.value = health
	#emit_signal("change_health",health)

func dec_health(amount):
	health -= amount
	health = clamp(health,0,max_health)
	if GameManager.healthbar != null:
		GameManager.healthbar.value = health
	#emit_signal("change_health",health)

func _initialize():
	emit_signal("change_health",health)
	emit_signal("change_max_health",max_health)
