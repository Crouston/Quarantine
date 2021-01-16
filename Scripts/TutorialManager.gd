extends Node2D


onready var canvasLayer = $CanvasLayer

func _ready():
	for dialogue in canvasLayer.get_children():
		dialogue.initiate_dialogue()
