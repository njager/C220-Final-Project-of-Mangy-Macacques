extends Area2D

var damage: int = 1

export var speed: float = -500.0
onready var Player = get_node("/root/Level/Player")
onready var gunSound = get_node("/root/Level/Player/GunSound")

func _ready():
	gunSound.playing = true

func _physics_process(delta):
	position.x += speed * delta

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(speed,0))
	state.set_angular_velocity(0)

func _on_Bullet3_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		destroy()
	if body.name == "TileMap":
		destroy()

func destroy():
	queue_free()
