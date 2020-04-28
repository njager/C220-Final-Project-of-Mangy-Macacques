extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(350.0, 450.0)
export var gravity: = 1200.0

var _velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta

