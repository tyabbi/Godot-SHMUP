extends KinematicBody2D

var label = "PLAYER"
var shoot_timer = null
var dash_timer = null

var health = 5
var bullet_delay = 0.2
var dash_delay = 2
const MOVE_SPEED = 150

var can_shoot = true
var can_dash = true

var bullet_scene = load("res://Scenes/Player_Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	shoot_timer = Timer.new()
	shoot_timer.set_one_shot(true)
	shoot_timer.set_wait_time(bullet_delay)
	shoot_timer.connect("timeout", self, "on_shoot_timeout_complete")
	add_child(shoot_timer)
	
	dash_timer = Timer.new()
	dash_timer.set_one_shot(true)
	dash_timer.set_wait_time(dash_delay)
	dash_timer.connect("timeout", self, "on_dash_timeout_complete")
	add_child(dash_timer)

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
	can_shoot = true;
	
func on_dash_timeout_complete():
	can_dash = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("/root/Main-Game/Health").set_text(str(health))
	
	if (Input.is_action_pressed("shoot") && can_shoot):
		shoot()
		can_shoot = false
		shoot_timer.start()
		
	if (Input.is_action_just_pressed("dash") && can_dash):
		dash(delta)
		can_dash = false
		dash_timer.start()
		
	if (health <= 0):
		get_parent().remove_child(self)
		queue_free()
		
func shoot():
	var b = bullet_scene.instance()
	b.position = self.position
	b.rotation = self.rotation
	b.dir = Vector2(0, -5)
	get_parent().add_child(b) 
	
func dash(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 25
	if Input.is_action_pressed("move_right"):
		move_vec.x += 25
	if Input.is_action_pressed("move_down"):
		move_vec.y += 25
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 25
	move_and_collide(move_vec * delta * MOVE_SPEED)
	
func _on_Timer_timeout():
	shoot()
