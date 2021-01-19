extends Node2D

var enemy = preload("res://Prefabs/Enemy.tscn")
var camera = get_stack().find(Camera2D)
export var maxX = 50
export var minX = -50
export var maxY = 50
export var minY = -50
var enemyCount = 0
export var maxEnemy = 0
var timer = 0

func _process(delta):
	timer -= delta
	if enemyCount < maxEnemy && timer < 0:
		var enemyPosition = Vector2(rand_range(minX,maxX),rand_range(minY,maxY))
		var newEnemy = enemy.instance()
		newEnemy.global_position = enemyPosition + global_position
		add_child(newEnemy)
		enemyCount += 1
		
