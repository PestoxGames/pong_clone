extends Node2D

@onready var ball = $Ball
@onready var countdown_timer = $CountdownTimer
@onready var hud = $HUD

var player_score: int = 0
var ai_score: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reset_game():
	# Center ball
	ball.reset_ball() 
	pass


func _on_score_zone_left_body_entered(body):
	if body.name == "Ball":
		ai_score += 1
		hud.update_ai_score(ai_score)
		countdown_timer.start()


func _on_score_zone_right_body_entered(body):
	if body.name == "Ball":
		player_score += 1
		hud.update_player_score(player_score)
		countdown_timer.start()


func _on_countdown_timer_timeout():
	reset_game()
