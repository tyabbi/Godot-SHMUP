extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var label = "ENEMYBULLET"
var dir = Vector2(0, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	$RayCast2D.add_exception(StaticBody2D)
	get_node("VisibilityNotifier2D").connect("screen_exited", self, "_on_screen_exit") 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$RayCast2D.add_exception(StaticBody2D)
	self.position += (dir * delta * 350)
	
	if ($RayCast2D.is_colliding()) :
		var collide = $RayCast2D.get_collider()
		if (collide.label == "PLAYER"):
			#teleport enemy away from play area upon "death"
			position += Vector2(2000,2000)
			if (collide.health > 0):
				#damage value
				collide.health -= 1

func _on_screen_exit():
	queue_free()