extends Node
class_name Quest

signal taken
signal completed

enum questStatus {notStarted,taken,completed}
var quest_status = questStatus.notStarted
var itemFound = false

export var title : String
export var description : String
export var rewardItems: String
export var quantityReward: int
export var questItems: String
export var quantityQuest: int

var isTaken = false
var isCompleted = false

#func _ready():
#	for itemQuest in get_children():
#		itemQuest.connect("itemFound",self,getItem())

func getItem():
	if quantityQuest > 0:
		quantityQuest -= 1

func OnTaken():
	isTaken = true
	quest_status = questStatus.taken
	QuestSystem.questUI.text = description

func OnCompleted():
	isCompleted = true
	quest_status = questStatus.completed
	QuestSystem.questUI.text = description + " completed"
	PlayerInventory.add_item(rewardItems,quantityReward)


