extends Node2D

var enemy2_scene = load("res://Scenes/Enemy2.tscn")
var spawn_timer = null
var spawn_counter = 0
var can_spawn = true;

func _ready():
	$Timer.set_wait_time(2)
	$Timer.start()

func _on_Timer_timeout():
	if (spawn_counter >= 3):
		print("Spawning stopped")
		
	else:
