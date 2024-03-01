extends Control

@onready var player_score = $PlayerScore
@onready var ai_score = $AIScore

func update_player_score(score):
	player_score.text = str(score)
	
func update_ai_score(score):
	ai_score.text = str(score)
