extends Node2D

var player_score: int = 0
var ai_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_score_zone_left_body_entered(body):
	print(body.name)
	if body.name == "Ball":
		ai_score += 1
		print(ai_score)


func _on_score_zone_right_body_entered(body):
	if body.name == "Ball":
		player_score += 1
		print(player_score)
