extends CharacterBody2D


const speed = 50 
var dir
var move

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("walk_right"):
		print("move right")
		dir = "right"
		move = 1
		player_move()
		if Input.is_action_pressed("sprint"):
			velocity.x = speed * 2
			velocity.y = 0
		else:
			velocity.x = speed
			velocity.y = 0
	elif Input.is_action_pressed("walk_left"):
		dir = "left"
		move = 1
		player_move()
		if Input.is_action_pressed("sprint"):
			velocity.x = -(speed * 2)
			velocity.y = 0
		else:
			velocity.x = -speed
			velocity.y = 0
	elif Input.is_action_pressed("walk_up"):
		dir = "up"
		move = 1
		player_move()
		if Input.is_action_pressed("sprint"):
			velocity.y = -(speed * 2)
			velocity.x = 0
		else:
			velocity.y = -speed
			velocity.x = 0
	elif Input.is_action_pressed("walk_down"):
		dir = "down"
		move = 1
		player_move()
		if Input.is_action_pressed("sprint"):
			velocity.y = speed * 2
			velocity.x = 0
		else:
			velocity.y = speed
			velocity.x = 0
	else:
		move = 0
		player_move()
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
	
func player_move():
	var anim = $Animation
	if dir == "right":
		anim.flip_h = false
		if move == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if move == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")
	if dir == "up":
		anim.flip_h = true
		if move == 1:
			anim.play("back_walk")
		else:
			anim.play("back_idle")
	if dir == "down":
		if move == 1:
			anim.play("front_walk")
		else:
			anim.play("front_idle")


