extends Node2D

var countdown = 10
var countdown2 = 30
var countdown3 = 180
enum IntroductionSection{outside,meetFerry,meetRegina,end,afterEnd}
var cursec = IntroductionSection.outside
var shopFirstTime = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if cursec == IntroductionSection.outside:
		$CanvasLayer.get_child(0).initiate_dialogue()
		QuestSystem.questUI.text = "meet Ferry"

func _process(delta):
	if cursec == IntroductionSection.meetFerry:
		countdown -= delta
		if countdown <= 0:
			$CanvasLayer.get_child(3).initiate_dialogue()
			QuestSystem.questUI.text = "meet Regina"
			cursec = IntroductionSection.meetRegina
	if cursec == IntroductionSection.end:
		countdown2 -= delta
		if countdown2 <= 0:
			$CanvasLayer.get_child(6).initiate_dialogue()
			cursec = IntroductionSection.afterEnd
	if cursec == IntroductionSection.afterEnd:
		countdown3 -= delta
		if countdown3 <= 0 && !$CanvasLayer.get_child(7).visible:
			$CanvasLayer.get_child(7).SucessOn()
			$CanvasLayer.get_child(7).visible = !$CanvasLayer.get_child(7).visible
	if GameManager.currentHealth <= 0 && !$CanvasLayer.get_child(7).visible:
		$CanvasLayer.get_child(7).FailOn()
		$CanvasLayer.get_child(7).visible = !$CanvasLayer.get_child(7).visible
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_dialogue():
	if !shopFirstTime && cursec == IntroductionSection.meetRegina:
		cursec = IntroductionSection.end
		QuestSystem.questUI.text = "go around town"
		$CanvasLayer.get_child(5).initiate_dialogue()
		shopFirstTime = true

func getShopDialogue():
	$CanvasLayer.get_child(4).initiate_dialogue()
