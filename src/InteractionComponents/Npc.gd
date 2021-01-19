extends InteractableItem
class_name npc

signal show_dialogue
enum Type{normal,quest,shop}
export var npcType = Type.normal

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
					q.OnCompleted()
	emit_signal("show_dialogue")
