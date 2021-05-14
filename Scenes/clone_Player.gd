extends KinematicBody2D

var label = "PLAYER"
var shoot_timer = null
var jump_timer = null

var health = 1000
var bullet_delay = 0.2
var jump_delay = 2
const MOVE_SPEED = 150

var double_shot = false
var spread_shot = false

var power_timer = null

var can_shoot = true
var can_jump = true
var jump_count = 3

var bullet_scene = load("res://Scenes/Player_Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	shoot_timer = Timer.new()
	shoot_timer.set_one_shot(true)
	shoot_timer.set_wait_time(bullet_delay)
	shoot_timer.connect("timeout", self, "on_shoot_timeout_complete")
	add_child(shoot_timer)
	
	jump_timer = Timer.new()
	jump_timer.set_one_shot(true)
	jump_timer.set_wait_time(jump_delay)
	jump_timer.connect("timeout", self, "on_jump_timeout_complete")
	add_child(jump_timer)

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 2
	if Input.is_action_pressed("move_right"):
		move_vec.x += 2
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1.5
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1.5
	move_and_collide(move_vec * delta * MOVE_SPEED)

func on_shoot_timeout_complete():
	can_shoot = true
	
func on_jump_timeout_complete():
	
	can_jump = true

func _on_power_timeout_complete():
	double_shot = false
	spread_shot = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("/root/Main-Game/Health").set_text(str(health))
	
	if (Input.is_action_pressed("shoot") && can_shoot):
		shoot()
		can_shoot = false
		shoot_timer.start()
		
	if (Input.is_action_just_pressed("dash") && can_jump):
		if(jump_count > 0):
			jump(delta)
			can_jump = false
			jump_timer.start()
			jump_count = jump_count - 1
		
	if (health <= 0):
		get_parent().remove_child(self)
		queue_free()
		
func shoot():
	if(double_shot == true):
		var b1 = bullet_scene.instance()
		var b2 = bullet_scene.instance()
		
		b1.position.x = self.position.x - 6
		b1.position.y = self.position.y
		b1.rotation = self.rotation
		b2.position.x = self.position.x + 6
		b2.rotation = self.rotation
		b2.position.y = self.position.y
		b1.dir = Vector2(0, -10)
		b2.dir = Vector2(0, -10)
		
		get_parent().add_child(b1) 
		get_parent().add_child(b2) 
	elif(spread_shot == true):
		var b1 = bullet_scene.instance()
		var b2 = bullet_scene.instance()
		var b3 = bullet_scene.instance()
		
		b1.position = self.position
		b1.rotation = self.rotation - 25
		b2.position = self.position
		b2.rotation = self.rotation
		b3.position = self.position
		b3.rotation = self.rotation + 25
		b1.dir = Vector2(0, -10)
		b2.dir = Vector2(0, -10)
		b3.dir = Vector2(0, -10)
		
		get_parent().add_child(b1) 
		get_parent().add_child(b2) 
		get_parent().add_child(b3)
	else:
		var b = bullet_scene.instance()
		b.position = self.position
		b.rotation = self.rotation
		b.dir = Vector2(0, -10)
		get_parent().add_child(b) 
	
func jump(delta):
	set_collision_layer(32)
	
func _on_Timer_timeout():
	shoot()
