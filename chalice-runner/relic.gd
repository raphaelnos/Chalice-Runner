extends Area2D

@export var points: int = 1

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var manager = get_tree().current_scene.get_node("GameManager")
		manager.add_score(points)
		queue_free()
