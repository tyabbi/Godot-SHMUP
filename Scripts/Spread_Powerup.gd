extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var label = "POWERUP"
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
		if (collide.label == "PLAYER"):
			position += Vector2(2000,2000)
			collide.double_shot = false
			collide.spread_shot = true
			collide.time_start = OS.get_unix_time() #store intial start time
	
	if ($RayCast2D2.is_colliding()) :
		var collide = $RayCast2D2.get_collider()
		if (collide.label == "PLAYER"):
			position += Vector2(2000,2000)
			collide.double_shot = false
			collide.spread_shot = true
			collide.time_start = OS.get_unix_time() #store intial start time
	
	if ($RayCast2D3.is_colliding()) :
		var collide = $RayCast2D3.get_collider()
		if (collide.label == "PLAYER"):
			position += Vector2(2000,2000)
			collide.double_shot = false
			collide.spread_shot = true
			collide.time_start = OS.get_unix_time() #store intial start time
	
	if ($RayCast2D4.is_colliding()) :
		var collide = $RayCast2D4.get_collider()
		if (collide.label == "PLAYER"):
			position += Vector2(2000,2000)
			collide.double_shot = false
			collide.spread_shot = true
			collide.time_start = OS.get_unix_time() #store intial start time

func _on_screen_exit():
	queue_free()
