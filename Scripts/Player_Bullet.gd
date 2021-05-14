extends Node2D

var label = "BULLET"

var dir = Vector2(0, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	$RayCast2D.add_exception(StaticBody2D)
	get_node("VisibilityNotifier2D").connect("screen_exited", self, "_on_screen_exit") 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$RayCast2D.add_exception(StaticBody2D)
	self.position += dir.rotated(self.rotation)
	
	if ($RayCast2D.is_colliding()) :
		var collide = $RayCast2D.get_collider()
		if (collide.label == "ENEMY1" || collide.label == "ENEMY2" || collide.label == "BOSS"):
			#teleport enemy away from play area upon "death"
			position += Vector2(2000,2000)
			if (collide.health > 0):
				#damage value
				collide.health -= 1

func _on_screen_exit():
	queue_free()
