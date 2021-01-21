extends KinematicBody2D
class_name Player

signal change_health(amount)
signal change_max_health(amount)
var velocity = Vector2.ZERO
const accelerator = 1000
export var speed = 0

var health = 50
var max_health = 100
var infection = 0
var max_infection = 100
var countdownMin = 10
var isUsingMask = false
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
	isUsingMask = GameManager.isUsingMask
	animationTree.active = true
	health = GameManager.currentHealth
	infection = GameManager.currentInfection

func _physics_process(delta):
	countdownMin -= delta
	if infection >= 65 && countdownMin <= 0:
		countdownMin = 10
		dec_health(1,0)
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
		animationTree.set("parameters/MaskIdle/blend_position",inputMove)
		animationTree.set("parameters/MaskWalk/blend_position",inputMove)
		if !isUsingMask:
			animationState.travel("Walk")
		elif isUsingMask:
			animationState.travel("MaskWalk")
		velocity = velocity.move_toward(inputMove * speed,accelerator * delta)
	else:
		if !isUsingMask:
			animationState.travel("Idle")
		elif isUsingMask:
			animationState.travel("MaskIdle")
		velocity = velocity.move_toward(Vector2.ZERO,accelerator * delta)
	
	velocity =  move_and_slide(velocity)
	
	if velocity != Vector2.ZERO && !$AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.play()
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

func set_health(amount1,amount2):
	health += amount1
	health = clamp(health,0,max_health)
	infection -= amount2
	infection = clamp(infection,0,max_infection)
	GameManager.currentHealth = health
	GameManager.healthbar.value = health
	GameManager.currentInfection = infection
	#emit_signal("change_health",health)

func dec_health(amount1,amount2):
	health -= amount1
	health = clamp(health,0,max_health)
	infection += amount2
	infection = clamp(infection,0,max_infection)
	if GameManager.healthbar != null:
		GameManager.currentInfection = infection
		GameManager.currentHealth = health
		GameManager.healthbar.value = health
	#emit_signal("change_health",health)

func _initialize():
	emit_signal("change_health",health)
	emit_signal("change_max_health",max_health)

func setMask(isMask):
	if isMask:
		GameManager.isUsingMask = true
		isUsingMask = true
