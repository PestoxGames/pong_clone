extends CharacterBody2D

@onready var ball = $"../Ball"

@export var _speed = 1000
@export var ball_tracking_acc = 0.8

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	var _clamp_max = Vector2(screen_size.x, screen_size.y - 50) 
	var ball_position = ball.position
	var target_y = ball_position.y * ball_tracking_acc + position.y * (1 - ball_tracking_acc)

	var velocity = Vector2.ZERO
	
	if target_y > position.y:
		velocity.y += 1
	
	elif target_y < position.y:
		velocity.y -= 1
	
	velocity = velocity * _speed
	
	position += velocity * delta
	position = position.clamp(Vector2(0, 50), _clamp_max)

