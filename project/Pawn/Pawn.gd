extends KinematicBody2D

const _GRAVITY := 800
const _MOVESPEED := 400
const _JUMPSTRENGTH := 450

var _velocity := Vector2.ZERO
var _wall_jumped := false

func _physics_process(delta):
	_velocity.y = 0 if is_on_floor() else _velocity.y + _GRAVITY * delta
	_movement()
	_velocity = move_and_slide(_velocity, Vector2.UP)

func _movement():
	if is_on_floor():
		_wall_jumped = false
	_velocity.x = Input.get_axis("move_left", "move_right") * _MOVESPEED
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y = -_JUMPSTRENGTH
	if Input.is_action_just_pressed("jump") and is_on_wall() and _wall_jumped == false:
		_wall_jumped = true
		_velocity.y = -_JUMPSTRENGTH
