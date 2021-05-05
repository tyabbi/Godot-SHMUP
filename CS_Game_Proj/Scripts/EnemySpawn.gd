extends Node2D

var enemy_scene = load("res://Scenes/Enemy1.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#for i in range (5):
		var enemy = enemy_scene.instance()
		add_child(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
