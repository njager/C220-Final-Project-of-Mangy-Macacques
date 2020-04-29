extends Area2D

export var speed = -500
export var damageToTake = 1
onready var player = get_node("/root/Level/Player")


func _ready():
	pass

func _on_EnemyBullet_body_entered(body):
	if body.name == "Player":
		player.take_damagep(damageToTake)
		destroy()
	if body.name == "TileMap":
		destroy()

func _physics_process(delta):
	position.x += speed * delta

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(-speed,0))
	state.set_angular_velocity(0)

func destroy():
	queue_free()
