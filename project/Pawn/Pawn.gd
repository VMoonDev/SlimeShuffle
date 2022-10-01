extends KinematicBody2D

const _GRAVITY := 200
const _MOVESPEED := 200
const _JUMPSTRENGTH := 200

var _velocity := Vector2.ZERO

func _physics_process(delta):
	_velocity.y = 0 if is_on_floor() else _velocity.y + _GRAVITY * delta
	_movement()
	_velocity = move_and_slide(_velocity, Vector2.UP)

func _movement():
	_velocity.x = Input.get_axis("move_left", "move_right") * _MOVESPEED
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y = -_JUMPSTRENGTH
