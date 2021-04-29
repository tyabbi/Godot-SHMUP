extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_scene = load("res://Scenes/Enemy1_Bullet.tscn")
var bullet_delay = 0.5
var health = 1
var label = "ENEMY"
const MOVE_SPEED = 150
var move_vec = Vector2(MOVE_SPEED, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(bullet_delay)
	$Timer.start()

func _process(_delta):
	var collision = move_and_collide(move_vec * _delta)
	if collision:
		move_vec = move_vec.bounce(collision.normal)
	
	if (health <= 0):
		get_parent().remove_child(self)
		queue_free()

func shoot():
	var b = bullet_scene.instance()
	b.position = self.position
	b.dir = Vector2(0, 5)
	get_parent().add_child(b)
	
func move():
	pass

func _on_Timer_timeout():
	shoot()
