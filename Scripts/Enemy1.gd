extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_scene = load("res://Scenes/Enemy1_Bullet.tscn")
var spread_power_scene = load("res://Scenes/Spread_Powerup.tscn")
var double_power_scene = load("res://Scenes/Double_Powerup.tscn")
var bullet_delay = 0.25
var health = 1
var label = "ENEMY1"
const MOVE_SPEED = 150
var move_vec = Vector2(MOVE_SPEED, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(bullet_delay)
	$Timer.start()
	
	var target = Vector2(self.position.x, self.position.y + 100)
	$Move_Tween.interpolate_property(self, "position", position, target, 1, Tween.TRANS_QUINT, Tween.EASE_OUT)
	$Move_Tween.start()

func _process(delta):
	var collision = move_and_collide(move_vec * delta)
	if collision:
		move_vec = move_vec.bounce(collision.normal)
	
	if (health <= 0):
		randomize()
		
		var p
		var powerup = randi() % 2 + 1
		if(powerup == 1):
			p = spread_power_scene.instance()
		else:
			p = double_power_scene.instance()
			
		var dropRate = randi() % 9
		if(dropRate == 0):
			p.position = self.position
			p.dir = Vector2(0, 5)
			get_parent().add_child(p)
		
		get_parent().remove_child(self)
		queue_free()
		
	position.y += 20 * delta
	
	if ($RayCast2D.is_colliding()) :
		var collide = $RayCast2D.get_collider()
		if (collide.label == "PLAYER"):
			#teleport enemy away from play area upon "death"
			position += Vector2(2000,2000)
			if (collide.health > 0):
				#damage value
				collide.health -= 1
	
	if ($RayCast2D2.is_colliding()) :
		var collide = $RayCast2D2.get_collider()
		if (collide.label == "PLAYER"):
			#teleport enemy away from play area upon "death"
			position += Vector2(2000,2000)
			if (collide.health > 0):
				#damage value
				collide.health -= 1
	
	if ($RayCast2D3.is_colliding()) :
		var collide = $RayCast2D3.get_collider()
		if (collide.label == "PLAYER"):
			#teleport enemy away from play area upon "death"
			position += Vector2(2000,2000)
			if (collide.health > 0):
				#damage value
				collide.health -= 1
	
	if ($RayCast2D4.is_colliding()) :
		var collide = $RayCast2D4.get_collider()
		if (collide.label == "PLAYER"):
			#teleport enemy away from play area upon "death"
			position += Vector2(2000,2000)
			if (collide.health > 0):
				#damage value
				collide.health -= 1
	
func shoot():
	var b = bullet_scene.instance()
	b.position = self.position
	b.dir = Vector2(0, 10)
	get_parent().add_child(b)
	
func move():
	pass

func _on_Timer_timeout():
	shoot()
