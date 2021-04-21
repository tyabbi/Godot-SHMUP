extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("dash"):
		dash()
		
func shoot():
	pass
	
func dash():
	pass
