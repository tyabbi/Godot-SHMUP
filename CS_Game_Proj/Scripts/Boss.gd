extends Node2D

var label = "BOSS"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_scene = load("res://Scenes/Boss_Bullet.tscn")

var health = 25
const MOVE_SPEED = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(0.05)
	$Timer.start()
	
	var target = Vector2(self.position.x, self.position.y + 100)
	$Tween.interpolate_property(self, "position", position, target, 1, Tween.TRANS_QUINT, Tween.EASE_OUT)
	$Tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rotate(0.05)
	
	if (health <= 0):
		get_parent().get_parent().get_parent().get_node("Main-Game").enemy_count += 1
		print(get_parent().get_parent().get_parent().get_node("Main-Game").enemy_count)
				
		get_parent().remove_child(self)
		queue_free()
	
func spawn_bullets():
	var b1 = bullet_scene.instance()
	b1.position = self.position
	b1.rotation = self.rotation
	b1.dir = Vector2(5, 0)
	
	var b2 = bullet_scene.instance()
	b2.position = self.position
	b2.rotation = self.rotation
	b2.dir = Vector2(0, 5)
	
	var b3 = bullet_scene.instance()
	b3.position = self.position
	b3.rotation = self.rotation
	b3.dir = Vector2(-5, 0)
	
	var b4 = bullet_scene.instance()
	b4.position = self.position
	b4.rotation = self.rotation
	b4.dir = Vector2(0, -5)
	
	get_parent().add_child(b1)
	get_parent().add_child(b2)
	get_parent().add_child(b3)
	get_parent().add_child(b4)

func _on_Timer_timeout():
	spawn_bullets()
