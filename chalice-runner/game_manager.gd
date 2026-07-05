extends Node

var score: int = 0
@onready var score_label: Label = $"../UI/ScoreLabel"

func _ready() -> void:
	update_score()

func add_score(amount: int) -> void:
	score += amount
	update_score()

func update_score() -> void:
	if score_label:
		score_label.text = "Relikte: " + str(score)
