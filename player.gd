extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
var speed = 400
var direction


func _physics_process(delta):
	velocity = Vector2.ZERO
	
	handle_movement_input()
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		direction = velocity
	
	if animation_player.current_animation != "attack_up_right":
		handle_animation()
	position += velocity * delta

func handle_movement_input():
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

func _unhandled_input(event):
	if event.is_action("ui_accept"):
		animation_player.play("attack_up_right")
		
func handle_animation():
	if velocity.length() > 0:
		if direction.y < 0:
			if direction.x > 0:
				animation_player.play("run_up_right")
			else:
				animation_player.play("run_up_left")
		else:
			if direction.x > 0:
				animation_player.play("run_down_right")
			else:
				animation_player.play("run_down_left")
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
