extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var scoreToGive : int = 5

func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.give_score(scoreToGive)
		queue_free()
