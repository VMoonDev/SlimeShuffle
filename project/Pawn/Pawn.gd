extends KinematicBody2D

const _GRAVITY := 200

var _velocity := Vector2.ZERO

func _physics_process(delta):
	_velocity.y = _GRAVITY
	
	move_and_slide(_velocity)
