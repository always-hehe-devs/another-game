extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
var speed = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		if Input.is_action_just_released("ui_right"):
			animation_player.play("idle_down_right")
		if Input.is_action_just_released("ui_left"):
			animation_player.play("idle_down_left")
	position += velocity * delta
