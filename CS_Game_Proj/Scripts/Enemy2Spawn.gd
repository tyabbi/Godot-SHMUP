extends Node2D

var enemy2_scene = load("res://Scenes/Enemy2.tscn")
var spawn_timer = null
var spawn_counter = 0
var colTag = null
var col1 = 0
var col2 = 0
var col3 = 0
var can_spawn = true;

func _ready():
	$Timer.set_wait_time(2)
	$Timer.start()

func _on_Timer_timeout():
	if (spawn_counter >= 6):
		print("Spawning stopped")
		
	else:
		var enemy2 = null
		randomize()
		var enemy2_spawn = randi() % 3 + 1
		print ("var enemy2_spawn: ", enemy2_spawn)
		
		if (enemy2_spawn == 1 and col1 == 0):
			enemy2 = enemy2_scene.instance()
			colTag = "col1"
			enemy2.position.x = 150
			col1 += 1
			spawn_counter += 1
			print("Spawning enemy2 col1")
			add_child(enemy2)
			
		elif (enemy2_spawn == 2 and col2 == 0):
			enemy2 = enemy2_scene.instance()
			colTag = "col2"
			enemy2.position.x = 300
			col2 += 1
			spawn_counter += 1
			print("Spawning enemy2 col2")
			add_child(enemy2)
			
		elif (enemy2_spawn == 3 and col3 == 0):
			enemy2 = enemy2_scene.instance()
			colTag = "col3"
			enemy2.position.x = 450
			col3 += 1
			spawn_counter += 1
			print("Spawning enemy2 col3")
			add_child(enemy2)
