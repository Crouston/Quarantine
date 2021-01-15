extends InteractableItem
class_name npc

export var npcName: String
signal show_dialogue

func interaction_get_text() -> String:
	return "Talk"

func interaction_interact(interactionComponentParent : Node) -> void:
	print ("Talking to NPC !!!")
	GameManager.dialogBox
	emit_signal("show_dialogue")
