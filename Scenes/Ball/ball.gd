extends CharacterBody2D

var _speed: int = 600
var direction: Vector2 = Vector2.LEFT
var _initial_direction:Vector2
var _speed_mult: float = 1.1

func _ready():
	initial_impulse()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	var random_angle_offset = randf_range(-0.5, 0.5)
	
	if collision: 
		
		if collision.get_collider().get_name().begins_with("Paddle"):
			velocity = velocity.bounce(collision.get_normal()).rotated(random_angle_offset) * _speed_mult
		
		if collision.get_collider().get_name().begins_with("Wall"):
			velocity = velocity.bounce(collision.get_normal())
			
func reset_ball():
	position = Vector2(576, 320)
	initial_impulse()
#
func initial_impulse():
	var _random_dir = randi() % 2
	_initial_direction = Vector2.RIGHT if _random_dir else Vector2.LEFT
	velocity = _speed * _initial_direction
	
