extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

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

	if velocity.y > 0:
		animated_sprite_2d.play("move_down")
	if velocity.y < 0:
		animated_sprite_2d.play("move_up")
	if velocity.y == 0:
		animated_sprite_2d.play("idle")

	if velocity.length() > 0:
		var _clamp_max = Vector2(screen_size.x, screen_size.y - 50)
		velocity = velocity * speed
		position += velocity * delta
		position = position.clamp(Vector2(0, 50), _clamp_max)
