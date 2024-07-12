extends AnimatedSprite2D

func _physics_process(delta):
	open_chest(delta)

func open_chest(delta):
	if Input.is_action_pressed("take"):
		$anim_chest.play("chest_open")
	
