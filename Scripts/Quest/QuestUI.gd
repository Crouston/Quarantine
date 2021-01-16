extends Panel
class_name QuestUI

onready var questText = $QuestText


# Called when the node enters the scene tree for the first time.
func _ready():
	QuestSystem.questUI = questText

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
