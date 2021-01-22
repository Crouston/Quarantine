extends Node

var player = preload("res://Prefabs/Player.tscn").instance()
var healthbar 
var money = 250
var interactNpc:npc
var currentHealth = 50
var currentInfection = 0
var isUsingMask = false
var tagVirus = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func resetStat():
	money = 250
	currentHealth = 50
	currentInfection = 0
	isUsingMask = false
	PlayerInventory.inventory = PlayerInventory.startItem

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
