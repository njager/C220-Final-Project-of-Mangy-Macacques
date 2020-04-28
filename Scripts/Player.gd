extends Actor

#stats
var score : int = 0
var curHp : int = 10
var maxHp : int = 10
var damage : int = 1

#components
onready var ui = get_node("CanvasLayer/UI")

func give_score(amount):
	score += amount
	ui.update_score_text(score)

func take_damage(damageToTake):
	curHp -= damageToTake
	ui.update_health_bar(curHp, maxHp)
	if curHp <= 0:
		die()

func die():
	pass
