extends Control

onready var result: Label = $Result
onready var player = get_node("/root/Level/Player")

func _on_Timer_timeout():
	get_tree().quit()
