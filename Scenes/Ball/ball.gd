extends RigidBody2D

var _speed: int = 400
var _speed_mult: float = 1.1
var direction: Vector2 = Vector2.LEFT

func _ready():
	apply_impulse(direction * _speed, position)

func _physics_process(delta):
	var collision = move_and_collide(linear_velocity * delta)
	
	if collision:
		linear_velocity = linear_velocity.bounce(collision.get_normal()) * _speed_mult
