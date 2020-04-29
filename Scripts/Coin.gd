extends Area2D

onready var pillSound: AudioStreamPlayer2D = $PillSound
onready var pillParticle: Particles2D = $PillParticle
onready var player = get_node("/root/Level/Player")

export var pscoreToGive : int = 5

func _ready():
	$AnimationPlayer.play("Bob")

func _on_Coin_body_entered(body):
	if body.name == "Player":
		picked()

func picked():
	player.give_score(pscoreToGive)
	pillSound.playing = true
	pillParticle.emitting = true
	$AnimationPlayer.play("picked")
