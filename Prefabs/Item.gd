extends Node2D

var item_name
var item_quantity
var item_type

func _ready():
	var rand_val = randi() % 3
	if rand_val == 0:
		item_name = "Iron Sword"
	elif rand_val == 1:
		item_name = "Tree Branch"
	else:
		item_name = "Slime Potion"
	
	$TextureRect.texture = load("res://Sprites/Inventory/" + item_name + ".png")
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	item_quantity = randi() % stack_size + 1
	item_type = String(JsonData.item_data[item_name]["ItemCategory"])
	
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.text = String(item_quantity)

func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	item_type = JsonData.item_data[item_name]["ItemCategory"]
	$TextureRect.texture = load("res://Sprites/Inventory/" + item_name + ".png")
	
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.visible = true
		$Label.text = String(item_quantity)
		
func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)
	
func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)
	if(item_quantity <= 0):
		queue_free()

func use_item(nm):
	var add_health = JsonData.item_data[nm]["AddHealth"]
	var dec_infection = JsonData.item_data[nm]["DecInfection"]
	GameManager.player.set_health(add_health,dec_infection)
