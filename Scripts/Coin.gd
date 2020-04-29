extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var pscoreToGive : int = 5

func _ready():
	$AnimationPlayer.play("Bob")

func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.give_score(pscoreToGive)
		$PillGet.playing = true
		queue_free()
