extends Actor

#stats
var curHp : int = 15
var maxHp : int = 50
var damage : int = 1
var atttackRate : float = 1.0
var moveSpeed : float = 0
var score : int = 50

export var damageToTake : int = 1
export var fire_probability = 0.5

#components
onready var timer = get_node("Timer")
onready var player = get_node("/root/Level/Player")
onready var enemy = get_node("/root/Level/Enemy")
onready var EnemyBullet = load("res://Scenes/EnemyBullet.tscn")
export var escoreToGive : int = 10
onready var attack_is_ready : bool

func _ready():
	timer.wait_time = atttackRate
	attack_is_ready = false
	_velocity.x = -speed.x

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player.take_damagep(damageToTake)
	if body.name == "Bullet":
		enemy.take_damage(damageToTake)

func take_damage(damageToTake):
	curHp -= damageToTake
	if curHp <= 0:
		die()

func _on_Shoottimer_timeout():
	var b = EnemyBullet.instance()
	b.position = position
	b.position.y = position.y+70
	get_node("/root/Level/EnemyBullets").add_child(b)

func die():
	player.give_score(escoreToGive)
	get_tree().change_scene("res://Scenes/EndScreen.tscn")

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/EndScreen.tscn")
