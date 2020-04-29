extends RigidBody2D

var damage: int = 1

export var speed = 500
onready var Player = get_node("/root/Level/Player")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.get_parent().name == "Enemy":
			c.take_damage(damage)
		queue_free()
	

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(-speed,0))
	state.set_angular_velocity(0)

