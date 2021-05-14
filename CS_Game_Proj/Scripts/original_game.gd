extends Node2D

var enemy_count = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	if (enemy_count == 34):
		assert(get_tree().change_scene("res://Scenes/final.tscn") == OK)
