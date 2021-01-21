extends InteractableItem
class_name npc

signal show_dialogue
signal show_questDilogue
signal show_questDilogueComplete
signal openShop
enum Type{normal,quest,shop}
export var npcType = Type.normal
var completed = false

func interaction_get_text() -> String:
	return "Talk"

func interaction_interact(interactionComponentParent : Node) -> void:
	print ("Talking to NPC !!!")
	if npcType == Type.quest:
		var q = $Quest
		if QuestSystem.currentQuest == "" || QuestSystem.currentQuest == $Quest.title:
			if q.quest_status == Quest.questStatus.notStarted:
				q.OnTaken()
			elif q.quest_status == Quest.questStatus.taken:
				if q.quantityQuest <= 0:
					completed = true
					q.OnCompleted()
	elif npcType == Type.shop:
		emit_signal("openShop")
	if npcType != Type.quest:
		emit_signal("show_dialogue")
	else:
		if completed:
			emit_signal("show_questDilogueComplete")
		elif !completed:
			emit_signal("show_questDilogue")
