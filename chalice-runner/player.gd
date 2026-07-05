extends CharacterBody2D

@export var speed: float = 180.0
@export var jump_velocity: float = -350.0

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction := Input.get_axis("ui_left", "ui_right")

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	if direction != 0:
		velocity.x = direction * speed
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	update_animation(direction)
	move_and_slide()

func update_animation(direction: float) -> void:
	if not is_on_floor():
		if sprite.sprite_frames.has_animation("jump"):
			sprite.play("jump")
	elif direction != 0:
		if sprite.sprite_frames.has_animation("run"):
			sprite.play("run")
	else:
		if sprite.sprite_frames.has_animation("idle"):
			sprite.play("idle")
