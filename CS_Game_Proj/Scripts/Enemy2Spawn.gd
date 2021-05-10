extends Node2D

var enemy2_scene = load("res://Scenes/Enemy2.tscn")
var spawn_timer = null
var col1 = 0
var col2 = 0
var col3 = 0
var can_spawn = true;

func _ready():
	$Timer.set_wait_time(2)
	$Timer.start()

func _on_Timer_timeout():
	var enemy2 = null
	print("Spawning enemy 2.")
	randomize()
	var enemy2_spawn = randi() % 2 + 1
	print ("var enemy2_spawn: ", enemy2_spawn)
	
	if (enemy2_spawn == 1 and col1 == 0):
		enemy2 = enemy2_scene.instance()
		enemy2.position.x = 150
		col1 += 1
		add_child(enemy2)
		
	elif (enemy2_spawn == 2 and col2 == 0):
		enemy2 = enemy2_scene.instance()
		enemy2.position.x = 300
		col2 += 1
		add_child(enemy2)
		
	elif (enemy2_spawn == 3 and col3 == 0):
		enemy2 = enemy2_scene.instance()
		enemy2.position.x = 450
		col3 += 1
		add_child(enemy2)
