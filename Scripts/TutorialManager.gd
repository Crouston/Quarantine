extends Node2D

onready var canvasLayer = $CanvasLayer
enum tutorialSet{started,movement,pickItem,useItem,end}
var curSet = tutorialSet.started

func _ready():
	if curSet == tutorialSet.started:
		canvasLayer.get_child(0).initiate_dialogue()

func _process(delta):
	if (GameManager.currentHealth == 100 || GameManager.isUsingMask) && curSet == tutorialSet.useItem && !canvasLayer.get_child(3).visible:
		$UserInterface.close_inventory()
		canvasLayer.get_child(3).initiate_dialogue()
	if Input.is_action_just_pressed("pickup") && curSet == tutorialSet.pickItem:
		canvasLayer.get_child(2).initiate_dialogue()
	if curSet == tutorialSet.end && !$Portal.visible:
		$Portal.visible = !$Portal.visible

func _input(event):
	if curSet == tutorialSet.movement:
		if event.is_action_pressed("ui_down"):
			canvasLayer.get_child(1).initiate_dialogue()

func goNext():
	if curSet == tutorialSet.started:
		curSet = tutorialSet.movement
		QuestSystem.questUI.text = "Press W,A,S,D"
	elif curSet == tutorialSet.movement:
		curSet = tutorialSet.pickItem
		QuestSystem.questUI.text  = "Go to nearest Item ,Press E"
	elif curSet == tutorialSet.pickItem:
		curSet = tutorialSet.useItem
		QuestSystem.questUI.text  = "Press I, Click Item ,Press F"
	elif curSet == tutorialSet.useItem:
		curSet = tutorialSet.end
		QuestSystem.questUI.text  = "Go Out"
