extends KinematicBody2D

const _GRAVITY := 800
const _MOVESPEED := 400
const _JUMPSTRENGTH := 450
const _SCRAMBLESTRENGTH := 300
const _SLIDESPEED := 50

var _velocity := Vector2.ZERO
var _is_jumping := false
var _is_attacking := false
var _wall_jumped := 0
var wall_jump_max := 3 setget wall_jump_max_set

func _physics_process(delta):
	_gravity(delta)
	if _is_attacking == false:
		_movement()
		if Input.is_action_just_pressed("jump"):
			_jump()


func _movement():
	_velocity.x = Input.get_axis("move_left", "move_right") * _MOVESPEED
	_velocity = move_and_slide(_velocity, Vector2.UP)

		
func _gravity(delta):
	if is_on_floor():
		_velocity.y = 0
		_wall_jumped = 0
		_is_jumping = false
	elif is_on_wall() and _velocity.y > 0 or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		_velocity.y += _SLIDESPEED * delta
	else:
		_velocity.y += _GRAVITY * delta
		
func _jump():
	if _is_jumping == false:
		_is_jumping = true
		_velocity.y = -_JUMPSTRENGTH
	if is_on_wall() and _wall_jumped < wall_jump_max:
		_wall_jumped += 1
		_velocity.y = -_JUMPSTRENGTH
	if is_on_wall() and _wall_jumped == wall_jump_max:
		_wall_jumped += 1
		_velocity.y = -_SCRAMBLESTRENGTH
	_velocity = move_and_slide(_velocity, Vector2.UP)	

		
func _attack():
	if Input.is_action_just_pressed("attack"):
		_velocity.x *= 2
		
func wall_jump_max_set(new_value):
	wall_jump_max = new_value
	
		
func _power_up():
	wall_jump_max = 20
