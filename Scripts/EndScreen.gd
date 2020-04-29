extends Control

onready var result: Label = $Result
onready var player = get_node("/root/Level/Player")

func _ready() -> void:
	result.text = result.text % [player.score, player.deaths]

func _on_Timer_timeout():
	get_tree().quit()
