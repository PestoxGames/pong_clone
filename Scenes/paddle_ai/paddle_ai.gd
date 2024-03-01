extends CharacterBody2D

@onready var ball = $"../Ball"
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var _speed = 800
@export var ball_tracking_acc = 0.85

var _speed_compensation: float = 60.0

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	animated_sprite_2d.play("idle")
	
func _physics_process(delta):
	var _clamp_max = Vector2(screen_size.x, screen_size.y - 50) 
	var ball_position = ball.position
	var target_y = ball_position.y * ball_tracking_acc
	
	var difference = target_y - position.y
	var error_adjustment = 0.1
	
	var _direction: Vector2 = Vector2.ZERO
	
	if target_y > position.y:
		_direction.y += 1
	
	elif target_y < position.y:
		_direction.y -= 1
	
	if velocity.y > 0:
		animated_sprite_2d.play("move_down")
	if velocity.y < 0:
		animated_sprite_2d.play("move_up")
	if velocity.y == 0:
		animated_sprite_2d.play("idle")
		
	_direction.y = clamp(difference * error_adjustment, -1, 1)
	
	velocity = _direction * (_speed * _speed_compensation) * delta 
	
	move_and_slide()
