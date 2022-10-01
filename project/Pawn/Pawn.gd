extends KinematicBody2D

const _GRAVITY := 800
const _MOVESPEED := 400
const _JUMPSTRENGTH := 450
const _SLIDESPEED := 50

var _velocity := Vector2.ZERO
var _is_jumping := false
var _wall_jumped := 0

func _physics_process(delta):
	_gravity(delta)
	_attack()
	_movement()


func _movement():
	_velocity.x = Input.get_axis("move_left", "move_right") * _MOVESPEED
	if is_on_floor():
		_is_jumping = false
		_wall_jumped = 0
	if Input.is_action_just_pressed("jump") and _is_jumping == false:
		_is_jumping = true
		_velocity.y = -_JUMPSTRENGTH
	if Input.is_action_just_pressed("jump") and is_on_wall() and _wall_jumped < 2:
		_wall_jumped += 1
		_velocity.y = -_JUMPSTRENGTH
	_velocity = move_and_slide(_velocity, Vector2.UP)

		
func _gravity(delta):
	if is_on_floor():
		_velocity.y = 0
	elif is_on_wall() and _velocity.y > 0 or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		_velocity.y += _SLIDESPEED * delta
	else:
		_velocity.y += _GRAVITY * delta
		
func _attack():
	if Input.is_action_just_pressed("attack"):
		_velocity.x *= 2
		move_and_slide(_velocity, Vector2.UP)
