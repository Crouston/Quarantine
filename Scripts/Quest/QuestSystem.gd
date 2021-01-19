extends Node

var currentQuest : String
var questNumber = 0
var questTaken:String
var completeNumber = 0
var questComplete:String
var questUI 

#func _ready():
#	for quest in available.get_quests():
#		quest.connect("taken",self,"AddQuest")
#
#func AddQuest(reference: Quest):
#	var quest: Quest = available.find(reference)
#	quest.connect("completed",self,"AddComplete",[quest])
#	available.remove_child(quest)
#	taken.add_child(quest)

#func AddComplete(quest):
##	questComplete[completeNumber] = quest
##	completeNumber += 1
#	taken.remove_child(quest)
#	completed.add_child(quest)

#func CheckTaken():
#	for quest in questTaken:
#		quest.isTaken = true
#
#func CheckComplete():
#	for quest in questComplete:
#		quest.isCompleted = true

#func SetUI():
#	for quest in questTaken :
#		questUI.questText.Text = quest.description 
	#questUI.text = questTaken.description 
