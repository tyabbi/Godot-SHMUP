extends KinematicBody2D

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	if Input.is_action_pressed("move_down"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_up"):
		move_vec.y += 1

func _process(delta):
	if Input.is_action_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("dash"):
		dash()
		
func shoot():
	pass
	
func dash():
	pass