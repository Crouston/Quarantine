extends Node
class_name Quest

signal taken
signal completed

export var isFerry = false
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

func _ready():
	if !isTaken:
		for itemQuest in get_children():
			itemQuest.hide()
	if isCompleted:
		get_parent().npcType = get_parent().Type.normal
		queue_free()

func getItem():
	if quantityQuest > 0:
		quantityQuest -= 1

func OnTaken():
	for itemQuest in get_children():
			itemQuest.show()
	isTaken = true
	QuestSystem.currentQuest = title
	quest_status = questStatus.taken
	QuestSystem.questUI.text = description 

func OnCompleted():
	isCompleted = true
	quest_status = questStatus.completed
	QuestSystem.questUI.text = description + " completed"
	QuestSystem.currentQuest = ""
	PlayerInventory.add_item(rewardItems,quantityReward)
	if isFerry:
		get_parent().get_parent().cursec = get_parent().get_parent().IntroductionSection.meetFerry
		QuestSystem.questUI.text = "Go to Regina's Shop near Home"





