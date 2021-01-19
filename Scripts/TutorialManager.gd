extends Node2D


onready var canvasLayer = $CanvasLayer
enum tutorialSet{started,movement,useItem,end}
var curSet = tutorialSet.started

func _ready():
	if curSet == tutorialSet.started:
		canvasLayer.get_child(0).initiate_dialogue()
