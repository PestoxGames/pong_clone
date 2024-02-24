extends CharacterBody2D

@export var speed = 1000

var sprite_comp = 20
var screen_size

func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	if Input.is_action_pressed("down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		print(screen_size)
		var _clamp_max = Vector2(screen_size.x, screen_size.y - 50) 
		velocity = velocity * speed
		position += velocity * delta
		position = position.clamp(Vector2(0, 50), _clamp_max)
