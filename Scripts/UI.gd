extends Control

onready var healthBar = get_node("HealthBar")
onready var scoreText = get_node("ScoreText")

func update_health_bar(curHp, maxHp):
	healthBar.value = (100 / maxHp) * curHp

func update_score_text(score):
	scoreText.text = "Score: " + str(score)
