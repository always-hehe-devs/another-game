extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
var speed = 400
var direction
func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		animation_player.play("run_up_right")
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		animation_player.play("run_up_left")
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		direction = velocity
	elif direction:
		if direction.y < 0:
			if direction.x > 0:
				animation_player.play("idle_up_right")
			else:
				animation_player.play("idle_up_left")
		else:
			if direction.x > 0:
				animation_player.play("idle_down_right")
			else:
				animation_player.play("idle_down_left")

	position += velocity * delta
