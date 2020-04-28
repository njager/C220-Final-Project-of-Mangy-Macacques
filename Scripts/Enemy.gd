extends Actor

#stats
var curHp : int = 3
var maxHp : int = 3
var damage : int = 1
var atttackRate : float = 1.0
var moveSpeed : float = 4
var score : int = 5

export var damageToTake : int = 1


#components
onready var timer = get_node("Timer")
onready var player = get_node("res://Scenes/Player.tscn")
onready var attack_is_ready : bool

func _ready():
	timer.wait_time = atttackRate
	attack_is_ready = false
	_velocity.x = -speed.x

func _physics_process(delta):
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _on_Area2D_body_entered(body):
	if attack_is_ready == true:
		player.take_damage()

func _on_Timer_timeout():
	attack_is_ready = true

func take_damage(damageToTake):
	curHp -= damageToTake
	if curHp <= 0:
		die()

func die():
	queue_free()

