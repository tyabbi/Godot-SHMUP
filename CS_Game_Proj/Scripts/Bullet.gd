extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$RayCast2D.add_exception(StaticBody2D)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$RayCast2D.add_exception(StaticBody2D)
	self.position += Vector2(1, 0).rotated(self.rotation)
	
	if ($RayCast2D.is_colliding()) :
		print($RayCast2D.get_collider().name)
