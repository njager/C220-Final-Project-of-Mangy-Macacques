extends Actor

#stats
var score : int = 0
var curHp : int = 5
var maxHp : int = 5
var damage : int = 1

#components
onready var ui = get_node("CanvasLayer/UI")

func _physics_process(delta: float) -> void:
	var is_jump_interrupted = Input.is_action_just_released("up") and _velocity.y < 0.0 #removed a colon
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true)
	#Find move direction for gun
	var move_direction = int(Input.get_action_strength("right")) - int(Input.get_action_strength("left"))

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		-Input.get_action_strength("up") if is_on_floor() and Input.is_action_just_pressed("up") else 0.0
	)

func calculate_move_velocity(linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity

func give_score(amount):
	score += amount

func take_damage(damageToTake):
	curHp -= damageToTake
	if curHp <= 0:
		die()

func die() -> void:
	queue_free()

